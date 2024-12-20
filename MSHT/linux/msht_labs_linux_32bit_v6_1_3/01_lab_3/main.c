#include "driverlib.h"

void delay()
{
    volatile long i;
    for (i = 0; i < 65535; i++)
    {
    }
}

int main(void)
{
    WDT_A_hold(WDT_A_BASE);                                                    // Изключи watchdog таймера
    PMM_unlockLPM5();                                                          // Изключи високоимпедансното състоя-
                                                                               // ние на входно-изходните изводи

    GPIO_setAsOutputPin(GPIO_PORT_P8,                                          // Конфигуриране на изводи P8.4, P8.5,
                        GPIO_PIN4 | GPIO_PIN5 | GPIO_PIN6 | GPIO_PIN7);        // P8.6 и P8.7 като изходи

    GPIO_setAsOutputPin(GPIO_PORT_P9,                                          // Конфигуриране на изводи P9.0, P9.1,
                        GPIO_PIN0 | GPIO_PIN1 | GPIO_PIN5 | GPIO_PIN6);        // P9.5 и P9.6 като изходи

    GPIO_setOutputLowOnPin(GPIO_PORT_P8,                                       // Инициализиране на тези изходи в
                           GPIO_PIN4 | GPIO_PIN5 | GPIO_PIN6 | GPIO_PIN7);     // логическа 0
    GPIO_setOutputLowOnPin(GPIO_PORT_P9,
                           GPIO_PIN0 | GPIO_PIN1 | GPIO_PIN5 | GPIO_PIN6);

    while (1)
    {
        GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN4);                      // Включване на D1
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN4);                       // Изключване на D1

        GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN5);                      // Включване на D2
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN5);                       // Изключване на D2

        GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN6);                      // Включване на D3
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN6);                       // Изключване на D3

        GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN7);                      // Включване на D4
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN7);                       // Изключване на D4

        GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN0);                      // Включване на D5
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN0);                       // Изключване на D5

        GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN1);                      // Включване на D6
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN1);                       // Изключване на D6

        GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN5);                      // Включване на D7
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN5);                       // Изключване на D7

        GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN6);                      // Включване на D8
        delay();                                                               // Софтуерно закъснение
        GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN6);                       // Изключване на D8
    }
}
