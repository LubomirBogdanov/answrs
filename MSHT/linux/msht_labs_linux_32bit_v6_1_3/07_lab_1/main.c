#include <msp430.h> 
#include "uartstdio.h" //Включи хедърния файл на UARTStdio, който сте добавили към проекта

void main( void )
{
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;

  UARTStdioInit( );     //Инициализирай UARTStdio функцията -> отвори хедърния файл и виж прототипите на
                        //достъпните функции

  while(1)
  {
   UARTprintf("Hello, dear students!\n\r"); //Извикай printf за MSP430 с произволен стринг -> отвори хедърния файл и виж
           //прототипите на достъпните функции, извикайте printf( ) функцията, както бихте я
           //извикали в конзолна C програма на вашия PC

    __delay_cycles(16000000);
  }
}
