#include "stm32f446xx.h"
#include "global.h"
#include "ISRs.h"
#include "GPIO.h"
// #include <stdio.h>

volatile int led_on = 1;
uint32_t core_clock_hz = 48000000; // Set to default clock speed

static GPIO_pin_t pinA5 = {5, output, push_pull, pull_up, low, 0};
static GPIO_pin_t pinA2 = {2, alt, push_pull, 0, 0, 7};
static GPIO_pin_t pinA3 = {3, alt, push_pull, 0, 0, 7};
static GPIO_pin_t pinC13 = {13, input, 0, pull_up, 0, 0};
static GPIO_port_t portA = {3, {&pinA2, &pinA3, &pinA5}};
static GPIO_port_t portC = {1, {&pinC13}};
static GPIO_Config_t gpio_cfg = {
    {&portA, NULL_PTR, &portC, NULL_PTR, NULL_PTR, NULL_PTR, NULL_PTR}
};

int main(void) {
    uint16_t uart_div;

    /* Configure clock */
    RCC->CR |= (1 << RCC_CR_HSEON_Pos);                   // Enable HSE
    while(!(RCC->CR & (1 << RCC_CR_HSERDY_Pos)));         // Wait until it's ready

    RCC->APB1ENR |= (1 << RCC_APB1ENR_PWREN_Pos);
    PWR->CR |= PWR_CR_VOS;

    // Set FLASH settings for when we update the timer
    // Enable Data and Instruction Caching as well as
    // prefetching instructions
    // And set FLASH Latency to 5 wait stops(?)
    FLASH->ACR |= (1 << FLASH_ACR_DCEN_Pos) | (1 << FLASH_ACR_ICEN_Pos) | (1 << FLASH_ACR_PRFTEN_Pos) | FLASH_ACR_LATENCY_5WS;

    // PLLM = 24
    // PLLN = 360
    // PLLP = 1 (set divider to 4)
    RCC->CFGR &= ~(RCC_PLLCFGR_PLLM | RCC_PLLCFGR_PLLSRC | RCC_PLLCFGR_PLLN | RCC_PLLCFGR_PLLP);
    RCC->CFGR |= (24 << RCC_PLLCFGR_PLLM_Pos | RCC_PLLCFGR_PLLSRC_HSE | 360 << RCC_PLLCFGR_PLLN_Pos | 1 << RCC_PLLCFGR_PLLP_Pos);

    // Enabling PLL
    RCC->CR |= RCC_CR_PLLON;
    while (!(RCC->CR & RCC_CR_PLLRDY)) {};

    // Select the PLL as the system clock source.
    RCC->CFGR  &= ~(RCC_CFGR_SW);
    RCC->CFGR  |=  (RCC_CFGR_SW_PLL);
    while (!(RCC->CFGR & RCC_CFGR_SWS_PLL)) {};

    core_clock_hz = 160000000;

    // Set the global clock speed variable.
    /* Enable and configure GPIO */
    GPIO_Init(&gpio_cfg);

    /* Enable and configure USART2 */
    RCC->APB1ENR |= (1 << RCC_APB1ENR_USART2EN_Pos); // Enable USART2 for APB1
    uart_div = core_clock_hz / 9600;
    USART2->BRR |= (uart_div <<  USART_BRR_DIV_Mantissa_Pos | (uint16_t)(core_clock_hz % 9600) << USART_BRR_DIV_Fraction_Pos);
    USART2->CR1 |= (USART_CR1_UE | USART_CR1_TE | USART_CR1_RE);

    /* ENABLE AND CONFIGURE NVIC/EXTI */
    // Enable SYSCFG peripheral
    RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;

    // Reset EXTI config for this pin
    //SYSCFG->EXTICR[(BUTTON_PIN/4)] &= ~(0xf << ((BUTTON_PIN % 4) * 4));
    SYSCFG->EXTICR[3] &= ~(SYSCFG_EXTICR4_EXTI13_Msk);
    
    // Enable EXTI for pin
    //SYSCFG->EXTICR[(BUTTON_PIN/4)] |= (0x1 << ((BUTTON_PIN % 4) * 4));
    SYSCFG->EXTICR[3] |= (SYSCFG_EXTICR4_EXTI13_PC);
    
    // Setup the button's EXTI line as an interrupt.
    EXTI->IMR  |=  (1 << BUTTON_PIN);
    
    // Disable the 'rising edge' trigger (button release).
    EXTI->RTSR &= ~(1 << BUTTON_PIN);
    SysTick->LOAD |= SysTick_LOAD_RELOAD_Msk & (core_clock_hz);
    SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;
    SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;
    
    // Enable the 'falling edge' trigger (button press).
    EXTI->FTSR |=  (1 << BUTTON_PIN);
    
    // Set priority for NVIC
    NVIC_SetPriority(EXTI15_10_IRQn, 0x03);
    NVIC_EnableIRQ(EXTI15_10_IRQn);

    NVIC_SetPriority(SysTick_IRQn, 0x2);
    NVIC_EnableIRQ(SysTick_IRQn);


    int i = 0; 
    char rxb = '\0';
    int size = 7;   
    while (1) {
        // Wait for a byte of data to arrive.
        while( !( USART2->SR & USART_SR_RXNE ) ) {
        };
        rxb = USART2->DR;
        // Re-transmit the received byte.
        while( !( USART2->SR & USART_SR_TXE ) ) {};
        USART2->DR = rxb;
        if (led_on) {
            GPIO_WritePin(0, pinA5.pin_num, 1);
        } else {
            GPIO_WritePin(0, pinA5.pin_num, 0);
        }
    }
}

// Override the 'write' clib method to implement 'printf' over UART.
int _write( int handle, char* data, int size ) {
    int count = size;
    while( count-- ) {
        while( !( USART2->SR & USART_SR_TXE ) ) {};
        USART2->DR = *data++;
    }
    return size;
}
