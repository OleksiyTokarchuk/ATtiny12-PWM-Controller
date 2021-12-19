;
; attiny12.asm
;
; Created: 18.12.2021 21:38:30
; Author : Tokarchuk Oleksiy
;


; Replace with your application code
.def oc = r17
.def cnt = r18

.cseg

.org 0x00	rjmp reset
.org 0x03	rjmp timer

reset:
	ldi r21, 230
	sbi DDRB, 0
	sbi PORTB, 0 
	ldi r16, (1 << PB1)|(1 << PB2)
	out PORTB, r16
	ldi oc, 125
	ldi cnt, 0
	ldi r16, (1 << TOIE0)
	out TIMSK, r16
	sei
	out tcnt0, r21
	ldi r16, (1 << CS00)
	out TCCR0, r16
	rjmp start
start:
	rcall delay
	sbis PINB, PB1
	inc oc
	cpi oc, 0xFE
	brsh maximum
	sbis PINB, PB2
	dec oc
	cpi oc, 0x02
	brlo minimum
	rjmp start
minimum:
	ldi oc, 0x02
	rjmp start
maximum:
	ldi oc, 0xFD
	rjmp start
timer:
	in r16, SREG
	out tcnt0, r21
	inc cnt
	cp oc, cnt
	breq equaloc
	cpi cnt, 0x00
	breq equal_z
	out SREG, r16
	reti
equal_z:
	sbi PORTB, 0
	out SREG, r16
	reti
equaloc:
	cbi PORTB, 0
	out SREG, r16
	reti
delay:
    ldi  r22, 104
    ldi  r23, 229
L1: dec  r23
    brne L1
    dec  r22
    brne L1
	ret