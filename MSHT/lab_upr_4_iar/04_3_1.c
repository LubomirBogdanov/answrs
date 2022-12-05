#include "io430.h"

// Timer A0 interrupt service routine
#pragma vector = TIMER0_A0_VECTOR
__interrupt void Timer_A (void)
{
  TA0CTL &= ~TAIFG;
  P8OUT ^= 0x10;
}

void main( void )
{
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;

  P8DIR |= 0x10;

  // Тактов генератор DCO = 8MHz, Userguide -> стр. 104
  CSCTL0_H = 0xA5;
  CSCTL1 |= DCORSEL;    //DCORSEL = 1
  CSCTL1 &= ~0x0E;      //Занули DCOFSEL  битовете
  CSCTL1 |= DCOFSEL_3;  //Задай DCOFSEL битовете = 011b = 3h
  CSCTL2 = 0x00;        //Занули всички битове от регистъра CSCTL2
  CSCTL2 |= (SELA_1 | SELS_3 | SELM_3); //ACLK = VLOCLK; SMCLK = DCO; MCLK = DCO
  CSCTL3 = 0x00;        //Занули всички битове от регистъра CSCTL3
  CSCTL3 |= (DIVA_0 | DIVS_0 | DIVM_0); //Всички делители на тактовите сигнали ÷ 1

  TA0CTL = TASSEL_2 | ID_3 | MC_3;      //SMCLK | делител=8 | режим UP/DOWN, Userguide -> стр. 641
  TA0CCTL0 |= CCIE;     //Прекъсване при съвпадение с Capture/Compare рег., Userguide -> стр. 643 
  TA0CCR0 = 50000;       // Compare стойност за сравнение с рег. на таймера, Userguide -> стр. 319 
 
  __enable_interrupt( );

  while(1){
        __bis_SR_register(CPUOFF | GIE);        //Изключи µPU за понижаване на консумацията
   }  
}

