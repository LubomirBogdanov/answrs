#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

enum {
	LED_RED,
	LED_GREEN,
	LED_BLUE,
	LED_ALL
};

Timer_B_initUpModeParam timer_b_init_struct = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000, //Fclk = 16 MHz / 4 = 4 MHz = 250 ns per tick => 4000 * 250 n = 1ms = 1kHz PWM frequency
		TIMER_B_TBIE_INTERRUPT_DISABLE,
		TIMER_B_CCIE_CCR0_INTERRUPT_DISABLE,
		TIMER_B_DO_CLEAR,
		0
};

Timer_B_outputPWMParam timer_b_pwm_init_struct_red = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000,
		TIMER_B_CAPTURECOMPARE_REGISTER_5,
		TIMER_B_OUTPUTMODE_RESET_SET,
		2000
};

Timer_B_outputPWMParam timer_b_pwm_init_struct_blue = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000,
		TIMER_B_CAPTURECOMPARE_REGISTER_2,
		TIMER_B_OUTPUTMODE_RESET_SET,
		2000
};

//------------------TIMER A----------------------
Timer_A_initUpModeParam timer_a_init_struct = {
		TIMER_A_CLOCKSOURCE_SMCLK,
		TIMER_A_CLOCKSOURCE_DIVIDER_4,
		4000, //Fclk = 16 MHz / 4 = 4 MHz = 250 ns per tick => 4000 * 250 n = 1ms = 1kHz PWM frequency
		TIMER_A_TAIE_INTERRUPT_DISABLE,
		TIMER_A_CCIE_CCR0_INTERRUPT_DISABLE,
		TIMER_A_DO_CLEAR,
		0
};

Timer_A_outputPWMParam timer_a_pwm_init_struct_green = {
		TIMER_A_CLOCKSOURCE_SMCLK,
		TIMER_A_CLOCKSOURCE_DIVIDER_4,
		4000,
		TIMER_A_CAPTURECOMPARE_REGISTER_1,
		TIMER_A_OUTPUTMODE_RESET_SET,
		2000
};

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_timer_pwm(void)
{
	//------------------TIMER B----------------------
	GPIO_setAsOutputPin(GPIO_PORT_P2, GPIO_PIN6);
	GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN6, GPIO_PRIMARY_MODULE_FUNCTION);

	GPIO_setAsOutputPin(GPIO_PORT_P3, GPIO_PIN6);
	GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P3, GPIO_PIN6, GPIO_SECONDARY_MODULE_FUNCTION);

	Timer_B_initUpMode(TIMER_B0_BASE, &timer_b_init_struct);
	Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_red);
	Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_blue);

	//------------------TIMER A----------------------
	GPIO_setAsOutputPin(GPIO_PORT_P3, GPIO_PIN3);
	//GPIO_setOutputHighOnPin(GPIO_PORT_P3, GPIO_PIN3);
	GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P3, GPIO_PIN3, GPIO_SECONDARY_MODULE_FUNCTION);
	LCD_C_setPinAsPortFunction(LCD_C_BASE, LCD_C_SEGMENT_LINE_3);

	Timer_A_initUpMode(TIMER_A1_BASE, &timer_a_init_struct);
	Timer_A_outputPWM(TIMER_A1_BASE, &timer_a_pwm_init_struct_green);
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

void set_pwm_led(uint8_t red_green_blue, uint16_t pwm_value)
{
	switch(red_green_blue){
	case LED_RED:
	    timer_b_pwm_init_struct_red.dutyCycle = pwm_value;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_red);
		break;
	case LED_GREEN:
	    timer_a_pwm_init_struct_green.dutyCycle = pwm_value;
	    Timer_A_outputPWM(TIMER_A1_BASE, &timer_a_pwm_init_struct_green);
		break;
	case LED_BLUE:
	    timer_b_pwm_init_struct_blue.dutyCycle = pwm_value;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_blue);
		break;
	case LED_ALL:
	    timer_b_pwm_init_struct_red.dutyCycle = pwm_value;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_red);
	    timer_a_pwm_init_struct_green.dutyCycle = pwm_value;
	    Timer_A_outputPWM(TIMER_A1_BASE, &timer_a_pwm_init_struct_green);
	    timer_b_pwm_init_struct_blue.dutyCycle = pwm_value;
	    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_pwm_init_struct_blue);
		break;
	}
}

int main(void) {
	uint8_t stage = 0;
	unsigned int red = 0, green = 0, blue = 0, all_leds = 0;
    char string[10];
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

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"RGB led", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);

    Timer_A_startCounter(TIMER_A0_BASE, TIMER_A_UP_MODE);
    Timer_B_startCounter(TIMER_B0_BASE, TIMER_B_UP_MODE);


    set_pwm_led(LED_ALL, 0);


    while(1)
    {
        sprintf(string, "R:%04d", red);
        Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 48, 40, OPAQUE_TEXT);
        sprintf(string, "G:%04d", green);
        Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 48, 50, OPAQUE_TEXT);
        sprintf(string, "B:%04d", blue);
        Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 48, 60, OPAQUE_TEXT);

        switch(stage){
        case 0:
        	if(red > 4000){
        		red = 0;
        		stage = 1;
        	}
        	set_pwm_led(LED_RED, red);
        	red+=200;
        	break;
        case 1:
        	if(green > 4000){
        		green = 0;
        		stage = 2;
        	}
        	set_pwm_led(LED_GREEN, green);
        	green+=200;
        	break;
        case 2:
        	if(blue > 4000){
        		blue = 0;
        		stage = 3;
        	}
        	set_pwm_led(LED_BLUE, blue);
        	blue+=200;
        	break;
        case 3:
        	if(all_leds > 4000){
        		all_leds = 0;
        		stage = 0;
        	}
        	set_pwm_led(LED_ALL, all_leds);
        	all_leds+=200;
        	red = green = blue = all_leds;
        	break;
        }


        //__delay_cycles(10000);
    }
}
