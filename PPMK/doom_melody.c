//MIT License
//
//Copyright (c) 2022 HiBit
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

//Ported from:
//https://projecthub.arduino.cc/tmekinyan/playing-popular-songs-with-arduino-and-a-buzzer-546f4a
//https://github.com/hibit-dev/buzzer

#include <stdio.h>
#include <stdbool.h>
#include <driverlib.h>
#include "grlib.h"
#include "Crystalfontz128x128_ST7735.h"

#define NOTE_B0  31
#define NOTE_C1  33
#define NOTE_CS1 35
#define NOTE_D1  37
#define NOTE_DS1 39
#define NOTE_E1  41
#define NOTE_F1  44
#define NOTE_FS1 46
#define NOTE_G1  49
#define NOTE_GS1 52
#define NOTE_A1  55
#define NOTE_AS1 58
#define NOTE_B1  62
#define NOTE_C2  65
#define NOTE_CS2 69
#define NOTE_D2  73
#define NOTE_DS2 78
#define NOTE_E2  82
#define NOTE_F2  87
#define NOTE_FS2 93
#define NOTE_G2  98
#define NOTE_GS2 104
#define NOTE_A2  110
#define NOTE_AS2 117
#define NOTE_B2  123
#define NOTE_C3  131
#define NOTE_CS3 139
#define NOTE_DB3 139
#define NOTE_D3  147
#define NOTE_DS3 156
#define NOTE_EB3 156
#define NOTE_E3  165
#define NOTE_F3  175
#define NOTE_FS3 185
#define NOTE_G3  196
#define NOTE_GS3 208
#define NOTE_A3  220
#define NOTE_AS3 233
#define NOTE_B3  247
#define NOTE_C4  262
#define NOTE_CS4 277
#define NOTE_D4  294
#define NOTE_DS4 311
#define NOTE_E4  330
#define NOTE_F4  349
#define NOTE_FS4 370
#define NOTE_G4  392
#define NOTE_GS4 415
#define NOTE_A4  440
#define NOTE_AS4 466
#define NOTE_B4  494
#define NOTE_C5  523
#define NOTE_CS5 554
#define NOTE_D5  587
#define NOTE_DS5 622
#define NOTE_E5  659
#define NOTE_F5  698
#define NOTE_FS5 740
#define NOTE_G5  784
#define NOTE_GS5 831
#define NOTE_A5  880
#define NOTE_AS5 932
#define NOTE_B5  988
#define NOTE_C6  1047
#define NOTE_CS6 1109
#define NOTE_D6  1175
#define NOTE_DS6 1245
#define NOTE_E6  1319
#define NOTE_F6  1397
#define NOTE_FS6 1480
#define NOTE_G6  1568
#define NOTE_GS6 1661
#define NOTE_A6  1760
#define NOTE_AS6 1865
#define NOTE_B6  1976
#define NOTE_C7  2093
#define NOTE_CS7 2217
#define NOTE_D7  2349
#define NOTE_DS7 2489
#define NOTE_E7  2637
#define NOTE_F7  2794
#define NOTE_FS7 2960
#define NOTE_G7  3136
#define NOTE_GS7 3322
#define NOTE_A7  3520
#define NOTE_AS7 3729
#define NOTE_B7  3951
#define NOTE_C8  4186
#define NOTE_CS8 4435
#define NOTE_D8  4699
#define NOTE_DS8 4978
#define REST     0

Graphics_Context g_sContext;
volatile uint8_t delay_elapsed = 0;

const int doom[] = {
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_FS3, NOTE_D3, NOTE_B2, NOTE_A3, NOTE_FS3, NOTE_B2, NOTE_D3, NOTE_FS3, NOTE_A3, NOTE_FS3, NOTE_D3, NOTE_B2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_B3, NOTE_G3, NOTE_E3, NOTE_G3, NOTE_B3, NOTE_E4, NOTE_G3, NOTE_B3, NOTE_E4, NOTE_B3, NOTE_G4, NOTE_B4,

  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_F3, NOTE_A2, NOTE_A2, NOTE_DS3, NOTE_A2, NOTE_A2, NOTE_E3, NOTE_F3,
  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_F3, NOTE_A2, NOTE_A2, NOTE_DS3,

  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_F3, NOTE_A2, NOTE_A2, NOTE_DS3, NOTE_A2, NOTE_A2, NOTE_E3, NOTE_F3,
  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_A3, NOTE_F3, NOTE_D3, NOTE_A3, NOTE_F3, NOTE_D3, NOTE_C4, NOTE_A3, NOTE_F3, NOTE_A3, NOTE_F3, NOTE_D3,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_CS3, NOTE_CS3, NOTE_CS4, NOTE_CS3, NOTE_CS3, NOTE_B3, NOTE_CS3, NOTE_CS3,
  NOTE_A3, NOTE_CS3, NOTE_CS3, NOTE_G3, NOTE_CS3, NOTE_CS3, NOTE_GS3, NOTE_A3,
  NOTE_B2, NOTE_B2, NOTE_B3, NOTE_B2, NOTE_B2, NOTE_A3, NOTE_B2, NOTE_B2,
  NOTE_G3, NOTE_B2, NOTE_B2, NOTE_F3,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_B3, NOTE_G3, NOTE_E3, NOTE_G3, NOTE_B3, NOTE_E4, NOTE_G3, NOTE_B3, NOTE_E4, NOTE_B3, NOTE_G4, NOTE_B4,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_FS3, NOTE_DS3, NOTE_B2, NOTE_FS3, NOTE_DS3, NOTE_B2, NOTE_G3, NOTE_D3, NOTE_B2, NOTE_DS4, NOTE_DS3, NOTE_B2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_E4, NOTE_B3, NOTE_G3, NOTE_G4, NOTE_E4, NOTE_G3, NOTE_B3, NOTE_D4, NOTE_E4, NOTE_G4, NOTE_E4, NOTE_G3,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_F3, NOTE_A2, NOTE_A2, NOTE_DS3, NOTE_A2, NOTE_A2, NOTE_E3, NOTE_F3,
  NOTE_A2, NOTE_A2, NOTE_A3, NOTE_A2, NOTE_A2, NOTE_G3, NOTE_A2, NOTE_A2,
  NOTE_A3, NOTE_F3, NOTE_D3, NOTE_A3, NOTE_F3, NOTE_D3, NOTE_C4, NOTE_A3, NOTE_F3, NOTE_A3, NOTE_F3, NOTE_D3,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2,

  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_AS2, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3,
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_B3, NOTE_G3, NOTE_E3, NOTE_B2, NOTE_E3, NOTE_G3, NOTE_C4, NOTE_B3, NOTE_G3, NOTE_B3, NOTE_G3, NOTE_E3
};

const int doom_pauses[] = {
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 2,

  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
};

void init_clock_system(void){
    CS_setDCOFreq(CS_DCORSEL_1, CS_DCOFSEL_4); //DCO = 16 MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1); //SMCLK = DCO clock
}

void init_lcd(void){
    Crystalfontz128x128_Init(); // Initializes display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // Set default screen orientation
    Graphics_initContext(&g_sContext, &g_sCrystalfontz128x128); // Initializes graphics context
    Graphics_setForegroundColor(&g_sContext, GRAPHICS_COLOR_RED);
    Graphics_setBackgroundColor(&g_sContext, GRAPHICS_COLOR_WHITE);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);
    Graphics_clearDisplay(&g_sContext);

    Graphics_drawStringCentered(&g_sContext, (int8_t *)"Doom melody", AUTO_STRING_LENGTH, 64, 10, OPAQUE_TEXT);
}

void init(void){
    WDT_A_hold(WDT_A_BASE); // Stop watchdog timer
    PMM_unlockLPM5(); // Disable the GPIO power-on default high-impedance mode to activate previously configured port settings
    FRAMCtl_configureWaitStateControl(FRAMCTL_ACCESS_TIME_CYCLES_1); //Needed for DCO = 16 MHz
    init_clock_system();
    init_lcd();
}

#pragma vector = TIMER1_A0_VECTOR
__interrupt void TIMERA1_ISR(void){
    delay_elapsed = 1;
}

void delay_ms(uint32_t delay){
    int i;

    Timer_A_startCounter(TIMER_A1_BASE, TIMER_A_UP_MODE);
    Timer_A_setCompareValue(TIMER_A1_BASE, TIMER_A_CAPTURECOMPARE_REGISTER_0, 1000);

    for(i = 0; i < delay; i++){
        while(delay_elapsed == 0){ }
        delay_elapsed = 0;
        Timer_A_clear(TIMER_A1_BASE);
    }

    Timer_A_stop(TIMER_A1_BASE);
    Timer_A_clear(TIMER_A1_BASE);
}

void play_tone(uint16_t freq_hz){
    uint16_t period_us;
    period_us = (float)1/freq_hz * 1000000;
    Timer_B_setCompareValue(TIMER_B0_BASE, TIMER_B_CAPTURECOMPARE_REGISTER_0, period_us);
    Timer_B_setCompareValue(TIMER_B0_BASE, TIMER_B_CAPTURECOMPARE_REGISTER_6, period_us/2);
}

void main(void) {
    int size;
    int note;
    uint32_t duration;
    uint32_t pauseBetweenNotes;
    volatile uint32_t i;
    Timer_B_outputPWMParam timer_b_init_struct;
    Timer_A_initUpDownModeParam pause_tim_core;

    init();

    __enable_interrupt();

    timer_b_init_struct.clockSource = TIMER_B_CLOCKSOURCE_SMCLK;
    timer_b_init_struct.clockSourceDivider = TIMER_B_CLOCKSOURCE_DIVIDER_16;
    timer_b_init_struct.compareOutputMode = TIMER_B_OUTPUTMODE_RESET_SET;
    timer_b_init_struct.compareRegister = TIMER_B_CAPTURECOMPARE_REGISTER_6;
    timer_b_init_struct.dutyCycle = 125;
    timer_b_init_struct.timerPeriod = 65535;

    Timer_B_outputPWM(TIMER_B0_BASE, &timer_b_init_struct);

    //J4.40 - P2.7 - TB0.6 (Buzzer)
    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN7, GPIO_PRIMARY_MODULE_FUNCTION);

    pause_tim_core.captureCompareInterruptEnable_CCR0_CCIE = TIMER_A_CCIE_CCR0_INTERRUPT_ENABLE;
    pause_tim_core.clockSource = TIMER_A_CLOCKSOURCE_SMCLK;
    pause_tim_core.clockSourceDivider = TIMER_A_CLOCKSOURCE_DIVIDER_16;
    pause_tim_core.startTimer = false;
    pause_tim_core.timerClear = TIMER_A_DO_CLEAR;
    pause_tim_core.timerInterruptEnable_TAIE = TIMER_A_TAIE_INTERRUPT_DISABLE;
    pause_tim_core.timerPeriod = 65535;

    Timer_A_initUpDownMode(TIMER_A1_BASE, &pause_tim_core);

    Timer_A_initCompareModeParam pause_tim;

    pause_tim.compareInterruptEnable = TIMER_A_CAPTURECOMPARE_INTERRUPT_ENABLE;
    pause_tim.compareOutputMode = TIMER_A_OUTPUTMODE_RESET_SET;
    pause_tim.compareRegister = TIMER_A_CAPTURECOMPARE_REGISTER_0;
    pause_tim.compareValue = 1000;

    Timer_A_initCompareMode(TIMER_A1_BASE, &pause_tim);

    size = 4148;

    while(1){
        for (note = 0; note < size; note++){
          //to calculate the note duration, take one second divided by the note type.
          //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
          duration = 1000 / doom_pauses[note];

          play_tone(doom[note]);

          delay_ms(duration);

          //to distinguish the notes, set a minimum time between them.
          //the note's duration + 30% seems to work well:
          //pauseBetweenNotes = duration * 1.30;
          //delay_ms(pauseBetweenNotes);

          //Not implemented yet!
          //stop the tone playing:
          //play_tone(0);
        }        
    }
}
