#include <stdio.h>
#include <driverlib.h>
#include "HAL_I2C.h"
#include "HAL_TMP006.h"
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

/* Graphic library context */
Graphics_Context g_sContext;

/* Variable for storing temperature value returned from TMP006 */
float temp;

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_lcd(void)
{
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

    Graphics_drawStringCentered(&g_sContext, "Temp Sensor:", AUTO_STRING_LENGTH, 64, 30, OPAQUE_TEXT);
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

    init_lcd();

    Init_I2C_GPIO();
    I2C_init();
    TMP006_init();
    __delay_cycles(100000);
}

int main(void) {
    char string[5];

    init();


    while(1)
    {
        /* Obtain temperature value from TMP006 */
          temp = TMP006_getTemp();

          /* Display temperature */

          sprintf(string, "%f", temp);
          Graphics_drawStringCentered(&g_sContext, (int8_t *)string, 5, 55, 70, OPAQUE_TEXT);

          sprintf(string, "F");
          Graphics_drawStringCentered(&g_sContext, (int8_t *)string, 5, 80, 70, OPAQUE_TEXT);
    }
}
