#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

volatile uint16_t adc_result_X_axis;
volatile uint16_t adc_result_Y_axis;
volatile uint16_t adc_result_Z_axis;

int main(void) {
    char string[13];
	volatile unsigned long i;
	ADC12_B_initParam adc_init_struct = {0};
	ADC12_B_configureMemoryParam adc_memory_struct = {0};

	/* Graphic library context */
	Graphics_Context g_sContext;

    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);
    // Disable the GPIO power-on default high-impedance mode
    // to activate previously configured port settings
    PMM_unlockLPM5();

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz

    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock

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

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Accelerometer", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);

    //-------ADC init--------

    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P8, GPIO_PIN4, GPIO_TERNARY_MODULE_FUNCTION);
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P8, GPIO_PIN5, GPIO_TERNARY_MODULE_FUNCTION);
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P8, GPIO_PIN6, GPIO_TERNARY_MODULE_FUNCTION);

    adc_init_struct.sampleHoldSignalSourceSelect = ADC12_B_SAMPLEHOLDSOURCE_SC;
    adc_init_struct.clockSourceSelect = ADC12_B_CLOCKSOURCE_SMCLK;
    adc_init_struct.clockSourceDivider = ADC12_B_CLOCKDIVIDER_1;
    adc_init_struct.clockSourcePredivider = ADC12_B_CLOCKPREDIVIDER__4;
    adc_init_struct.internalChannelMap = ADC12_B_MAPINTCH0;
    ADC12_B_init(ADC12_B_BASE, &adc_init_struct);
    ADC12_B_setupSamplingTimer(ADC12_B_BASE, ADC12_B_CYCLEHOLD_256_CYCLES, ADC12_B_CYCLEHOLD_4_CYCLES, ADC12_B_MULTIPLESAMPLESENABLE);

    // Enable the ADC12B module
    ADC12_B_enable(ADC12_B_BASE);

    adc_memory_struct.memoryBufferControlIndex = ADC12_B_MEMORY_0;
    adc_memory_struct.inputSourceSelect = ADC12_B_INPUT_A5;
    adc_memory_struct.refVoltageSourceSelect = ADC12_B_VREFPOS_AVCC_VREFNEG_VSS;
    adc_memory_struct.endOfSequence = ADC12_B_NOTENDOFSEQUENCE;
    adc_memory_struct.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;
    adc_memory_struct.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    ADC12_B_configureMemory(ADC12_B_BASE, &adc_memory_struct);

    adc_memory_struct.memoryBufferControlIndex = ADC12_B_MEMORY_1;
    adc_memory_struct.inputSourceSelect = ADC12_B_INPUT_A6;
    adc_memory_struct.refVoltageSourceSelect = ADC12_B_VREFPOS_AVCC_VREFNEG_VSS;
    adc_memory_struct.endOfSequence = ADC12_B_NOTENDOFSEQUENCE;
    adc_memory_struct.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;
    adc_memory_struct.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    ADC12_B_configureMemory(ADC12_B_BASE, &adc_memory_struct);

    adc_memory_struct.memoryBufferControlIndex = ADC12_B_MEMORY_2;
    adc_memory_struct.inputSourceSelect = ADC12_B_INPUT_A7;
    adc_memory_struct.refVoltageSourceSelect = ADC12_B_VREFPOS_AVCC_VREFNEG_VSS;
    adc_memory_struct.endOfSequence = ADC12_B_ENDOFSEQUENCE;
    adc_memory_struct.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;
    adc_memory_struct.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    ADC12_B_configureMemory(ADC12_B_BASE, &adc_memory_struct);


    ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
    ADC12_B_enableInterrupt(ADC12_B_BASE, ADC12_B_IE0 | ADC12_B_IE1 | ADC12_B_IE2, 0, 0);    // Enable memory buffer 0 interrupt

    // Start ADC conversion
    ADC12_B_startConversion(ADC12_B_BASE, ADC12_B_START_AT_ADC12MEM0, ADC12_B_REPEATED_SEQOFCHANNELS);

    while(1)
    {
        __enable_interrupt();
    	__bis_SR_register(CPUOFF + GIE); //Awoken by adc
    	__disable_interrupt();

    	sprintf(string, "X axis: %04d", adc_result_X_axis);
    	Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 64, 40, OPAQUE_TEXT);

    	sprintf(string, "Y axis: %04d", adc_result_Y_axis);
    	Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 64, 50, OPAQUE_TEXT);

    	sprintf(string, "Z axis: %04d", adc_result_Z_axis);
    	Graphics_drawStringCentered(&g_sContext, (int8_t *)string, AUTO_STRING_LENGTH, 64, 60, OPAQUE_TEXT);
    }
}


#pragma vector=ADC12_VECTOR
__interrupt void ADC12_ISR(void)
{
    switch(ADC12IV)
    {
    case  0: break;                         // Vector  0:  No interrupt
    case  2: break;                         // Vector  2:  ADC12BMEMx Overflow
    case  4: break;                         // Vector  4:  Conversion time overflow
    case  6: break;                         // Vector  6:  ADC12BHI
    case  8: break;                         // Vector  8:  ADC12BLO
    case 10: break;                         // Vector 10:  ADC12BIN
    case 12:                                // Vector 12:  ADC12BMEM0
        ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
        adc_result_X_axis = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_0);
        break;
    case 14:                                // Vector 14:  ADC12BMEM1
		ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
		adc_result_Y_axis = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_1);
		break;
    case 16: 		                        // Vector 16:  ADC12BMEM2
		ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
		adc_result_Z_axis = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_2);
		break;
    case 18: break;                         // Vector 18:  ADC12BMEM3
    case 20: break;                         // Vector 20:  ADC12BMEM4
    case 22: break;                         // Vector 22:  ADC12BMEM5
    case 24: break;                         // Vector 24:  ADC12BMEM6
    case 26: break;                         // Vector 26:  ADC12BMEM7
    case 28: break;                         // Vector 28:  ADC12BMEM8
    case 30: break;                         // Vector 30:  ADC12BMEM9
    case 32: break;                         // Vector 32:  ADC12BMEM10
    case 34: break;                         // Vector 34:  ADC12BMEM11
    case 36: break;                         // Vector 36:  ADC12BMEM12
    case 38: break;                         // Vector 38:  ADC12BMEM13
    case 40: break;                         // Vector 40:  ADC12BMEM14
    case 42: break;                         // Vector 42:  ADC12BMEM15
    case 44: break;                         // Vector 44:  ADC12BMEM16
    case 46: break;                         // Vector 46:  ADC12BMEM17
    case 48: break;                         // Vector 48:  ADC12BMEM18
    case 50: break;                         // Vector 50:  ADC12BMEM19
    case 52: break;                         // Vector 52:  ADC12BMEM20
    case 54: break;                         // Vector 54:  ADC12BMEM21
    case 56: break;                         // Vector 56:  ADC12BMEM22
    case 58: break;                         // Vector 58:  ADC12BMEM23
    case 60: break;                         // Vector 60:  ADC12BMEM24
    case 62: break;                         // Vector 62:  ADC12BMEM25
    case 64: break;                         // Vector 64:  ADC12BMEM26
    case 66: break;                         // Vector 66:  ADC12BMEM27
    case 68: break;                         // Vector 68:  ADC12BMEM28
    case 70: break;                         // Vector 70:  ADC12BMEM29
    case 72: break;                         // Vector 72:  ADC12BMEM30
    case 74: break;                         // Vector 74:  ADC12BMEM31
    case 76: break;                         // Vector 76:  ADC12BRDY
    }

    __bic_SR_register_on_exit(LPM3_bits);   // Activate CPU
}

