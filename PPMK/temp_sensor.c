#include <driverlib.h>
#include "HAL_I2C.h"
#include "HAL_TMP006.h"

int main(void) {
    volatile uint32_t i;
    volatile long double temp;

    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);

    // Set P1.0 to output
    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);

    // Disable the GPIO power-on default high-impedance mode
    // to activate previously configured port settings
    PMM_unlockLPM5();

    Init_I2C_GPIO();
    I2C_init();
    TMP006_init();
    __delay_cycles(100000);

    while(1)
    {
        GPIO_toggleOutputOnPin(GPIO_PORT_P1, GPIO_PIN0);

        // Delay
        for(i=10000; i>0; i--);

        temp = TMP006_getTemp();
    }
}
