The projects presented in this repo are for the  
MSP‑EXP430FR6989 and BOOSTXL-EDUMKII Educational  
BoosterPack Mark II Plug-in Module  
====================================================  
Note: because the buzzer is a low-resistance element  
(it is not a piezo buzzer) care should be taken not  
to set P2.7 to logic 1 for long periods. That's why  
only the modified library in the original PPMK repo  
should be used. The modifications are in  
hal_7segm_LCD.c file and they turn off the usage of  
P2.7 when using the monochrome LCD.  
  
Note: displaying images is a slow process. Optimizing  
the SPI communication won't yield any better results.  
The dot-matric LCD is simply a too complex task for this  
controller.  
