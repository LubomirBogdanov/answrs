#include <stdint.h>
#include "io430.h"

int main(void){
    volatile unsigned long rx_result;

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

    //23LC512
    //UCB1STE - P4.3
    P4SEL1 |= 0x08;
    P4SEL0 &= ~0x08;
    //UCB1CLK - P3.0 - S34
    P3SEL1 &= ~0x01;
    P3SEL0 |= 0x01;
    LCDCPCTL2 &= ~0x04;
    //UCB1MOSI - P3.1 - S33
    P3SEL1 &= ~0x02;
    P3SEL0 |= 0x02;
    LCDCPCTL2 &= ~0x02;
    //UCB1MISO - P4.7 - S5
    P4SEL1 |= 0x80;
    P4SEL0 &= ~0x80;
    LCDCPCTL0 &= ~0x20;

    UCB1CTLW0 |= UCSWRST;             //Ð—Ð°Ð´Ñ€ÑŠÐ¶ SPI Ð¼Ð¾Ð´ÑƒÐ»Ð° Ð² Ñ€ÐµÑ ÐµÑ‚

    // SPI master | Ñ€ÐµÐ¶Ð¸Ð¼ - Ñ Ð¸Ð½Ñ…Ñ€Ð¾Ð½ÐµÐ½ Ð¸Ð½Ñ‚ÐµÑ€Ñ„ÐµÐ¹Ñ  | Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚ Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ MSB Ð¿ÑŠÑ€Ð²Ð¸ |
    // 4-Ð¸Ð·Ð²Ð¾Ð´ÐµÐ½ SPI (MISO Ð½Ðµ Ñ Ðµ Ð¸Ð·Ð¿Ð¾Ð»Ð·Ð²Ð° Ð² Ð». ÑƒÐ¿Ñ€.) Ñ ÑŠÑ  SS Ð°ÐºÑ‚Ð¸Ð²Ð½Ð¾ Ð½Ð¸Ð²Ð¾ - Ð½Ð¸Ñ ÐºÐ¾ | STE Ð¸Ð·Ð²Ð¾Ð´
    //Ð¸Ð·Ð¿Ð¾Ð»Ð·Ð²Ð°Ð½ ÐºÐ°Ñ‚Ð¾ SS Ñ Ð¸Ð³Ð½Ð°Ð» | Ñ‚Ð°ÐºÑ‚ Ð½Ð° SPI Ð¼Ð¾Ð´ÑƒÐ» -> Ð¾Ñ‚ SMCLK
    UCB1CTLW0 |= (UCMST | UCSYNC | UCMSB | UCMODE_2 | UCSTEM | UCSSEL_3);
    UCB1BRW = 0x08;                   // Ð Ð°Ð·Ð´ÐµÐ»Ð¸ Ð²Ñ…Ð¾Ð´Ð½Ð°Ñ‚Ð° Ñ‡ÐµÑ Ñ‚Ð¾Ñ‚Ð° Ð·Ð° SPI Ð¼Ð¾Ð´ÑƒÐ»Ð° Ð½Ð° 2

    //Mode 0,0
    UCB1CTLW0 &= ~UCCKPL;             //Ð—Ð°Ð´Ð°Ð¹ Ð¿Ð¾Ð»Ñ Ñ€Ð½Ð¾Ñ Ñ‚ Ð½Ð° SCK
    UCB1CTLW0 |= UCCKPH;             //Ð—Ð°Ð´Ð°Ð¹ Ñ„Ð°Ð·Ð° Ð½Ð° ÐœÐžSI

    UCB1CTLW0 &= ~UCSWRST;            //ÐŸÑƒÑ Ð½Ð¸ SPI Ð¼Ð¾Ð´ÑƒÐ»Ð° Ð¾Ñ‚ Ñ€ÐµÑ ÐµÑ‚

    //Set single byte writes
    UCB1IFG = 0x00;
    UCB1TXBUF = 0x01;
    while (!(UCB1IFG & UCTXIFG));

    UCB1TXBUF = 0x00;
    while (!(UCB1IFG & UCTXIFG));
    __delay_cycles(100);

    while(1){
        //Write 0x22 to 0x1000
        UCB1TXBUF = 0x02;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x10;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x00;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x22;
        while (!(UCB1IFG & UCTXIFG));

        __delay_cycles(100);

        //Read from 0x1000
        UCB1TXBUF = 0x03;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x10;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x00;
        while (!(UCB1IFG & UCTXIFG));
        UCB1TXBUF = 0x55;
        while (!(UCB1IFG & UCTXIFG));

        __delay_cycles(100);

        rx_result = UCB1RXBUF;

        rx_result = rx_result; //Put breakpoint here

        __delay_cycles(10000);
    }

    return 0;
}
