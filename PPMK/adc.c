#include <stdio.h>
#include <driverlib.h>

int main(void) {
    volatile uint16_t adc_result;

    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);
    // Disable the GPIO power-on default high-impedance mode
    // to activate previously configured port settings
    PMM_unlockLPM5();

    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock


    // Set P4.1 and P4.2 as Secondary Module Function Input, LFXT.
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_PJ, GPIO_PIN4 + GPIO_PIN5, GPIO_PRIMARY_MODULE_FUNCTION);
    CS_turnOnLFXT(CS_LFXT_DRIVE_3);

    // Select internal ref = 1.2V
    Ref_A_setReferenceVoltage(REF_A_BASE, REF_A_VREF1_2V);
    // Internal Reference ON
    Ref_A_enableReferenceVoltage(REF_A_BASE);
    // Enables the internal temperature sensor
    Ref_A_enableTempSensor(REF_A_BASE);
    while(!Ref_A_isVariableReferenceVoltageOutputReady(REF_A_BASE));

    ADC12_B_initParam initParam = {0};
    initParam.sampleHoldSignalSourceSelect = ADC12_B_SAMPLEHOLDSOURCE_SC;
    initParam.clockSourceSelect = ADC12_B_CLOCKSOURCE_ADC12OSC;
    initParam.clockSourceDivider = ADC12_B_CLOCKDIVIDER_1;
    initParam.clockSourcePredivider = ADC12_B_CLOCKPREDIVIDER__1;
    initParam.internalChannelMap = ADC12_B_TEMPSENSEMAP;
    ADC12_B_init(ADC12_B_BASE, &initParam);

    // Enable the ADC12B module
    ADC12_B_enable(ADC12_B_BASE);

    ADC12_B_setupSamplingTimer(ADC12_B_BASE, ADC12_B_CYCLEHOLD_256_CYCLES, ADC12_B_CYCLEHOLD_4_CYCLES, ADC12_B_MULTIPLESAMPLESDISABLE);

    ADC12_B_configureMemoryParam configureMemoryParam = {0};
    configureMemoryParam.memoryBufferControlIndex = ADC12_B_MEMORY_0;
    configureMemoryParam.inputSourceSelect = ADC12_B_INPUT_TCMAP;
    configureMemoryParam.refVoltageSourceSelect = ADC12_B_VREFPOS_INTBUF_VREFNEG_VSS;
    configureMemoryParam.endOfSequence = ADC12_B_ENDOFSEQUENCE;
    configureMemoryParam.windowComparatorSelect = ADC12_B_WINDOW_COMPARATOR_DISABLE;
    configureMemoryParam.differentialModeSelect = ADC12_B_DIFFERENTIAL_MODE_DISABLE;
    ADC12_B_configureMemory(ADC12_B_BASE, &configureMemoryParam);
    ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
    // Enable memory buffer 0 interrupt
    ADC12_B_enableInterrupt(ADC12_B_BASE, ADC12_B_IE0, 0, 0);

    __enable_interrupt();


    while(1)
    {
    	ADC12_B_startConversion(ADC12_B_BASE, ADC12_B_START_AT_ADC12MEM0, ADC12_B_REPEATED_SINGLECHANNEL);

    	__bis_SR_register(CPUOFF + GIE); //Awoken by adc
    	__no_operation();

    	adc_result = ADC12_B_getResults(ADC12_B_BASE, ADC12_B_MEMORY_0);
    }
}

#pragma vector=ADC12_VECTOR
__interrupt void ADC12_ISR(void)
{
    switch(__even_in_range(ADC12IV,12))
    {
    case  0: break;                         // Vector  0:  No interrupt
    case  2: break;                         // Vector  2:  ADC12BMEMx Overflow
    case  4: break;                         // Vector  4:  Conversion time overflow
    case  6: break;                         // Vector  6:  ADC12BHI
    case  8: break;                         // Vector  8:  ADC12BLO
    case 10: break;                         // Vector 10:  ADC12BIN
    case 12:                                // Vector 12:  ADC12BMEM0 Interrupt
        ADC12_B_clearInterrupt(ADC12_B_BASE, 0, ADC12_B_IFG0);
        __bic_SR_register_on_exit(LPM3_bits);   // Exit active CPU
        break;                              // Clear CPUOFF bit from 0(SR)
    case 14: break;                         // Vector 14:  ADC12BMEM1
    case 16: break;                         // Vector 16:  ADC12BMEM2
    case 18: break;                         // Vector 18:  ADC12BMEM3
    case 20: break;                         // Vector 20:  ADC12BMEM4
    case 22: break;                         // Vector 22:  ADC12BMEM5
    }
}
