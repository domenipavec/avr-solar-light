/* File: main.cpp
 * Contains base main function and usually all the other stuff that avr does...
 */
/* Copyright (c) 2012-2013 Domen Ipavec (domen.ipavec@z-v.si)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

//#include <util/delay.h>

#include <avr/io.h>
#include <avr/interrupt.h>
//#include <avr/pgmspace.h>
// #include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>

#include <stdint.h>

#include "bitop.h"

static volatile uint8_t mode = 0;

ISR(WDT_vect) {
	mode += 1;
}

ISR(ADC_vect) {
	mode += 1;
}

int main() {
	// init

	SETBIT(DDRA, PA0);

	// enable watchdog interrupt every 8s
	// WDP2 for testing at 0.5s, WDP3 for 8s in production
	CCP = 0xd8;
	WDTCSR = BIT(WDIE) | BIT(WDP3) | BIT(WDP0);

	// set adc
	ADMUXB = BIT(REFS0);
	ADCSRA = BIT(ADIE) | BIT(ADPS2);
	ADCSRB = BIT(ADLAR);

	// disable digital buffers on most pins
	DIDR0 = 0xff;
	DIDR1 = 0b00001111;

	mode = 0;

	// enable interrupts
	sei();

	uint8_t value;

	for (;;) {
		switch (mode) {
			case 0:
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 1:
				ADMUXA = 2;
				SETBITS(ADCSRA, BIT(ADEN) | BIT(ADSC));
				SETBIT(DDRA, PA3);
				set_sleep_mode(SLEEP_MODE_ADC);
				sleep_mode();
				break;
			case 2:
				wdt_reset();
				value = ADCH;
				CLEARBIT(DDRA, PA3);
				CLEARBIT(ADCSRA, ADEN);
				if (value < 200) {
					CLEARBIT(PORTA, PA0);
					mode = 0;
				}
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 3:
				ADMUXA = 1;
				SETBITS(ADCSRA, BIT(ADEN) | BIT(ADSC));
				set_sleep_mode(SLEEP_MODE_ADC);
				sleep_mode();
				break;
			case 4:
				wdt_reset();
				value = ADCH;
				CLEARBIT(ADCSRA, ADEN);
				if (value < 75) {
					SETBIT(PORTA, PA0);
				} else {
					CLEARBIT(PORTA, PA0);
				}
				mode = 0;
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			default:
				mode = 0;
				break;
		}
	}
}



