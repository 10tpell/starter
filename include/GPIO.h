#ifndef GPIO_H
#define GPIO_H

#define GPIO_NUM_PORTS 7

enum GPIO_pin_mode {
    input = 0,
    output = 1,
    alt = 2,
    analog = 3
};

enum GPIO_pin_output_type {
    push_pull = 0,
    open_drain = 1
};

enum GPIO_pin_pullup_pulldown {
    no_pull = 0,
    pull_up = 1,
    pull_down = 2
};

enum GPIO_pin_speed {
    low = 0,
    medium = 1,
    fast = 2,
    high = 3
};

typedef struct {
    int pin_num;
    enum GPIO_pin_mode mode;
    enum GPIO_pin_output_type otype;
    enum GPIO_pin_pullup_pulldown itype;
    enum GPIO_pin_speed speed;
    int alt;
} GPIO_pin_t;

typedef struct {
    int n_pins;
    GPIO_pin_t * pins[];
} GPIO_port_t;

typedef struct {
    GPIO_port_t * ports[GPIO_NUM_PORTS];
} GPIO_Config_t;

int GPIO_Init(GPIO_Config_t * cfg);
int GPIO_InitPin(int port, GPIO_pin_t * pin);
int GPIO_WritePin(int port, int pin, int val);

#endif