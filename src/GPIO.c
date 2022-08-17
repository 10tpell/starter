#include "stm32f446xx.h"
#include "GPIO.h"

int GPIO_Init(GPIO_Config_t * cfg) {
    if (cfg == NULL_PTR) return 0;
    for(int i=0; i<GPIO_NUM_PORTS; i++) {
        if (cfg->ports[i] != NULL_PTR) {
            RCC->AHB1ENR |= (1 << i);
            for(int j=0; j<cfg->ports[i]->n_pins; j++) {
                GPIO_InitPin(i, cfg->ports[i]->pins[j]);
            }
        }
    }
    return 1;
}

int GPIO_InitPin(int port, GPIO_pin_t * pin) {
    GPIO_TypeDef * gpio;
    switch(port) {
        case 0:
            gpio = GPIOA;
            break;
        case 1:
            gpio = GPIOB;
            break;
        case 2: 
            gpio = GPIOC;
            break;
        case 3:
            gpio = GPIOD;
            break;
        case 4:
            gpio = GPIOE;
            break;
        case 5:
            gpio = GPIOF;
            break;
        case 6:
            gpio = GPIOG;
            break;
        case 7:
            gpio = GPIOH;
            break;
        default:
            return 0;
            break; // Should never get here
    }
    // Reset pin mode to input
    gpio->MODER &= ~(0x03 << pin->pin_num*2);
    if(pin->mode == input) {
        // reset pin pullup
        gpio->PUPDR  &= ~(0x3 << (pin->pin_num*2));
        gpio->PUPDR  |=  (pin->itype << (pin->pin_num*2));
    } else if(pin->mode == output) {
        gpio->MODER |= (0x1 << (pin->pin_num*2));
        gpio->OTYPER &= (0 << pin->pin_num);
        gpio->OTYPER |= (pin->otype << pin->pin_num);
    } else if(pin->mode == alt) {
        gpio->MODER |= (0x2 << (pin->pin_num*2));
        gpio->OTYPER &= (0 << pin->pin_num);
        gpio->OTYPER |= (pin->otype << pin->pin_num);
        if(pin->pin_num < 8) {
            gpio->AFR[0] |= (pin->alt << (pin->pin_num*4));
        } else if(pin->pin_num < 16) {
            gpio->AFR[1] |= (pin->alt << (pin->pin_num*4));
        } else {
            return -1;
        }
    }
    return 1;
}

int GPIO_WritePin(int port, int pin, int val) {
    GPIO_TypeDef * gpio;
    switch(port) {
        case 0:
            gpio = GPIOA;
            break;
        case 1:
            gpio = GPIOB;
            break;
        case 2: 
            gpio = GPIOC;
            break;
        case 3:
            gpio = GPIOD;
            break;
        case 4:
            gpio = GPIOE;
            break;
        case 5:
            gpio = GPIOF;
            break;
        case 6:
            gpio = GPIOG;
            break;
        case 7:
            gpio = GPIOH;
            break;
        default:
            return 0;
            break; // Should never get here
    }
    gpio->ODR &= ~(1 << pin);
    gpio->ODR |= (val << pin);
    return 1; 
}