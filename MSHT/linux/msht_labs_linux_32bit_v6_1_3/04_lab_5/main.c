#include <msp430.h>

/**
 * main.c
 */
void main( void )
{
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;

  // Тактов генератор DCO = 8MHz, Userguide -> стр. 104
  CSCTL0_H = 0xA5;
  CSCTL1 |= DCORSEL;    //DCORSEL = 1
  CSCTL1 &= ~0x0E;      //Занули DCOFSEL  битовете
  CSCTL1 |= DCOFSEL_3;  //Задай DCOFSEL битовете = 011b = 3h
  CSCTL2 = 0x00;        //Занули всички битове от регистъра CSCTL2
  CSCTL2 |= (SELA_1 | SELS_3 | SELM_3); //ACLK = VLOCLK; SMCLK = DCO; MCLK = DCO
  CSCTL3 = 0x00;        //Занули всички битове от регистъра CSCTL3
  CSCTL3 |= (DIVA_0 | DIVS_0 | DIVM_0); //Всички делители на тактовите сигнали ÷ 1

  //Превключи мултиплексора на извод P2.6 към таймерния модул
  P2DIR |= 0x40;        // P2.6 изход
  P2SEL0 |= 0x40;       // P2.6 изход на
  P2SEL1 &= ~0x40;      // таймерния модул TB0, capture/compare субмодул №5
  LCDCPCTL2 &= ~0x200;  //Изключи сигналът S41 на LCD модула

  //Превключи мултиплексора на извод P2.7 към таймерния модул
  P2DIR |= 0x80;        // P2.7 изход
  P2SEL0 |= 0x80;       // P2.7 изход на
  P2SEL1 &= ~0x80;      // таймерния модул TB0, capture/compare субмодул №5
  LCDCPCTL2 &= ~0x100;  //Изключи сигналът S40 на LCD модула

  TB0CTL |= (TBSSEL_2 | ID_3 | MC_1 | TBCLR); // SMCLK | SMCLK/8 | сумиращ брояч (up mode) | изчисти TBR

  TB0CCTL5 |= OUTMOD_7; //Включи логиката на изходния блок от субмодул №5
  TB0CCTL6 |= OUTMOD_3; //Включи логиката на изходния блок от субмодул №6 в противофаза
                        //на субмодул №5, Userguide -> стр. 667

  TB0CCR0 = 1000;       // PWM период, Userguide -> стр. 669
  TB0CCR5 = 500;       // PWM_TB0.5 коефициент на запълване, Userguide -> стр. 669
  TB0CCR6 = 500;       // PWM_TB0.6  коефициент на запълване, Userguide -> стр. 669

  while(1){
        __bis_SR_register(CPUOFF | GIE);        //Изключи µPU за понижаване на консумацията
   }
}
