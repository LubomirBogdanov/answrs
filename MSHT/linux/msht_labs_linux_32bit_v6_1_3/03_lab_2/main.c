#include <msp430.h> 

/**
 * main.c
 */

void main( void )
{
  volatile unsigned long i;

  WDTCTL = WDTPW | WDTHOLD; //Stop watchdog timer
  PM5CTL0 &= ~LOCKLPM5; //Изключи високоимпедансното състояние на GPIO

  P8DIR |= 0x20; //Конфигурирай извод P8.5 като изход, MSP430FR6989 Userguide -> стр. 386
  P8OUT &= ~0x20; //Инициализирай нивото на P8.5 в логическа нула, MSP430FR6989 Userguide -> стр. 386

  for( ; ; )
  {
    P8OUT ^= 0x20;//Реализирай преобръщане на логическото ниво (toggle) чрез логически оператор от C
    for(i = 0; i < 65535; i++) { } //Реализирай софтуерно закъснениечрез празен for( ; ; ){ } цикъл
  }
}
