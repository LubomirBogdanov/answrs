#include "io430.h"

void delay()
{
  volatile long i;
  for(i = 0; i < 65535; i++){ }    
}

void main( void )
{  
  WDTCTL = WDTPW + WDTHOLD;
  
  PM5CTL0 &= ~LOCKLPM5;

  P8DIR |= 0xF0;
  P9DIR |= 0x63;
  
  P8OUT &= ~0xF0;
  P9OUT &= ~0x63;
  
  while(1)
  {
      P8OUT |= 0x10;
      delay();
      P8OUT &= ~0x10;
      P8OUT |= 0x20;
      delay();
      P8OUT &= ~0x20;
      P8OUT |= 0x40;
      delay();
      P8OUT &= ~0x40;
      P8OUT |= 0x80;
      delay();
      P8OUT &= ~0x80;
      P9OUT |= 0x01;
      delay();
      P9OUT &= ~0x01;
      P9OUT |= 0x02;
      delay();
      P9OUT &= ~0x02;
      P9OUT |= 0x20;
      delay();
      P9OUT &= ~0x20;
      P9OUT |= 0x40;
      delay();
      P9OUT &= ~0x40;
  }
}
