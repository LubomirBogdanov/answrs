#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

/*!
 * \brief Graphic library context, contains all the objects on screen. You may
 * think of it as "canvas" that is tied to the screen and symbols and shapes
 * are drawn on it.
 *
 * \var g_sContext
 */
Graphics_Context g_sContext;

/*!
 * \brief init_clock_system( ) - initializes the microcontroller's clocks. Uses the DCO as
 * main source, running at 16 MHz. The main clock (MCLK) and sub-module clock (SMCLK) have
 * been made equal to the DCO.
 * \return None.
 */
void init_clock_system(void){
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

/*!
 * \brief init_lcd( ) - initializes the 128x128 pixel colour TFT LCD
 * \return None.
 */
void init_lcd(void){
    Crystalfontz128x128_Init(); // Initializes display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // Set default screen orientation
    Graphics_initContext(&g_sContext, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext);

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Square wave generator", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);
}

/*!
 * \brief init( ) - initializes the microcontroller and board
 * \return None.
 */
void init(void){
    WDT_A_hold(WDT_A_BASE); // Stop watchdog timer

    PMM_unlockLPM5(); // Disable the GPIO power-on default high-impedance mode to activate previously configured port settings

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz

    init_clock_system();

    init_lcd();
}

volatile uint16_t up_key_pressed = 0;
volatile uint16_t down_key_pressed = 0;
volatile int16_t frequency_index = 0;

#pragma vector = PORT1_VECTOR
__interrupt void PORT1_ISR(void){
    uint16_t int_status_up;
    uint16_t int_status_down;

    int_status_up = GPIO_getInterruptStatus(GPIO_PORT_P1, GPIO_PIN1);
    int_status_down = GPIO_getInterruptStatus(GPIO_PORT_P1, GPIO_PIN2);
    GPIO_clearInterrupt(GPIO_PORT_P1, 0xFF);

    if(int_status_up == GPIO_PIN1){
        up_key_pressed = 1;
    }

    if(int_status_down == GPIO_PIN2){
        down_key_pressed = 1;
    }
}

//{period, duty}
uint16_t calibrated_frequencies[10][2] = {
                                       {2, 1},
                                       {3, 2},
                                       {4, 2},
                                       {5, 3},
                                       {6, 3},
                                       {7, 4},
                                       {8, 4},
                                       {9, 5},
                                       {10, 5},
                                       {31, 15}
};

void draw_frequency_value(int16_t index_value){
    switch(index_value){
    case 0:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"10.9227 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 1:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"8.19201 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 2:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"6.55361 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 3:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"5.46134 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 4:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"4.68115 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 5:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"4.09601 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 6:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"3.64090 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 7:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"3.27681 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 8:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"2.97891 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    case 9:
        Graphics_drawStringCentered(&g_sContext, (int8_t *)"1.02400 kHz", AUTO_STRING_LENGTH, 64, 64, OPAQUE_TEXT);
        break;
    }
}

/*!
 * \brief main( ) - the main function of the program
 * \return None.
 */
void main(void) {
    int frequency_index_old = 0;
    Timer_B_outputPWMParam timerb_init_struct;
    init();

    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);
    GPIO_setAsOutputPin(GPIO_PORT_P9, GPIO_PIN7);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1, GPIO_PIN1);
    GPIO_selectInterruptEdge(GPIO_PORT_P1, GPIO_PIN1, GPIO_HIGH_TO_LOW_TRANSITION);
    GPIO_clearInterrupt(GPIO_PORT_P1, GPIO_PIN1);
    GPIO_enableInterrupt(GPIO_PORT_P1, GPIO_PIN1);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1, GPIO_PIN2);
    GPIO_selectInterruptEdge(GPIO_PORT_P1, GPIO_PIN2, GPIO_HIGH_TO_LOW_TRANSITION);
    GPIO_clearInterrupt(GPIO_PORT_P1, GPIO_PIN2);
    GPIO_enableInterrupt(GPIO_PORT_P1, GPIO_PIN2);

    //GPIO_setAsOutputPin(GPIO_PORT_P2, GPIO_PIN2);

    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_PJ, GPIO_PIN4 | GPIO_PIN5, GPIO_PRIMARY_MODULE_FUNCTION);
    CS_setExternalClockSource(32768, 0);
    CS_turnOnLFXT(CS_LFXT_DRIVE_3);
    CS_initClockSignal(CS_ACLK, CS_LFXTCLK_SELECT, CS_CLOCK_DIVIDER_1);

    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN2, GPIO_SECONDARY_MODULE_FUNCTION);

    timerb_init_struct.clockSource = TIMER_B_CLOCKSOURCE_ACLK;
    timerb_init_struct.clockSourceDivider = TIMER_B_CLOCKSOURCE_DIVIDER_1;
    timerb_init_struct.compareOutputMode = TIMER_B_OUTPUTMODE_SET_RESET;
    timerb_init_struct.compareRegister = TIMER_B_CAPTURECOMPARE_REGISTER_4;
    timerb_init_struct.timerPeriod = 2;
    timerb_init_struct.dutyCycle = 1;
    Timer_B_outputPWM(TIMER_B0_BASE, &timerb_init_struct);

    draw_frequency_value(frequency_index);

    __enable_interrupt();

    while(1)
    {
        if(up_key_pressed){
            up_key_pressed = 0;
            frequency_index++;
        }

        if(down_key_pressed){
            down_key_pressed = 0;
            frequency_index--;
        }

        if(frequency_index > 9){
            frequency_index = 9;
        }

        if(frequency_index < 0){
            frequency_index = 0;
        }

        if(frequency_index_old != frequency_index){
            frequency_index_old = frequency_index;
            timerb_init_struct.timerPeriod = calibrated_frequencies[frequency_index][0];
            timerb_init_struct.dutyCycle = calibrated_frequencies[frequency_index][1];
            Timer_B_outputPWM(TIMER_B0_BASE, &timerb_init_struct);

            draw_frequency_value(frequency_index);
        }

    	 GPIO_setOutputHighOnPin(GPIO_PORT_P1, GPIO_PIN0);
    	 GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN7);
    	 //GPIO_setOutputHighOnPin(GPIO_PORT_P2, GPIO_PIN2);
    	 __delay_cycles(200000);

    	 GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN0);
         GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN7);
    	 //GPIO_setOutputLowOnPin(GPIO_PORT_P2, GPIO_PIN2);
    	 __delay_cycles(200000);
    }
}
