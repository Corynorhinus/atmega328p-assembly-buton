;
; assemblybuton.asm
;
; Created: 31.01.2021 17:06:57
; Author : dogukan bicer
;


; buton ve ledleri ayarlamak için.
.equ LED1 = 5
.equ LED2 = 6
.equ BUT1 = 2
.equ BUT2 = 3
.equ BUT3 = 4



init:
	ldi		R16,	1<<LED1 | 1<<LED2				;LED1 LED2 cıkış/ BUT1 giriş
	out		DDRD,	R16					
	ldi		R16,	1<<BUT1 | 1<<BUT2 | 1<<BUT3		;pullup butonları aktif etmek için
	out		PORTD,	R16

loop:
	cbi		PORTD, LED1			
	sbis	PIND, BUT1
	sbi		PORTD,	LED1
	rjmp	loop

	cbi		PORTD, LED1			;bit'i temizle
	cbi		PORTD, LED2

	sbis	PIND, BUT1			;bit ayarlanmışsa geç
	sbi		PORTD,	LED1		;bit'i ayarla

	sbis	PIND, BUT2
	sbi		PORTD, LED2

	rjmp	loop

	sbis	PIND,	BUT1
	sbi		PIND,	LED1		;registerda uygun yere 1 yazarak PORTX'i değiştirebiliriz.
	rjmp	loop
