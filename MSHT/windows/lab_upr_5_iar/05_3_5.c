#include <stdint.h>
#include "io430.h"

int main(void){
    uint8_t lsb, msb;

    WDTCTL = WDTPW | WDTHOLD;

    PM5CTL0 &= ~LOCKLPM5;

    //Turn Wi-Fi module off (has shared pins)
    P3DIR |= BIT2;
    P3OUT &= ~BIT2; //Wi-Fi nHIB = 0V

    //Turn all leds off
    P8DIR |= (BIT4|BIT5|BIT6|BIT7);
    P8OUT &= ~(BIT4|BIT5|BIT6|BIT7);
    P9DIR |= (BIT0|BIT1);
    P9OUT &= ~(BIT0|BIT1);
    P9DIR |= (BIT5|BIT6);
    P9OUT &= ~(BIT5|BIT6);

    //Turn relay off
    P2DIR |= BIT3;
    P2OUT &= ~BIT3;

    //Turn all LEDs off.
    P8DIR |= (BIT4 | BIT5 | BIT6 | BIT7);
    P9DIR |= (BIT0|BIT1|BIT5|BIT6);
    P8OUT &= ~(BIT4 | BIT5 | BIT6 | BIT7);
    P9OUT &= ~(BIT0|BIT1|BIT5|BIT6);

    //MCP41010
    //UCA0CLK - P1.5 - S0
    P1SEL1 |= BIT5;
    P1SEL0 &= ~BIT5;
    LCDCPCTL0 &= ~BIT0;

    //UCA0SIMO - P2.0
    P2SEL1 &= ~BIT0;
    P2SEL0 |= BIT0;

    //UCA0STE - P1.4 - S1
    P1SEL1 |= BIT4;
    P1SEL0 &= ~BIT4;
    LCDCPCTL0 &= ~BIT1;

    UCA0CTLW0 |= UCSWRST;             //Hold module in reset

    UCA0CTLW0 |= (UCMST | UCSYNC | UCMSB | UCMODE_2 | UCSTEM | UCSSEL_3);
    UCA0BRW = 0x08;

    //Mode 0,0
    UCA0CTLW0 &= ~UCCKPL;
    UCA0CTLW0 |= UCCKPH;

    UCA0CTLW0 &= ~UCSWRST;

    __delay_cycles(500000);

    lsb = 0x11;
    msb = 0x9b;

    UCA0TXBUF = lsb;
    while (!(UCA0IFG & UCTXIFG));
    UCA0TXBUF = msb;
    while (!(UCA0IFG & UCTXIFG));

    while(1){
        __low_power_mode_4();
    }

    return 0;
}
