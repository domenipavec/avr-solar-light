
avr.out:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	1d c0       	rjmp	.+58     	; 0x3c <__ctors_end>
   2:	2c c0       	rjmp	.+88     	; 0x5c <__bad_interrupt>
   4:	2b c0       	rjmp	.+86     	; 0x5c <__bad_interrupt>
   6:	2a c0       	rjmp	.+84     	; 0x5c <__bad_interrupt>
   8:	2a c0       	rjmp	.+84     	; 0x5e <__vector_4>
   a:	28 c0       	rjmp	.+80     	; 0x5c <__bad_interrupt>
   c:	27 c0       	rjmp	.+78     	; 0x5c <__bad_interrupt>
   e:	26 c0       	rjmp	.+76     	; 0x5c <__bad_interrupt>
  10:	25 c0       	rjmp	.+74     	; 0x5c <__bad_interrupt>
  12:	24 c0       	rjmp	.+72     	; 0x5c <__bad_interrupt>
  14:	23 c0       	rjmp	.+70     	; 0x5c <__bad_interrupt>
  16:	22 c0       	rjmp	.+68     	; 0x5c <__bad_interrupt>
  18:	21 c0       	rjmp	.+66     	; 0x5c <__bad_interrupt>
  1a:	32 c0       	rjmp	.+100    	; 0x80 <__vector_13>
  1c:	1f c0       	rjmp	.+62     	; 0x5c <__bad_interrupt>
  1e:	1e c0       	rjmp	.+60     	; 0x5c <__bad_interrupt>
  20:	1d c0       	rjmp	.+58     	; 0x5c <__bad_interrupt>
  22:	1c c0       	rjmp	.+56     	; 0x5c <__bad_interrupt>
  24:	1b c0       	rjmp	.+54     	; 0x5c <__bad_interrupt>
  26:	1a c0       	rjmp	.+52     	; 0x5c <__bad_interrupt>
  28:	19 c0       	rjmp	.+50     	; 0x5c <__bad_interrupt>
  2a:	18 c0       	rjmp	.+48     	; 0x5c <__bad_interrupt>
  2c:	17 c0       	rjmp	.+46     	; 0x5c <__bad_interrupt>
  2e:	16 c0       	rjmp	.+44     	; 0x5c <__bad_interrupt>
  30:	15 c0       	rjmp	.+42     	; 0x5c <__bad_interrupt>
  32:	14 c0       	rjmp	.+40     	; 0x5c <__bad_interrupt>
  34:	13 c0       	rjmp	.+38     	; 0x5c <__bad_interrupt>
  36:	12 c0       	rjmp	.+36     	; 0x5c <__bad_interrupt>
  38:	11 c0       	rjmp	.+34     	; 0x5c <__bad_interrupt>
  3a:	10 c0       	rjmp	.+32     	; 0x5c <__bad_interrupt>

0000003c <__ctors_end>:
  3c:	11 24       	eor	r1, r1
  3e:	1f be       	out	0x3f, r1	; 63
  40:	cf ef       	ldi	r28, 0xFF	; 255
  42:	d2 e0       	ldi	r29, 0x02	; 2
  44:	de bf       	out	0x3e, r29	; 62
  46:	cd bf       	out	0x3d, r28	; 61

00000048 <__do_clear_bss>:
  48:	21 e0       	ldi	r18, 0x01	; 1
  4a:	a0 e0       	ldi	r26, 0x00	; 0
  4c:	b1 e0       	ldi	r27, 0x01	; 1
  4e:	01 c0       	rjmp	.+2      	; 0x52 <.do_clear_bss_start>

00000050 <.do_clear_bss_loop>:
  50:	1d 92       	st	X+, r1

00000052 <.do_clear_bss_start>:
  52:	a1 30       	cpi	r26, 0x01	; 1
  54:	b2 07       	cpc	r27, r18
  56:	e1 f7       	brne	.-8      	; 0x50 <.do_clear_bss_loop>
  58:	24 d0       	rcall	.+72     	; 0xa2 <main>
  5a:	84 c0       	rjmp	.+264    	; 0x164 <_exit>

0000005c <__bad_interrupt>:
  5c:	d1 cf       	rjmp	.-94     	; 0x0 <__vectors>

0000005e <__vector_4>:

#include "bitop.h"

static volatile uint8_t mode = 0;

ISR(WDT_vect) {
  5e:	1f 92       	push	r1
  60:	0f 92       	push	r0
  62:	0f b6       	in	r0, 0x3f	; 63
  64:	0f 92       	push	r0
  66:	11 24       	eor	r1, r1
  68:	8f 93       	push	r24
	mode += 1;
  6a:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
  6e:	8f 5f       	subi	r24, 0xFF	; 255
  70:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <_edata>
}
  74:	8f 91       	pop	r24
  76:	0f 90       	pop	r0
  78:	0f be       	out	0x3f, r0	; 63
  7a:	0f 90       	pop	r0
  7c:	1f 90       	pop	r1
  7e:	18 95       	reti

00000080 <__vector_13>:

ISR(ADC_vect) {
  80:	1f 92       	push	r1
  82:	0f 92       	push	r0
  84:	0f b6       	in	r0, 0x3f	; 63
  86:	0f 92       	push	r0
  88:	11 24       	eor	r1, r1
  8a:	8f 93       	push	r24
	mode += 1;
  8c:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
  90:	8f 5f       	subi	r24, 0xFF	; 255
  92:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <_edata>
}
  96:	8f 91       	pop	r24
  98:	0f 90       	pop	r0
  9a:	0f be       	out	0x3f, r0	; 63
  9c:	0f 90       	pop	r0
  9e:	1f 90       	pop	r1
  a0:	18 95       	reti

000000a2 <main>:

int main() {
	// init

	SETBIT(DDRA, PA0);
  a2:	d0 9a       	sbi	0x1a, 0	; 26

	// enable watchdog interrupt every 8s
	// WDP2 for testing at 0.5s, WDP3 for 8s in production
	CCP = 0xd8;
  a4:	88 ed       	ldi	r24, 0xD8	; 216
  a6:	80 93 71 00 	sts	0x0071, r24	; 0x800071 <__EEPROM_REGION_LENGTH__+0x7f0071>
	WDTCSR = BIT(WDIE) | BIT(WDP2) | BIT(WDP0);
  aa:	85 e4       	ldi	r24, 0x45	; 69
  ac:	81 bd       	out	0x21, r24	; 33

	// set adc
	ADMUXB = BIT(REFS0);
  ae:	80 e2       	ldi	r24, 0x20	; 32
  b0:	88 b9       	out	0x08, r24	; 8
	ADCSRA = BIT(ADEN) | BIT(ADIE) | BIT(ADPS2);
  b2:	8c e8       	ldi	r24, 0x8C	; 140
  b4:	85 b9       	out	0x05, r24	; 5
	ADCSRB = BIT(ADLAR);
  b6:	88 e0       	ldi	r24, 0x08	; 8
  b8:	84 b9       	out	0x04, r24	; 4

	// disable digital buffers on most pins
	DIDR0 = 0xff;
  ba:	8f ef       	ldi	r24, 0xFF	; 255
  bc:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__EEPROM_REGION_LENGTH__+0x7f0060>
	DIDR1 = 0b00001111;
  c0:	8f e0       	ldi	r24, 0x0F	; 15
  c2:	80 93 61 00 	sts	0x0061, r24	; 0x800061 <__EEPROM_REGION_LENGTH__+0x7f0061>

	mode = 0;
  c6:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <_edata>

	// enable interrupts
	sei();
  ca:	78 94       	sei
				}
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 3:
				ADMUXA = 1;
  cc:	21 e0       	ldi	r18, 0x01	; 1
			case 0:
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 1:
				ADMUXA = 2;
  ce:	92 e0       	ldi	r25, 0x02	; 2
  d0:	13 c0       	rjmp	.+38     	; 0xf8 <main+0x56>
	sei();

	uint8_t value;

	for (;;) {
		switch (mode) {
  d2:	88 23       	and	r24, r24
  d4:	09 f1       	breq	.+66     	; 0x118 <main+0x76>
  d6:	81 30       	cpi	r24, 0x01	; 1
  d8:	09 f0       	breq	.+2      	; 0xdc <main+0x3a>
  da:	39 c0       	rjmp	.+114    	; 0x14e <main+0xac>
			case 0:
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 1:
				ADMUXA = 2;
  dc:	99 b9       	out	0x09, r25	; 9
				SETBIT(ADCSRA, ADSC);
  de:	2e 9a       	sbi	0x05, 6	; 5
				SETBIT(DDRA, PA3);
  e0:	d3 9a       	sbi	0x1a, 3	; 26
				set_sleep_mode(SLEEP_MODE_ADC);
  e2:	85 b7       	in	r24, 0x35	; 53
  e4:	87 7e       	andi	r24, 0xE7	; 231
  e6:	88 60       	ori	r24, 0x08	; 8
					SETBIT(PORTA, PA0);
				} else {
					CLEARBIT(PORTA, PA0);
				}
				mode = 0;
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  e8:	85 bf       	out	0x35, r24	; 53
				sleep_mode();
  ea:	85 b7       	in	r24, 0x35	; 53
  ec:	80 62       	ori	r24, 0x20	; 32
  ee:	85 bf       	out	0x35, r24	; 53
  f0:	88 95       	sleep
  f2:	85 b7       	in	r24, 0x35	; 53
  f4:	8f 7d       	andi	r24, 0xDF	; 223
  f6:	85 bf       	out	0x35, r24	; 53
	sei();

	uint8_t value;

	for (;;) {
		switch (mode) {
  f8:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
  fc:	82 30       	cpi	r24, 0x02	; 2
  fe:	81 f0       	breq	.+32     	; 0x120 <main+0x7e>
 100:	40 f3       	brcs	.-48     	; 0xd2 <main+0x30>
 102:	83 30       	cpi	r24, 0x03	; 3
 104:	39 f1       	breq	.+78     	; 0x154 <main+0xb2>
 106:	84 30       	cpi	r24, 0x04	; 4
 108:	11 f5       	brne	.+68     	; 0x14e <main+0xac>
				SETBIT(ADCSRA, ADSC);
				set_sleep_mode(SLEEP_MODE_ADC);
				sleep_mode();
				break;
			case 4:
				wdt_reset();
 10a:	a8 95       	wdr
				value = ADCH;
 10c:	87 b1       	in	r24, 0x07	; 7
				if (value < 75) {
 10e:	8b 34       	cpi	r24, 0x4B	; 75
 110:	38 f5       	brcc	.+78     	; 0x160 <main+0xbe>
					SETBIT(PORTA, PA0);
 112:	d8 9a       	sbi	0x1b, 0	; 27
				} else {
					CLEARBIT(PORTA, PA0);
				}
				mode = 0;
 114:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <_edata>
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
 118:	85 b7       	in	r24, 0x35	; 53
 11a:	87 7e       	andi	r24, 0xE7	; 231
 11c:	80 61       	ori	r24, 0x10	; 16
 11e:	e4 cf       	rjmp	.-56     	; 0xe8 <main+0x46>
				SETBIT(DDRA, PA3);
				set_sleep_mode(SLEEP_MODE_ADC);
				sleep_mode();
				break;
			case 2:
				wdt_reset();
 120:	a8 95       	wdr
				value = ADCH;
 122:	87 b1       	in	r24, 0x07	; 7
				CLEARBIT(DDRA, PA3);
 124:	d3 98       	cbi	0x1a, 3	; 26
				if (value < 185) {
 126:	89 3b       	cpi	r24, 0xB9	; 185
 128:	b8 f7       	brcc	.-18     	; 0x118 <main+0x76>
					CLEARBIT(PORTA, PA0);
 12a:	d8 98       	cbi	0x1b, 0	; 27
					CCP = 0xd8;
 12c:	88 ed       	ldi	r24, 0xD8	; 216
 12e:	80 93 71 00 	sts	0x0071, r24	; 0x800071 <__EEPROM_REGION_LENGTH__+0x7f0071>
					WDTCSR = 0;
 132:	11 bc       	out	0x21, r1	; 33
					for (;;) {
						cli();
 134:	f8 94       	cli
						set_sleep_mode(SLEEP_MODE_PWR_DOWN);
 136:	85 b7       	in	r24, 0x35	; 53
 138:	87 7e       	andi	r24, 0xE7	; 231
 13a:	80 61       	ori	r24, 0x10	; 16
 13c:	85 bf       	out	0x35, r24	; 53
						sleep_mode();
 13e:	85 b7       	in	r24, 0x35	; 53
 140:	80 62       	ori	r24, 0x20	; 32
 142:	85 bf       	out	0x35, r24	; 53
 144:	88 95       	sleep
 146:	85 b7       	in	r24, 0x35	; 53
 148:	8f 7d       	andi	r24, 0xDF	; 223
 14a:	85 bf       	out	0x35, r24	; 53
				break;
			case 2:
				wdt_reset();
				value = ADCH;
				CLEARBIT(DDRA, PA3);
				if (value < 185) {
 14c:	f3 cf       	rjmp	.-26     	; 0x134 <main+0x92>
				mode = 0;
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			default:
				mode = 0;
 14e:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <_edata>
				break;
 152:	d2 cf       	rjmp	.-92     	; 0xf8 <main+0x56>
				}
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_mode();
				break;
			case 3:
				ADMUXA = 1;
 154:	29 b9       	out	0x09, r18	; 9
				SETBIT(ADCSRA, ADSC);
 156:	2e 9a       	sbi	0x05, 6	; 5
				set_sleep_mode(SLEEP_MODE_ADC);
 158:	85 b7       	in	r24, 0x35	; 53
 15a:	87 7e       	andi	r24, 0xE7	; 231
 15c:	88 60       	ori	r24, 0x08	; 8
 15e:	c4 cf       	rjmp	.-120    	; 0xe8 <main+0x46>
				wdt_reset();
				value = ADCH;
				if (value < 75) {
					SETBIT(PORTA, PA0);
				} else {
					CLEARBIT(PORTA, PA0);
 160:	d8 98       	cbi	0x1b, 0	; 27
 162:	d8 cf       	rjmp	.-80     	; 0x114 <main+0x72>

00000164 <_exit>:
 164:	f8 94       	cli

00000166 <__stop_program>:
 166:	ff cf       	rjmp	.-2      	; 0x166 <__stop_program>
