#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

Timer_B_initUpModeParam timer_b_init_struct = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000, //Fclk = 16 MHz / 4 = 4 MHz = 250 ns per tick => 4000 * 250 n = 1ms = 1kHz PWM frequency
		TIMER_B_TBIE_INTERRUPT_DISABLE,
		TIMER_B_CCIE_CCR0_INTERRUPT_DISABLE,
		TIMER_B_DO_CLEAR,
		0
};

Timer_B_outputPWMParam timer_b_pwm_init_struct = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000,
		TIMER_B_CAPTURECOMPARE_REGISTER_6,
		TIMER_B_OUTPUTMODE_RESET_SET,
		2000
};

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_timer_pwm(void)
{
	GPIO_setAsOutputPin(GPIO_PORT_P2, GPIO_PIN7);
	GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN7, GPIO_PRIMARY_MODULE_FUNCTION);
	LCD_C_setPinAsPortFunction(LCD_C_BASE, LCD_C_SEGMENT_LINE_40);

	Timer_B_initUpMode(TIMER_B0_BASE, &timer_b_init_struct);
	Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct);
}

void init(void)
{
    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);
    // Disable the GPIO power-on default high-impedance mode
    // to activate previously configured port settings
    PMM_unlockLPM5();

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz

    init_clock_system();
    init_timer_pwm();
}

int main(void) {
	volatile unsigned long i;

	/* Graphic library context */
	Graphics_Context g_sContext;

	init();

    /* Initializes display */
    Crystalfontz128x128_Init();

    /* Set default screen orientation */
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP);

    /* Initializes graphics context */
    Graphics_initContext(&g_sContext, &g_sCrystalfontz128x128);
    Graphics_setForegroundColor(&g_sContext, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext);

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Buzzer", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);

    Timer_B_startCounter(TIMER_B0_BASE, TIMER_B_UP_MODE);

    while(1)
    {
    	timer_b_pwm_init_struct.timerPeriod = 4000;
	    timer_b_pwm_init_struct.dutyCycle = 2000;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct);
    	__delay_cycles(100000);

    	timer_b_pwm_init_struct.timerPeriod = 2000;
	    timer_b_pwm_init_struct.dutyCycle = 1000;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct);
    	__delay_cycles(100000);

    	timer_b_pwm_init_struct.timerPeriod = 1000;
	    timer_b_pwm_init_struct.dutyCycle = 500;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct);
    	__delay_cycles(100000);

    }
}
