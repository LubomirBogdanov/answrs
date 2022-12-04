#include <stdio.h>
#include <driverlib.h>
#include "hal_7segm_LCD.h"

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

    // Intializes the XT1 crystal oscillator
    CS_turnOnLFXT(CS_LFXT_DRIVE_3);

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

    Init_LCD();
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

void display_time_on_LCD(char *time)
{
	showChar(time[7], pos6);
	showChar(time[6], pos5);
	showChar(time[4], pos4);
	showChar(time[3], pos3);
	showChar(time[1], pos2);
	showChar(time[0], pos1);
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

	init();

    __enable_interrupt();

    clearLCD();

    while(1)
    {
    	rtc_get_time(&hours, &minutes, &seconds);
    	rtc_get_date(&year, &month, &day);

    	sprintf((char *)time_str, "%02d-%02d-%02d", hours, minutes, seconds);
    	sprintf((char *)date_str, "%04d-%02d-%02d", year, month, day);

    	display_time_on_LCD((char *)time_str);

        //Display the 2 colons
        LCDM7 |= 0x04;
        LCDBM7 |= 0x04;
        LCDM20 |= 0x04;
        LCDBM20 |= 0x04;
    }
}


