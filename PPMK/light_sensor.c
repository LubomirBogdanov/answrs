#include <stdio.h>
#include <driverlib.h>
#include "HAL_I2C.h"
#include "HAL_OPT3001.h"
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

float lux;

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
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
    }
}
