;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

            bic.w   #LOCKLPM5,&PM5CTL0      ; Изключи високоимпедансното състоя-
                                            ; ние на входно-изходните изводи

            bis.b   #10h, &P8DIR      ; Инициализация на порт P8, извод 4 – изход
                                            ; MSP430FR6989 Userguide (стр. 386)

            bic.b   #10h, &P8OUT      ; Установи изводa в логическа 0
                                            ; MSP430FR6989 Userguide (стр. 386)

;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
MainLoop    xor.b   #10h,&P8OUT       ; Смяна състоянието на извод P8.4
                                            ; MSP430FR6989 Userguide (стр. 386)
            call    #Delay                  ; Извикай подпрограма за изчакване

            jmp     MainLoop                ; Върни се на реда с етикет
                                            ; MainLoop

Delay:      mov.w   #65535,R15              ; Запиши в регистър R15 65535
L2          dec.w   R15                     ; Намали стойността в R15 с 1
            jnz     L2                      ; Ако R15 не е 0, върни се в L2
            ret                             ; Излез от подпрограмата

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack

;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
