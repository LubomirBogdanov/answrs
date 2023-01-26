#include "inc/hw_memmap.h"
#include "wdt_a.h"
#include "gpio.h"
#include "pmm.h"

void delay()
{
  volatile long i;
  for(i = 0; i < 65535; i++){ }    
}

int main( void )
{
  WDT_A_hold(WDT_A_BASE);

  PMM_unlockLPM5();
  
  GPIO_setAsOutputPin(GPIO_PORT_P8, GPIO_PIN4 | GPIO_PIN5 | GPIO_PIN6 | GPIO_PIN7);
  GPIO_setAsOutputPin(GPIO_PORT_P9, GPIO_PIN0 | GPIO_PIN1 | GPIO_PIN5 | GPIO_PIN6);
  
  GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN4 | GPIO_PIN5 | GPIO_PIN6 | GPIO_PIN7);
  GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN0 | GPIO_PIN1 | GPIO_PIN5 | GPIO_PIN6);
                         
  while(1){
    GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN4);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN4);
    GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN5);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN5);
    GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN6);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN6);
    GPIO_setOutputHighOnPin(GPIO_PORT_P8, GPIO_PIN7);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P8, GPIO_PIN7);
    GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN0);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN0);
    GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN1);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN1);
    GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN5);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN5);
    GPIO_setOutputHighOnPin(GPIO_PORT_P9, GPIO_PIN6);
    delay();
    GPIO_setOutputLowOnPin(GPIO_PORT_P9, GPIO_PIN6);
  }
}

