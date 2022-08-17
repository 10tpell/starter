#include "stm32f446xx.h"
#include "ISRs.h"
#include "global.h"
//#include <stdio.h>

volatile int toggle_en = 1;

void EXTI15_10_IRQHandler(void) {
    if(EXTI->PR & (1 << BUTTON_PIN)) {
        // Reset PR interrupt flag
        EXTI->PR |= (1 << BUTTON_PIN);
        // Toggle LED
        toggle_en = !toggle_en;
    }
}

void SysTick_Handler(void) {
    if(toggle_en) led_on = !led_on;
    //printf("toggling!\n");
}