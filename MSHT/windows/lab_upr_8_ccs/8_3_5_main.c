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

    P8DIR |= BIT4; //Инициализирай извод 8.4 на изход

    //Мултиплексиране на изводите на LCD сегменти S0 - S21 и S26 - S43,
    //но без P4.0 (S3) и P4.1 (S2)
    LCDCPCTL0 = 0xFFF3;
    LCDCPCTL1 = 0xFC3F;
    LCDCPCTL2 = 0x0FFF;

    //Инициализация на LCD_C
    LCDCCTL0 = LCDDIV__1 | LCDPRE__16 | LCD4MUX | LCDLP; //Делител = 1 |   
                                                         //пред-делител = 16 | 
                                                         //4-изводен MUX | l
                                                         //low-power управление

    LCDCVCTL = VLCD_1 | VLCDREF_0 | LCDCPEN; //Задай напрежение на дисплея 2,6V |
                                             //използвай вътрешно опорно напре-                
                                             //жение | разреши капацитивната помпа

    LCDCCPCTL = LCDCPCLKSYNC; //Разреши синхронизация на тактовия генератор на 
                              //помпата с управлението на дисплея
    LCDCMEMCTL = LCDCLRM; //Нулиране на LCD паметта
    LCDCCTL0 |= LCDON; //Включи дисплея

    //Въведи код за сегментите
    //на буквата "Ж"
    LCDMEM[9] = 0x00;
    LCDMEM[9+1] = 0xfa;

    while(1){
        P8OUT ^= BIT4; //Преобърни светодиод D1
        __delay_cycles(50000);
    }

    return 0;
}