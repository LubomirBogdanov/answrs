#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"
#include "uartstdio.h"
#include <string.h>
#include <stdlib.h>

/*!
 * \brief Graphic library context, contains all the objects on screen. You may
 * think of it as "canvas" that is tied to the screen and symbols and shapes
 * are drawn on it.
 *
 * \var g_sContext
 */
Graphics_Context g_sContext_red;
Graphics_Context g_sContext_green;
Graphics_Context g_sContext_blue;
Graphics_Context g_sContext_white;

/*!
 * \brief init_clock_system( ) - initializes the microcontroller's clocks. Uses the DCO as
 * main source, running at 16 MHz. The main clock (MCLK) and sub-module clock (SMCLK) have
 * been made equal to the DCO.
 * \return None.
 */
void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
    CS_initClockSignal(CS_MCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);
}

/*!
 * \brief init_lcd( ) - initializes the 128x128 pixel colour TFT LCD
 * \return None.
 */
void init_lcd(void)
{
    Crystalfontz128x128_Init(); // Initializes display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // Set default screen orientation
    Graphics_initContext(&g_sContext_red, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext_red, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext_red, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext_red);

    Graphics_initContext(&g_sContext_green, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext_green, GRAPHICS_COLOR_GREEN);
    Graphics_setBackgroundColor(&g_sContext_green, GRAPHICS_COLOR_WHITE);

    Graphics_initContext(&g_sContext_blue, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext_blue, GRAPHICS_COLOR_BLUE);
    Graphics_setBackgroundColor(&g_sContext_blue, GRAPHICS_COLOR_WHITE);

    Graphics_initContext(&g_sContext_white, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext_white, GRAPHICS_COLOR_WHITE);
    Graphics_setBackgroundColor(&g_sContext_white, GRAPHICS_COLOR_WHITE);
}

/*!
 * \brief init( ) - initializes the microcontroller and board
 * \return None.
 */
void init(void)
{
    WDT_A_hold(WDT_A_BASE); // Stop watchdog timer

    PMM_unlockLPM5(); // Disable the GPIO power-on default high-impedance mode to activate previously configured port settings

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz

    init_clock_system();

    init_lcd();
}

void bar_r_init(void){
    Graphics_Rectangle red_struct;
    red_struct.xMax = 40;
    red_struct.xMin = 20;
    red_struct.yMax = 10;
    red_struct.yMin = 110;
    Graphics_drawRectangle(&g_sContext_red, &red_struct);
}

void bar_g_init(void){
    Graphics_Rectangle green_struct;
    green_struct.xMax = 80;
    green_struct.xMin = 60;
    green_struct.yMax = 10;
    green_struct.yMin = 110;
    Graphics_drawRectangle(&g_sContext_green, &green_struct);
}

void bar_b_init(void){
    Graphics_Rectangle blue_struct;
    blue_struct.xMax = 120;
    blue_struct.xMin = 100;
    blue_struct.yMax = 10;
    blue_struct.yMin = 110;
    Graphics_drawRectangle(&g_sContext_blue, &blue_struct);
}

void bar_r(uint16_t fill){
    Graphics_Rectangle white_struct;
    white_struct.xMax = 37;
    white_struct.xMin = 23;
    white_struct.yMax = 13;
    white_struct.yMin = 107;

    Graphics_fillRectangle(&g_sContext_white, &white_struct);

    Graphics_Rectangle red_struct2;
    red_struct2.xMax = 37;
    red_struct2.xMin = 23;
    red_struct2.yMax = 13;
    red_struct2.yMin = 107;

    red_struct2.yMax = 107 - (fill/11);

    Graphics_fillRectangle(&g_sContext_red, &red_struct2);
}

void bar_g(uint16_t fill){
    Graphics_Rectangle white_struct;
    white_struct.xMax = 77;
    white_struct.xMin = 63;
    white_struct.yMax = 13;
    white_struct.yMin = 107;

    Graphics_fillRectangle(&g_sContext_white, &white_struct);

    Graphics_Rectangle green_struct2;
    green_struct2.xMax = 77;
    green_struct2.xMin = 63;
    green_struct2.yMax = 13;
    green_struct2.yMin = 107;

    green_struct2.yMax = 107 - (fill/11);

    Graphics_fillRectangle(&g_sContext_green, &green_struct2);
}

void bar_b(uint16_t fill){
    Graphics_Rectangle white_struct;
    white_struct.xMax = 117;
    white_struct.xMin = 103;
    white_struct.yMax = 13;
    white_struct.yMin = 107;

    Graphics_fillRectangle(&g_sContext_white, &white_struct);

    Graphics_Rectangle blue_struct2;
    blue_struct2.xMax = 117;
    blue_struct2.xMin = 103;
    blue_struct2.yMax = 13;
    blue_struct2.yMin = 107;

    blue_struct2.yMax = 107 - (fill/11);

    Graphics_fillRectangle(&g_sContext_blue, &blue_struct2);
}

//PWM_BLU - J4.37 - P3.6
//PWM_GREEN - J4.38 - P3.3 - TA1.1
//PWM_RED - J4.39 - P2.6
void main(void) {
    char rx_buff[32];
    char cmd[32];
    char param1[32];
    int res;
    char *pch;
    uint16_t pwm_green;
    uint16_t pwm_red;
    uint16_t pwm_blue;

    init();

    bar_r_init();
    bar_g_init();
    bar_b_init();

    UARTStdioInit();
    __delay_cycles(200000);

    Timer_A_outputPWMParam timer_init_struct;

    timer_init_struct.clockSource = TIMER_A_CLOCKSOURCE_SMCLK;
    timer_init_struct.clockSourceDivider = TIMER_A_CLOCKSOURCE_DIVIDER_16;
    timer_init_struct.compareOutputMode = TIMER_A_OUTPUTMODE_RESET_SET;
    timer_init_struct.compareRegister = TIMER_A_CAPTURECOMPARE_REGISTER_1;
    timer_init_struct.dutyCycle = 500;
    timer_init_struct.timerPeriod = 1000;

    Timer_A_outputPWM(TIMER_A1_BASE, &timer_init_struct);

    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P3,
                                                GPIO_PIN3,
                                                GPIO_SECONDARY_MODULE_FUNCTION);

    Timer_B_outputPWMParam timer_init_struct2;

    timer_init_struct2.clockSource = TIMER_B_CLOCKSOURCE_SMCLK;
    timer_init_struct2.clockSourceDivider = TIMER_B_CLOCKSOURCE_DIVIDER_16;
    timer_init_struct2.compareOutputMode = TIMER_B_OUTPUTMODE_RESET_SET;
    timer_init_struct2.compareRegister = TIMER_B_CAPTURECOMPARE_REGISTER_5;
    timer_init_struct2.dutyCycle = 500;
    timer_init_struct2.timerPeriod = 1000;

    Timer_B_outputPWM(TIMER_B0_BASE, &timer_init_struct2);

    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2,
                                                GPIO_PIN6,
                                                GPIO_PRIMARY_MODULE_FUNCTION);


    Timer_B_outputPWMParam timer_init_struct3;

    timer_init_struct3.clockSource = TIMER_B_CLOCKSOURCE_SMCLK;
    timer_init_struct3.clockSourceDivider = TIMER_B_CLOCKSOURCE_DIVIDER_16;
    timer_init_struct3.compareOutputMode = TIMER_B_OUTPUTMODE_RESET_SET;
    timer_init_struct3.compareRegister = TIMER_B_CAPTURECOMPARE_REGISTER_2;
    timer_init_struct3.dutyCycle = 500;
    timer_init_struct3.timerPeriod = 1000;

    Timer_B_outputPWM(TIMER_B0_BASE, &timer_init_struct3);

    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P3,
                                                GPIO_PIN6,
                                                GPIO_SECONDARY_MODULE_FUNCTION);

    while(1){
        UARTprintf("Enter value here: ");

        UARTgets(rx_buff, 32);

        UARTprintf("The value you entered: %s\n\r", rx_buff);


        pch = strtok (rx_buff," ");
        strcpy(cmd, pch);
        UARTprintf ("cmd = %s\n", cmd);

        pch = strtok (NULL, " ");
        strcpy(param1, pch);
        UARTprintf ("param1 = %s\n", param1);

        res = strcmp(cmd, "PWMG");
        if(res == 0){
            pwm_green = atoi(param1);
            Timer_A_setCompareValue(TIMER_A1_BASE,
                                    TIMER_A_CAPTURECOMPARE_REGISTER_1,
                                    pwm_green);
            bar_g(pwm_green);
        }

        res = strcmp(cmd, "PWMR");
        if(res == 0){
            pwm_red = atoi(param1);
            Timer_B_setCompareValue(TIMER_B0_BASE,
                                    TIMER_B_CAPTURECOMPARE_REGISTER_5,
                                    pwm_red);

            bar_r(pwm_red);
        }

        res = strcmp(cmd, "PWMB");
        if(res == 0){
            pwm_blue = atoi(param1);
            Timer_B_setCompareValue(TIMER_B0_BASE,
                                    TIMER_B_CAPTURECOMPARE_REGISTER_2,
                                    pwm_blue);

            bar_b(pwm_blue);
        }
    }
}
