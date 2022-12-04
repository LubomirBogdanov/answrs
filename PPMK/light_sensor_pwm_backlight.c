#include <stdio.h>
#include <driverlib.h>
#include "HAL_I2C.h"
#include "HAL_OPT3001.h"
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
		TIMER_B_CAPTURECOMPARE_REGISTER_5,
		TIMER_B_OUTPUTMODE_RESET_SET,
		2000
};

float lux;

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_timer_pwm(void)
{
	GPIO_setAsOutputPin(GPIO_PORT_P2, GPIO_PIN6);
	GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN6, GPIO_PRIMARY_MODULE_FUNCTION);

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

    Graphics_drawStringCentered(&g_sContext, "Light Sensor:", AUTO_STRING_LENGTH, 64, 30, OPAQUE_TEXT);

    Timer_B_startCounter(TIMER_B0_BASE, TIMER_B_UP_MODE);
    Init_I2C_GPIO();
    I2C_init();

    /* Initialize OPT3001 digital ambient light sensor */
    OPT3001_init();

    __delay_cycles(100000);




    while(1)
    {
        /* Obtain lux value from OPT3001 */
        lux = OPT3001_getLux();

        char string[20];
        sprintf(string, "%f", lux);
        Graphics_drawStringCentered(&g_sContext, (int8_t *)string, 6, 48, 70, OPAQUE_TEXT);

        sprintf(string, "lux");
        Graphics_drawStringCentered(&g_sContext, (int8_t *)string, 3, 86, 70, OPAQUE_TEXT);

        /* Adjust LCD Backlight */
        if (lux < 700){
        	timer_b_pwm_init_struct.dutyCycle = ((2000*0.1) + (lux*0.9))/2000 * 4000;
        }
        else{
        	timer_b_pwm_init_struct.dutyCycle = 4000;
        }

        Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct);
    }
}
