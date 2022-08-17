#ifndef GLOBAL_H
#define GLOBAL_H

#define LED_PIN 5
#define BUTTON_PIN 13

extern volatile int led_on;
extern volatile int toggle_en;
extern uint32_t core_clock_hz;

int _write( int handle, char* data, int size );
#endif