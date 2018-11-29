;
; AssemblerApplication6.asm
;
; Created: 11/14/2018 3:39:07 PM
; Author : Michal Ciebien
;


; Replace with your application code

.ORG 0
JMP start

 .ORG 0x02 ; vector interrupt for INT0 = 0x02
	call int_detect_wave_from_sensor

;.ORG 0x2000 ; ommit first 100 addresses left for interrupts
start :
	LDI R16, HIGH(RAMEND)
	OUT SPH, R16
	LDI R16, LOW(RAMEND)
	OUT SPL, R16 ; initialize stack pointer
	clr r16
	
	ldi r16, 0xFF ;
	out DDRA, r16 ; port A output
	ldi r16, 0x00 
	out DDRD, r16 ; port D input
	

	ldi r16, 0x11
	STS EICRA, r16 ; make INT0 rising edge triggered
	clr r16

	ldi r16, 0x01
	out EIMSK, r16 ; enable INT0 interrupt
	SEI ; enable interrupts
	clr r16


	;----- start main
	main :
	ldi r16, 1<<PA0 ; 1
	out PORTA, r16 // Send HIGH on PA0 to start the detect and PROBABLY start interrupt
	ldi r16, 0
	out PORTA, r16 // clear the PA0
	clr r16

	call delay_detection_60ms

    rjmp main
	; ----- end main


		delay_detection_60ms: ; delay 60ms for the sensor accurate response
	ldi r17, 250
	
	again1:
	dec r17 ; 1 c
	brne again1 ; 2c
	ldi r17, 80
	again2:
	dec r17
	brne again2
	ret

	
	int_detect_wave_from_sensor:

	ldi r16, 0 ; 1
	out PORTA, r16 // clear PORTA completely

	ldi r20, 0b00000000 ; normal mode, int clk;
	sts TCCR1A, r20		
	ldi r20, 0b00000101 ; prescaler /1024
	sts TCCR1B, r20
	ldi r20, 0
	sts TCCR1C, r20

	loop_check_PA0:

	in r20, PIND
	sbrc r20, PD0
	rjmp loop_check_PA0 ; if PIND goes LOW, so the sensor stops it's pulse, buzz the buzzer

	lds r25, TCNT1L
	lds r26, TCNT1H

	ldi r23, 45 ; lower bits of 16-bit number
	ldi r24, 01 ; higher bits of 16-bit number
	
	cp r26, r24 ; compare high byte with 0
	brsh quit_interrupt ; branch if same or higher
	nop
	cp r25,r23 ; compare lower bytes
	brsh quit_interrupt
	nop
	
	 ldi r19, 1<<PA2 ; high on PA2 for buzzer 
	 out PORTA, r19
	 clr r19

	 ldi r19, 3
	 mul r25, r19

	delay_PA2_HIGH:
	ldi r17, 100
	ldi r18, 50
	mov r19, r0 ; LOAD THE VALUE OF TCNT1L - the lower byte of the lock min: 0 max: 45
	again_HIGH:
	dec r17 ; 1 c
	brne again_HIGH ; 2c 
	nop
	ldi r17, 100 ; 1c
	dec r18 ; 1c
	brne again_HIGH ; 2c
	ldi r18, 50 ; 1c
	dec r19 ; 1c
	brne again_HIGH ; 2c
	
	 ldi r19, 0 ; low on PA2 for buzzer 
	 out PORTA, r19
	 clr r19
	
	delay_PA2_LOW:
	ldi r17, 100
	ldi r18, 75
	mov r19, r0 ; LOAD THE VALUE OF TCNT1L - the lower byte of the lock min: 0 max: 45
	again_LOW:
	dec r17 ; 1 c
	brne again_LOW ; 2c 
	nop
	ldi r17, 100 ; 1c
	dec r18 ; 1c
	brne again_LOW ; 2c
	ldi r18, 75 ; 1c
	dec r19 ; 1c
	brne again_LOW ; 2c


	 quit_interrupt:
	ldi r20, 0b00000000 ; load 0
	sts TCCR1B, r20 ; stop the clock

	sts TCNT1H, r20
	sts TCNT1L, r20

	ldi r16, 0 ; 1
	out PORTA, r16 // Send low on PA0
	 reti


