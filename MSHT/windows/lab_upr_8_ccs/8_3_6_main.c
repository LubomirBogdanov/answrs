#include <msp430.h> 
#include <stdint.h>


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

void lcd_char(uint8_t ch, uint8_t pos){
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
    }
}

void lcd_str(uint8_t *str){
    int8_t i, j=0;
    for(i = 5; i >= 0; i--){
        lcd_char(str[i], j++);
    }
}

int main(void){
    uint8_t *str_1 = (uint8_t *)"543210";
    uint8_t *str_2 = (uint8_t *)"  9876";

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

    //Напишете програма за тестване на LCD функциите
    lcd_init();

    lcd_str(str_1);
    __delay_cycles(4000000);

    lcd_clr();
    __delay_cycles(1000000);

    lcd_str(str_2);

    while(1){
        P8OUT ^= BIT4; //Преобърни светодиод D1
        __delay_cycles(50000);
    }

    return 0;
}
