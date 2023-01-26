#include <msp430.h> 

/*
 * main.c
 */
void main( void )
{
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;

  //Koнфигурирай мултиплексора за работа с извод P4.3 като UCB1STE (SS)
  P4SEL1 |= 0x08;
  P4SEL0 &= ~0x08;

  //Koнфигурирай мултиплексора за работа с извод P3.0 като UCB1CLK (SCK)
  P3SEL1 &= ~0x01;
  P3SEL0 |= 0x01;
  LCDCPCTL2 &= ~0x04;  //Изключи сигналът S34 на LCD модула

  //Koнфигурирай мултиплексора за работа с извод P3.1 като UCB1SIMO (MOSI)
  P3SEL1 &=~ 0x02;
  P3SEL0 |= 0x02;
  LCDCPCTL2 &= ~0x02;  //Изключи сигналът S33 на LCD модула

  UCB1CTLW0 |= UCSWRST; //Задръж SPI модула в ресет

  // SPI master | режим - синхронен интерфейс | формат на данните MSB първи |
  // 4-изводен SPI (MISO не се използва в л. упр.) със SS активно ниво - ниско | STE извод
  //използван като SS сигнал | такт на SPI модул -> от SMCLK
  UCB1CTLW0 |= (UCMST | UCSYNC | UCMSB | UCMODE_2 | UCSTEM | UCSSEL_3);
  UCB1BRW = 0x02;       // Раздели входната честота за SPI модула на 2

  UCB1CTLW0 |= UCCKPL; //Задай полярност на SCK
                        //стр. 799 от Userguide
  UCB1CTLW0 |= UCCKPH; //Задай фаза на МОSI
                        //стр. 799 от Userguide

  UCB1CTLW0 &= ~UCSWRST;        //Пусни SPI модула от ресет

  while(1){
    UCB1TXBUF = 0x75;   //Запиши числото, което трябва да се изпрати
                        //в съответния изходен (TX) регистър
                        //стр. 801 от Userguide
    __delay_cycles(50);
  }
}
