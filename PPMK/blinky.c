#include <driverlib.h>

int main(void) {
    volatile uint32_t i;

    // Stop watchdog timer
    WDT_A_hold(WDT_A_BASE);

    // Set P1.0 to output
    GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);

    // Disable the GPIO power-on default high-impedance mode
    PMM_unlockLPM5();

    while(1){
        GPIO_toggleOutputOnPin(GPIO_PORT_P1, GPIO_PIN0);
        for(i=10000; i>0; i--);
    }
}
