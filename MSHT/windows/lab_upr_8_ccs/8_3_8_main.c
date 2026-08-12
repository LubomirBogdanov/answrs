#include <msp430.h> 
#include <stdint.h>
#include <stdio.h>

//Масив с числа, съпоставяш позиция от дисплея
//с индекс на LCDMEM регистър
const uint8_t lcd_position_map[6][2] = {
                          {7, 8}, //Позиция 0
                          {14, 15}, //Позиция 1
                          {18, 19}, //Позиция 2
                          {3, 4}, //Позиция 3
                          {5, 6}, //Позиция 4
                          {9, 10}, //Позиция 5
};

//Масив с числа, съпоставящ ASCII код със
//сегменти на цифри от дисплея
const uint8_t lcd_character_map[11][2] = {
                                    {0xfc, 0x00}, //Цифра 0
                                    {0x60, 0x20}, //Цифра 1
                                    {0xdb, 0x00}, //Цифра 2
                                    {0xf3, 0x00}, //Цифра 3
                                    {0x67, 0x00}, //Цифра 4
                                    {0xb7, 0x00}, //Цифра 5
                                    {0xbf, 0x00}, //Цифра 6
                                    {0x83, 0x28}, //Цифра 7
                                    {0xff, 0x00}, //Цифра 8
                                    {0xf7, 0x00}, //Цифра 9
                                    {0x00, 0x00}, //Празен символ (Space)
};

//Масив с числа, съпоставяш десетична точка от дисплея
//с индекс на LCDMEM регистър
const uint8_t lcd_dot_map[5] = {
                          15, //Позиция 0
                          19, //Позиция 1
                          4, //Позиция 2
                          6, //Позиция 3
                          10 //Позиция 4

};

void lcd_init(void){
    //Мултиплексиране на изводите на LCD сегменти S0 - S21 и S26 - S43,
    //но без P4.0 (S3) и P4.1 (S2)
    LCDCPCTL0 = 0xFFF3;
    LCDCPCTL1 = 0xFC3F;
    LCDCPCTL2 = 0x0FFF;

    //Инициализация на LCD_C
    LCDCCTL0 = LCDDIV__1 | LCDPRE__16 | LCD4MUX | LCDLP; //Използване на делител = 1 | пред-делител = 16 | 4-изводен MUX | low-power управление
    LCDCVCTL = VLCD_1 | VLCDREF_0 | LCDCPEN; //Задай напрежение на дисплея 2,6V | използвай вътрешно опорно напрежение | разреши използването на капацитивната помпа
    LCDCCPCTL = LCDCPCLKSYNC; //Разреши синхронизация на тактовия генератор на помпата с управлението на дисплея
    LCDCMEMCTL = LCDCLRM; //Нулиране на LCD паметта
    LCDCCTL0 |= LCDON; //Включи дисплея
}

void lcd_clr(void){
    LCDCMEMCTL |= LCDCLRM; //Нулиране на LCD паметта
}

void lcd_char(uint8_t ch, uint8_t pos, uint8_t dot){
    uint8_t mem_pos_n = 0;
    uint8_t mem_pos_n_plus_1 = 0;

    if(pos < 6){
        mem_pos_n = lcd_position_map[pos][0];
        mem_pos_n_plus_1 = lcd_position_map[pos][1];

        if(ch > 0x2f && ch < 0x3a){
            ch -= 0x30;
            LCDMEM[mem_pos_n] = lcd_character_map[ch][0];
            LCDMEM[mem_pos_n_plus_1] = lcd_character_map[ch][1];
        }

        if(ch == 0x20){
            LCDMEM[mem_pos_n] = lcd_character_map[10][0];
            LCDMEM[mem_pos_n_plus_1] = lcd_character_map[10][1];
        }

        if(dot < 5){
            mem_pos_n = lcd_dot_map[dot];
            LCDMEM[mem_pos_n] |= 0x01;
        }
    }
}

void lcd_str(uint8_t *str){
    int8_t i, j=0;
    for(i = 5; i >= 0; i--){
        lcd_char(str[i], j++, 1);
    }
}

void adc_init(void){
    //Избери функцията на извод P9.2 като вход на АЦП (A10)
    P9SEL0 |= 0x04;
    P9SEL1 |= 0x04;

    ADC12CTL0 &= ~ADC12ENC;     //Забрани преобразуването, ENC = 0
    ADC12CTL0 |= ADC12ON;       //Включи АЦП
    ADC12CTL0 |= ADC12SHT1_15;  //Избери Sample-and-hold време = 512 такта на АЦП-то за
                                //канали 8 - 23
    ADC12CTL1 |= ADC12SSEL_2;   //Избери MCLK за тактов сигнал
    ADC12CTL1 |= ADC12SHP;      //Използвай sampling таймера
    ADC12CTL1 |= ADC12CONSEQ_0; //Избери режим "един канал - едно измерване"
    ADC12CTL1 |= ADC12PDIV_0;   //Раздели тактовия сигнал на 1
    ADC12CTL1 |= ADC12DIV_1;    //Раздели тактовия сигнал на 2 (от втория делител)
    ADC12CTL1 &= ~ADC12ISSH;    //Не инвертирай sample-and-hold сигнала
    ADC12CTL1 |= ADC12SHS_0;    //Използвай ADC12SC бита като сигнал за начало на sample-
                                //and-hold
    ADC12CTL2 &= ~ADC12DF;      //Формат на резултата - прав код
    ADC12CTL2 &= ~ADC12RES_3;   //Занули битовете за разредността
    ADC12CTL2 |= ADC12RES_2;    //Избери 12-битово преобразуване, Userguide стр. 880
//-------------------------MCTL конфигурация----------------------------------------------------------------------
    ADC12MCTL10 &= ~ADC12DIF;   //Избери single-ended преобразуване
    ADC12MCTL10 |= ADC12VRSEL_0;        //Използвай Vdd за горен праг, Vss - за долен.
    ADC12MCTL10 |= ADC12INCH_10;        //Избери A10 за входен канал
    ADC12CTL3 |= ADC12CSTARTADD_10;     //Избери регистър ADC12MEM10 да е приемник на
                                        //резултата от преобразуването
    ADC12MCTL10 |= ADC12EOS;            //Канал А10 е крайният канал за преобразуване
//----------------------------------------------------------------------------------------------------------------------------
    ADC12CTL0 |= ADC12ENC;      //Установи ENC в 1
}

int main(void){
    uint16_t adc_result;
    uint8_t adc_result_str[7];
    float adc_result_f = 3.30;

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

    //Инициализирай LCD дисплея
    lcd_init();

    //Инициализирай АЦП
    adc_init();

    while(1){
        ADC12CTL0 |= ADC12SC;

        while(ADC12CTL1 & ADC12BUSY){ }
        adc_result = ADC12MEM10;

        //Преобразувайте целочислената стойност (uint16_t)
        //от АЦП в число с плаваща запетая (float)
        adc_result_f = adc_result * (3.3/4096);

        //Преобразувайте float в низ от символи само с
        //цифри и с точна дължина от 6 символа.
        //Сложете десетичната запетая така, че да се изобразяват
        //2 цифри след запетаята.
        sprintf((char *)adc_result_str, "  %04.2f", adc_result_f);
        adc_result_str[3] = adc_result_str[2];
        adc_result_str[2] = ' ';

        //Изобрази получения низ от символи
        lcd_str(adc_result_str);

        P8OUT ^= BIT4; //Преобърни светодиод D1
        __delay_cycles(50000);
    }

    return 0;
}
