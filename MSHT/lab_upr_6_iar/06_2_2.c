#include <stdint.h>
#include "io430.h"

#define TMP102ADDR 0x48 //Дефиниране на TMP102 адреса, Datasheet на TMP102 -> стр. 10

// Тактов генератор DCO = 8MHz, Userguide -> стр. 104
void init()
{
  CSCTL0_H = 0xA5;
  CSCTL1 |= DCORSEL;    //DCORSEL = 1
  CSCTL1 &= ~0x0E;      //Занули DCOFSEL  битовете
  CSCTL1 |= DCOFSEL_3;  //Задай DCOFSEL битовете = 011b = 3h
  CSCTL2 = 0x00;        //Занули всички битове от регистъра CSCTL2
  CSCTL2 |= (SELA_1 | SELS_3 | SELM_3); //ACLK = VLOCLK; SMCLK = DCO; MCLK = DCO
  CSCTL3 = 0x00;        //Занули всички битове от регистъра CSCTL3
  CSCTL3 |= (DIVA_0 | DIVS_0 | DIVM_0); //Всички делители на тактовите сигнали ÷ 1
}

void init_I2C()
{
  //Превключи мултиплексора от P4.0 и P4.1 към I2C модула
  P4SEL0 &= ~0x03;      //MSP430FR6989 Datasheet стр. 103
  P4SEL1 |= 0x03;       //MSP430FR6989 Datasheet стр. 103
  LCDCPCTL0 &= ~0x0C;   //S3(P4.0) = 0, S2(P4.1) = 0; MSP430FR6989 Userguide стр. 945

  UCB1CTLW0 |= UCSWRST; //Задръж I2C модула в reset, докато се конфигурира
  UCB1CTLW0 |= (UCMODE_3 | UCMST); //Избери режим I2C | роля - master
  UCB1CTLW0 |= UCSSEL_3;        //Източник на тактов сигнал за I2C модула е SMCLK
  UCB1BRW = 0x50;               //SMCLK / 80 = 100 kbps
  UCB1I2CSA = TMP102ADDR;       //Укажи адреса на TMP102 датчика (slave устройството)
  UCB1CTLW0 &= ~UCSWRST;        //Изведи модула от reset
}

void init_TMP102()
{
  UCB1CTLW0 |= (UCTXSTT | UCTR); //Генерирай start условие, режим предавател
  __delay_cycles(500);  //Изчакай предаването на start условието
  UCB1TXBUF = 0x03;     //Указател към регистър THIGH на датчика TMP102
  while(!(UCB1IFG & UCTXIFG0)){ }       //Изчакай данните от UCB1TXBUF да се изпратят
  UCB1CTLW0 |= UCTXSTP;                 //Генерирай stop условие
}

void main( void )
{
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;

  init();
  init_I2C();
  init_TMP102();

  while(1)
  { 
    UCB1CTLW0 |= (UCTXSTT | UCTR);      //Генерирай start, режим предавател Userguide -> стр. 828
    __delay_cycles(500);                //Изчакай предаването на start условието  
    UCB1TXBUF = 0x03;                   //Задай адрес 0x03 на TMP102 вътрешния указател
    while(!(UCB1IFG & UCTXIFG0)){ }     //Изчакай данните от UCB1TXBUF да се изпратят
    UCB1TXBUF = 0xF0;                   //Произволно число в MSB на ТHIGH регистъра
    while(!(UCB1IFG & UCTXIFG0)){ }     //Изчакай данните от UCB1TXBUF да се изпратят
    UCB1TXBUF = 0x0F;                   //Произволно число в LSB на ТHIGH регистъра 
    while(!(UCB1IFG & UCTXIFG0)){ }     //Изчакай данните от UCB1TXBUF да се изпратят

    UCB1CTLW0 |= UCTXSTP;               //Генерирай stop условие
    __delay_cycles(8000); 
  }
}
