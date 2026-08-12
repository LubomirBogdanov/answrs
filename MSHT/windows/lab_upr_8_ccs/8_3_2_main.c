#include <msp430.h> 

int main(void){
  WDTCTL = WDTPW | WDTHOLD; //Спри стражевия таймер

  PM5CTL0 &= ~LOCKLPM5; //Изкл. високоимп. състояние на изводите на контролера

  FRCTL0 = FRCTLPW | NWAITS_1; //Въведи парола за достъп до регистър FRCTL0,
                               //избери подходящ брой тактове за закъснение
                               //(wait states) -> Userguide стр. 292,
                               //Data sheet -> стр. 29

  //Инициализация на генератор DCO = 16 MHz
  CSCTL0_H = CSKEY >> 8; //Отключи CS регистрите
  CSCTL1 = 0x00;
  CSCTL1 |= DCOFSEL_4; //Избери тактова честота ...
  CSCTL1 |= DCORSEL; //... на DCO = 16MHz
  CSCTL2 |= SELM_3; //Избери MCLK = DCOCLK
  CSCTL3 = 0x00;
  CSCTL3 |= DIVM_0; //Избери делител MCLK = DCOCLK/1
  CSCTL0_H = 0; //Заключи CS регистрите

  P8DIR |= BIT4; //Инициализирай извод 8.4 на изход

  while (1) {
    P8OUT ^= BIT4; //Преобърни светодиод D1
    __delay_cycles(8000000);
  }
}
