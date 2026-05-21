#include <stdint.h>
#include "io430.h"

const uint8_t sine[64] = {
                           128, 140, 152, 165, 176, 188, 198, 208,
                           218, 226, 234, 240, 245, 250, 253, 254,
                           255, 254, 253, 250, 245, 240, 234, 226,
                           218, 208, 198, 188, 176, 165, 152, 140,
                           128, 115, 103, 91, 79, 67, 57, 47,
                           37, 29, 21, 15, 10, 5, 2, 1,
                           0, 1, 2, 5, 10, 15, 21, 29,
                           37, 47, 57, 67, 79, 90, 103, 115
};

int main(void){
    uint8_t i = 0, lsb, msb;

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

    while(1){
        UCA0TXBUF = lsb;
        while (!(UCA0IFG & UCTXIFG));
        UCA0TXBUF = sine[i++];
        while (!(UCA0IFG & UCTXIFG));
        if(i == 64){
            i = 0;
        }
        __delay_cycles(500);
    }

    return 0;
}
