#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

#define	SWITCH_TIME	1000 //In ms

volatile uint8_t time_elapsed;

enum{
	TRAFFIC_LIGHT_RED,
	TRAFFIC_LIGHT_GREEN,
	TRAFFIC_LIGHT_YELLOW
};


Timer_B_initUpModeParam timer_b_init_struct = {
		TIMER_B_CLOCKSOURCE_SMCLK,
		TIMER_B_CLOCKSOURCE_DIVIDER_4,
		4000, //DCO = 16 MHz / 4 = 4 MHz = 250 ns per tick => 4000 * 250 n = 1ms period
		TIMER_B_TBIE_INTERRUPT_DISABLE,
		TIMER_B_CCIE_CCR0_INTERRUPT_ENABLE,
		TIMER_B_DO_CLEAR,
		0
};

void init_timer(void)
{
	Timer_B_initUpMode(TIMER_B0_BASE, &timer_b_init_struct);
	Timer_B_enableCaptureCompareInterrupt(TIMER_B0_BASE, TIMER_B_CAPTURECOMPARE_REGISTER_0);
	Timer_B_enableInterrupt(TIMER_B0_BASE);
}

#pragma vector = TIMER0_B0_VECTOR
__interrupt void TIMER_B0_ISR(void)
{
	static unsigned long interrupt_counter = 0;

	Timer_B_clearTimerInterrupt(TIMER_B0_BASE);
	Timer_B_clear(TIMER_B0_BASE);

	interrupt_counter++;

	if(interrupt_counter == SWITCH_TIME){
		interrupt_counter = 0;
		time_elapsed = 1;
	}
}


/*!
 * \brief Graphic library context, contains all the objects on screen. You may
 * think of it as "canvas" that is tied to the screen and symbols and shapes
 * are drawn on it.
 *
 * \var g_sContext
 */
Graphics_Context g_sContext;

Graphics_Context g_sContext_red;
Graphics_Context g_sContext_yellow;
Graphics_Context g_sContext_green;

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
}

/*!
 * \brief init_lcd( ) - initializes the 128x128 pixel colour TFT LCD
 * \return None.
 */
void init_lcd(void)
{
    Crystalfontz128x128_Init(); // Initializes display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // Set default screen orientation

    g_sContext.clipRegion.yMax = 30;
    Graphics_initContext(&g_sContext, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext);

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Traffic Light", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);
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

    init_timer();
}

void set_traffic_light_on_off(uint8_t light_colour, uint8_t on_off_flag)
{
	switch(light_colour){
	case TRAFFIC_LIGHT_RED:
		if(on_off_flag){
		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_RED);
		    Graphics_fillCircle(&g_sContext_red, 64, 40, 15);
		    Graphics_drawCircle(&g_sContext_red, 64, 40, 15);
		}
		else{
		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_WHITE);
		    Graphics_fillCircle(&g_sContext_red, 64, 40, 15);

		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_RED);
		    Graphics_drawCircle(&g_sContext_red, 64, 40, 15);
		}
	    Graphics_flushBuffer(&g_sContext_red);
		break;
	case TRAFFIC_LIGHT_YELLOW:
		if(on_off_flag){
		    Graphics_setForegroundColor(&g_sContext_yellow, GRAPHICS_COLOR_YELLOW);
		    Graphics_fillCircle(&g_sContext_yellow, 64, 74, 15);
		    Graphics_drawCircle(&g_sContext_yellow, 64, 74, 15);
		}
		else{
		    Graphics_setForegroundColor(&g_sContext_yellow, GRAPHICS_COLOR_WHITE);
		    Graphics_fillCircle(&g_sContext_yellow, 64, 74, 15);

		    Graphics_setForegroundColor(&g_sContext_yellow, GRAPHICS_COLOR_YELLOW);
		    Graphics_drawCircle(&g_sContext_yellow, 64, 74, 15);
		}
	    Graphics_flushBuffer(&g_sContext_yellow);
		break;
	case TRAFFIC_LIGHT_GREEN:
		if(on_off_flag){
		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_GREEN);
		    Graphics_fillCircle(&g_sContext_red, 64, 108, 15);
		    Graphics_drawCircle(&g_sContext_red, 64, 108, 15);
		}
		else{
		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_WHITE);
		    Graphics_fillCircle(&g_sContext_red, 64, 108, 15);

		    Graphics_setForegroundColor(&g_sContext_red, GRAPHICS_COLOR_GREEN);
		    Graphics_drawCircle(&g_sContext_red, 64, 108, 15);
		}
	    Graphics_flushBuffer(&g_sContext_red);
		break;
	}
}

/*!
 * \brief main( ) - the main function of the program
 * \return None.
 */
void main(void) {

	int8_t state = 0;
	uint8_t up_down = 1;
	time_elapsed = 0;

    init();

    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);

    g_sContext_red.clipRegion.yMin = 31;
    g_sContext_red.clipRegion.yMax = 61;
    Graphics_initContext(&g_sContext_red, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setBackgroundColor(&g_sContext_red, GRAPHICS_COLOR_WHITE);
    set_traffic_light_on_off(TRAFFIC_LIGHT_RED, 0);

    g_sContext_yellow.clipRegion.yMin = 62;
    g_sContext_yellow.clipRegion.yMax = 92;
    Graphics_initContext(&g_sContext_yellow, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setBackgroundColor(&g_sContext_yellow, GRAPHICS_COLOR_WHITE);
    set_traffic_light_on_off(TRAFFIC_LIGHT_YELLOW, 0);

    g_sContext_green.clipRegion.yMin = 93;
    g_sContext_green.clipRegion.yMax = 128;
    Graphics_initContext(&g_sContext_green, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setBackgroundColor(&g_sContext_green, GRAPHICS_COLOR_WHITE);
    set_traffic_light_on_off(TRAFFIC_LIGHT_GREEN, 0);


    Timer_B_startCounter(TIMER_B0_BASE, TIMER_B_UP_MODE);

    __enable_interrupt();

    while(1)
    {
    	if(time_elapsed){
    		time_elapsed = 0;

    		switch(state){
    		case 0:
    			set_traffic_light_on_off(TRAFFIC_LIGHT_RED, 1);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_YELLOW, 0);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_GREEN, 0);
    			break;
    		case 1:
    			set_traffic_light_on_off(TRAFFIC_LIGHT_RED, 0);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_YELLOW, 1);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_GREEN, 0);
    			break;
    		case 2:
    			set_traffic_light_on_off(TRAFFIC_LIGHT_RED, 0);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_YELLOW, 0);
    			set_traffic_light_on_off(TRAFFIC_LIGHT_GREEN, 1);
    			break;
    		}

			if(up_down){
				state++;
				if(state == 3){
					up_down = 0;
					state = 1;
				}
			}
			else{
				state--;
				if(state < 0){
					up_down = 1;
					state = 1;
				}
			}

    		GPIO_toggleOutputOnPin(GPIO_PORT_P1, GPIO_PIN0);
    	}
    }
}
