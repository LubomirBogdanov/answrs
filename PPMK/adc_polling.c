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
    Graphics_initContext(&g_sContext, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext);

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Hello, World!", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);
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


//JOY_X - J1.2 - P9.2 - A10
//JOY_Y - J3.26 - P8.7 - A4
//JOY_SEL - J1.5 - P3.2

void main(void) {
    uint8_t pin_value;

    init();

    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);


    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P9,
                                               GPIO_PIN2,
                                               GPIO_TERNARY_MODULE_FUNCTION);

    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P8,
                                               GPIO_PIN7,
                                               GPIO_TERNARY_MODULE_FUNCTION);

    ADC12_B_initParam adc_init_struct;

    adc_init_struct.clockSourceDivider = ADC12_B_CLOCKDIVIDER_4;
    adc_init_struct.clockSourcePredivider = ADC12_B_CLOCKPREDIVIDER__4;
    adc_init_struct.clockSourceSelect = ADC12_B_CLOCKSOURCE_SMCLK;
    adc_init_struct.internalChannelMap = ADC12_B_NOINTCH;
    adc_init_struct.sampleHoldSignalSourceSelect = ADC12_B_SAMPLEHOLDSOURCE_SC;

    ADC12_B_init(ADC12_B_BASE, &adc_init_struct);

    ADC12_B_enable(ADC12_B_BASE);

    ADC12_B_configureMemoryParam adc_ch1_init;

    adc_ch1_init.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    adc_ch1_init.endOfSequence = ADC12_B_NOTENDOFSEQUENCE;
    adc_ch1_init.inputSourceSelect = ADC12_B_INPUT_A4;
    adc_ch1_init.memoryBufferControlIndex = ADC12_B_MEMORY_4;
    adc_ch1_init.refVoltageSourceSelect = ADC12_B_VREFPOS_AVCC_VREFNEG_VSS;
    adc_ch1_init.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;

    ADC12_B_configureMemory(ADC12_B_BASE, &adc_ch1_init);

    ADC12_B_configureMemoryParam adc_ch2_init;

    adc_ch2_init.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    adc_ch2_init.endOfSequence = ADC12_B_ENDOFSEQUENCE;
    adc_ch2_init.inputSourceSelect = ADC12_B_INPUT_A10;
    adc_ch2_init.memoryBufferControlIndex = ADC12_B_MEMORY_10;
    adc_ch2_init.refVoltageSourceSelect = ADC12_B_VREFPOS_AVCC_VREFNEG_VSS;
    adc_ch2_init.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;

    ADC12_B_configureMemory(ADC12_B_BASE, &adc_ch2_init);

    ADC12_B_setupSamplingTimer(ADC12_B_BASE,
                               ADC12_B_CYCLEHOLD_256_CYCLES,
                               ADC12_B_CYCLEHOLD_256_CYCLES,
                               ADC12_B_MULTIPLESAMPLESENABLE);

    GPIO_setAsInputPin(GPIO_PORT_P3, GPIO_PIN2);

    while(1)
    {
        ADC12_B_startConversion(ADC12_B_BASE,
                                ADC12_B_START_AT_ADC12MEM4,
                                ADC12_B_SEQOFCHANNELS);


        uint8_t busy = ADC12_B_BUSY;

        while(busy == ADC12_B_BUSY){
            busy = ADC12_B_isBusy(ADC12_B_BASE);
        }

        uint16_t adc_y = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_4);
        uint16_t adc_x = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_10);

        adc_y = adc_y;
        adc_x = adc_x;

        pin_value = GPIO_getInputPinValue(GPIO_PORT_P3, GPIO_PIN2);

        if(pin_value == GPIO_INPUT_PIN_LOW)
        {
            GPIO_setOutputHighOnPin(GPIO_PORT_P1, GPIO_PIN0);
        }
        else
        {
            GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN0);
        }
    }
}
