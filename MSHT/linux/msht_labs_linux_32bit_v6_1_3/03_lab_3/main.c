#include <msp430.h> 

/*
 * main.c
 */
void main( void )
{
  unsigned long i;

  WDTCTL = WDTPW | WDTHOLD; // Stop watchdog timer to prevent time out reset
  PM5CTL0 &= ~LOCKLPM5; //Изключи високоимпедансното състояние на GPIO

  P8DIR |= 0x30; //Конфигурирай изводи P8.4 и P8.5 като изходи
  P8OUT &= ~0x30; //Инициализирай изводи P8.4 и P8.5 с лог. 0
  P9DIR |= 0x40; //Конфигурирай извод P9.6 като изход
  P9OUT &= ~0x40; //Инициализирай извод P9.6 с лог. 0

  P1DIR &= ~0x02; //Конфигурирай извод P1.1 като вход, MSP430FR6989 Userguide -> стр. 386
  P1REN |= 0x02; //Включи издърпващ резистор на извод P1.1, MSP430FR6989 Userguide -> стр. 387
  P1OUT |= 0x02; //Свържи издърпващия резистор към захранване Vdd, MSP430FR6989 Userguide
                 //-> стр. 386

  while(1)
  {
    P8OUT |= 0x10;
    P8OUT &= ~0x20;
    for(i = 0; i < 40000; i++){}
    P8OUT &= ~0x10;
    P8OUT |= 0x20;
    for(i = 0; i < 40000; i++){}

    if((P1IN & 0x02) == 0)
    {
      P9OUT ^= 0x40;
    }
  }
}

