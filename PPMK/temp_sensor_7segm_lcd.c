#include <stdio.h>
#include <driverlib.h>
#include "uartstdio.h"
#include "hal_7segm_LCD.h"
#include "HAL_TMP006.h"
#include "HAL_I2C.h"

volatile unsigned char mode = 1;

void init_clock_system(void){
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init(void){
    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);
    // Disable the GPIO power-on default high-impedance mode
    // to activate previously configured port settings
    PMM_unlockLPM5();

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz

    init_clock_system();
}

long double convert_temp(long double tempr_fahren){
    return (tempr_fahren - 32)*0.555555556;
}

void show_char(char c, int position){
    if (c == ' '){
        //Display space
        LCDMEM[position] = 0;
        LCDMEM[position+1] = 0;
    }
    else if (c >= '0' && c <= '9'){
        if(position == pos3){
            //Display digit with dot
            LCDMEM[position] = digit[c-48][0];
            LCDMEM[position+1] = 0x01;
        }
        else{
            //Display digit
            LCDMEM[position] = digit[c-48][0];
            LCDMEM[position+1] = digit[c-48][1];
        }
    }
}

void display_str(char *str){
    show_char(str[0], pos2);
    show_char(str[1], pos3);
    show_char(str[3], pos4);
    show_char(str[4], pos5);
    show_char(str[5], pos6);
}

//I2C_SCL = J1.9 - P4.1 - S2
//I2C_SDA = J1.10 - P4.0 - S3
//TEMP_DRDY = J2.11 - P4.7 - S5
int main(void) {
    volatile long double obj_tempr;
    volatile long double obj_tempr_c;
    char display_buff[6+1];

    init();

    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_PJ, GPIO_PIN4 | GPIO_PIN5, GPIO_PRIMARY_MODULE_FUNCTION);
    CS_setExternalClockSource(32768, 0);
    CS_turnOnLFXT(LFXTDRIVE_3);
    CS_initClockSignal(CS_ACLK, CS_LFXTCLK_SELECT, CS_CLOCK_DIVIDER_1);

    Init_LCD();

    //Disable S2, S3, S5 to allow I2C on those pins
    LCDCPCTL0 &= ~BIT2;
    LCDCPCTL0 &= ~BIT3;
    LCDCPCTL0 &= ~BIT5;

    I2C_init();
    Init_I2C_GPIO();
    TMP006_init();

    while(1){
        obj_tempr = TMP006_getTemp();
        obj_tempr_c = convert_temp(obj_tempr);
        snprintf(display_buff, 6+1, "%6.3Lf", obj_tempr_c);
        display_str(display_buff);
    }
}
