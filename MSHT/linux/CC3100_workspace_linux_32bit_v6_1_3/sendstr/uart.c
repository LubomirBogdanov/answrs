/*
 * uart.c
 *
 *  Created on: 13.08.2014
 *      Author: lbogdanov
 */
#include "uart.h"

#include  <msp430.h>

void initUART()
{
    //N = fBRCLK / baud rate = 16 000 000 / 9600 = 1666.666
    //OS16 = 1, UCBRx = INT(N/16) = 1666.666 / 16 = 104.166 = 104 (0x68, 0x00)
    //UCBRFx = INT([(N/16) – INT(N/16)] × 16) = 0.166 x 16 = 2.656 = 2
    //UCBRSx = N - INT(N) = 0,666 => in Table 30-4 => 0xD6


    //N = fBRCLK / baud rate = 8 000 000 / 9600 = 833.33333
    //OS16 = 1, UCBRx = INT(N/16) = 833.33333 / 16 = 52.083 = 52 (0x34, 0x00)
    //UCBRFx = INT([(N/16) – INT(N/16)] × 16) = (52.083 - 52) x 16 = 1.328 = 1
    //UCBRSx = N - INT(N) = 833.33333 - 833 = 0.3333 => in Table 30-4 => 0x49

    // Configure UART pins
    P4SEL0 |= (BIT2 | BIT3);
    P4SEL1 &= ~(BIT2 | BIT3);
    // Configure UART 0
    UCA0CTLW0 |= UCSWRST;  //Hold in reset while configuring
    UCA0CTLW0 = UCSSEL_2;  // Set SMCLK = 8 000 000 as UCBRCLK

    UCA0CTLW0 |= UCMODE_0; //Operate as UART
    UCA0BR0 = 0x34;
    UCA0BR1 = 0x0;


    UCA0MCTLW |= UCOS16;
    UCA0MCTLW |= (0x49UL<<8);
    UCA0MCTLW |= UCBRF_2;

    UCA0CTLW0 &= ~UCSWRST; // release from reset

}

void UARTCharPut(char TXChar)
{
    while(!(UCA0IFG & UCTXIFG)){ }
    UCA0TXBUF = TXChar;
}

char UARTCharGet( )
{
    char tempCh;

    while( !(UCA0IFG&UCRXIFG) ) { }     //Wait for RX buffer to receive a char.
    tempCh = UCA0RXBUF;

    UCA0TXBUF = tempCh;                //Echo the
    while( UCA0STATW & UCBUSY ) { }     //received char.

    return tempCh;
}