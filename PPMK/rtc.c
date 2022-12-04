#include <stdio.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

Calendar currentTime;

void init_clock_system(void)
{
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_rtc(void)
{
    // Set P4.1 and P4.2 as Secondary Module Function Input, LFXT.
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_PJ, GPIO_PIN4 | GPIO_PIN5, GPIO_PRIMARY_MODULE_FUNCTION);

    // Set RTC modulo to 327-1 to trigger interrupt every ~10 ms
    RTC_C_holdClock(RTC_C_BASE);

    RTC_C_definePrescaleEvent(RTC_C_BASE, RTC_C_PRESCALE_0, RTC_C_PSEVENTDIVIDER_32);
    //RTC_C_enableInterrupt(RTC_C_BASE, RTC_C_PRESCALE_TIMER0_INTERRUPT | RTC_C_CLOCK_READ_READY_INTERRUPT | RTC_C_TIME_EVENT_INTERRUPT);
    RTC_C_startCounterPrescale(RTC_C_BASE, RTC_C_PRESCALE_0);

    //Setup Current Time for Calendar
    currentTime.Seconds = 0;
    currentTime.Minutes = 0;
    currentTime.Hours = 0;
    currentTime.DayOfWeek = 0;
    currentTime.DayOfMonth = 21;
    currentTime.Month = 9;
    currentTime.Year = 2016;

    RTC_C_initCounter(RTC_C_BASE, RTC_C_CLOCKSELECT_32KHZ_OSC, RTC_C_COUNTERSIZE_16BIT);
    RTC_C_initCalendar(RTC_C_BASE, &currentTime, RTC_C_FORMAT_BINARY);
    RTC_C_startClock(RTC_C_BASE);
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

    init_rtc();
}

void rtc_get_time(uint8_t *hours, uint8_t *minutes, uint8_t *seconds)
{
    currentTime = RTC_C_getCalendarTime(RTC_C_BASE);
    *hours = currentTime.Hours;
    *minutes = currentTime.Minutes;
    *seconds = currentTime.Seconds;
}

void rtc_get_date(uint16_t *year, uint8_t *month, uint8_t *day)
{
	currentTime = RTC_C_getCalendarTime(RTC_C_BASE);
	*year = currentTime.Year;
	*month = currentTime.Month;
	*day = currentTime.DayOfMonth;
}

int main(void) {
	uint8_t seconds;
	uint8_t minutes;
	uint8_t hours;
	uint8_t day;
	uint8_t month;
	uint16_t year;

	uint8_t time_str[30];
	uint8_t date_str[30];

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

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"RTC clock", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);

    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);
    GPIO_setAsOutputPin(GPIO_PORT_P9, GPIO_PIN7);

    GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN0);
    GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN7);

    GPIO_setAsInputPin(GPIO_PORT_P3, GPIO_PIN0 | GPIO_PIN1);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1, GPIO_PIN1 | GPIO_PIN2);

    GPIO_selectInterruptEdge(GPIO_PORT_P3, GPIO_PIN0 | GPIO_PIN1, GPIO_HIGH_TO_LOW_TRANSITION);
    GPIO_selectInterruptEdge(GPIO_PORT_P1, GPIO_PIN1 | GPIO_PIN2, GPIO_HIGH_TO_LOW_TRANSITION);

    GPIO_clearInterrupt(GPIO_PORT_P3, GPIO_PIN0 | GPIO_PIN1);
    GPIO_clearInterrupt(GPIO_PORT_P1, GPIO_PIN1 | GPIO_PIN2);

    GPIO_enableInterrupt(GPIO_PORT_P3, GPIO_PIN0 | GPIO_PIN1);
    GPIO_enableInterrupt(GPIO_PORT_P1, GPIO_PIN1 | GPIO_PIN2);

    // Intializes the XT1 crystal oscillator
    CS_turnOnLFXT(CS_LFXT_DRIVE_3);

    __enable_interrupt();

    while(1)
    {
    	rtc_get_time(&hours, &minutes, &seconds);
    	rtc_get_date(&year, &month, &day);

    	sprintf((char *)time_str, "%02d-%02d-%02d", hours, minutes, seconds);
    	sprintf((char *)date_str, "%04d-%02d-%02d", year, month, day);

    	Graphics_drawStringCentered(&g_sContext, (int8_t *)time_str, AUTO_STRING_LENGTH, 64, 30, OPAQUE_TEXT);
    	Graphics_drawStringCentered(&g_sContext, (int8_t *)date_str, AUTO_STRING_LENGTH, 64, 40, OPAQUE_TEXT);
    }
}

#pragma vector = PORT3_VECTOR
__interrupt void PORT3_ISR(void)
{
	uint16_t int_status;

    int_status = GPIO_getInterruptStatus(GPIO_PORT_P3, 0xFF);
    GPIO_clearInterrupt(GPIO_PORT_P3, 0xFF);

    if(int_status & GPIO_PIN0){
    	GPIO_toggleOutputOnPin(GPIO_PORT_P1, GPIO_PIN0);
    }

    if(int_status & GPIO_PIN1){
    	GPIO_toggleOutputOnPin(GPIO_PORT_P9, GPIO_PIN7);
    }

    __delay_cycles(30000);
}

#pragma vector = PORT1_VECTOR
__interrupt void PORT1_ISR(void)
{
	uint16_t int_status;

    int_status = GPIO_getInterruptStatus(GPIO_PORT_P1, 0xFF);
    GPIO_clearInterrupt(GPIO_PORT_P1, 0xFF);

    if(int_status & GPIO_PIN1){
    	GPIO_toggleOutputOnPin(GPIO_PORT_P1, GPIO_PIN0);
    }

    if(int_status & GPIO_PIN2){
    	GPIO_toggleOutputOnPin(GPIO_PORT_P9, GPIO_PIN7);
    }

    __delay_cycles(30000);
}

