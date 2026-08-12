#include <msp430.h> 

int main(void){
	WDTCTL = WDTPW | WDTHOLD; //Спри стражевия таймер
	
	PM5CTL0 &= ~LOCKLPM5; //Изкл. високоимп. състояние на изводите на контролера

	PJSEL0 = BIT4 | BIT5; //Мултиплексирай изводи PJ.4 и PJ.5 за работа с LFXT

	//Инициализация на генератор LFXT = 32.768 kHz
	CSCTL0_H = CSKEY >> 8; //Отключи CS регистрите
	CSCTL2 |= SELA_0; //Избери ACLK = LFXTCLK
	CSCTL3 |= DIVA_0; //Избери делител ACLK = LFXTCLK / 1
	CSCTL4 &= ~LFXTBYPASS; //Използвай кварцов резонатор
	CSCTL4 |= LFXTDRIVE_3; //Избери максимална товароносимост на усилвателя
	CSCTL4 &= ~LFXTOFF; //Разреши използването на LFXT
	do{
	    CSCTL5 &= ~LFXTOFFG; //Нулиране на LFXTOFF флаг
	    SFRIFG1 &= ~OFIFG; //Нулиране на OFIFG флаг
	}while (SFRIFG1 & OFIFG); //Тестване на флаг за грешка на тактовия генератор
	CSCTL0_H = 0; //Заключи CS регистрите

	//Mултиплексирай извод P4.1 (S2) = ACLK
	P4DIR |= BIT1;
	P4SEL0 |= BIT1;
	P4SEL1 |= BIT1;
	LCDCPCTL0 &= ~BIT2;

	while(1){

	}

	return 0;
}