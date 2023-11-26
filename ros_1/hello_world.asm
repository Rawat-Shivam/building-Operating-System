


;---------------------------------------------------------
;
; this is the property of "Shivam Rawat"
; for more information contact:
; shivamondragon@gmail.com
;

;
; do not use this code without understanding it
;

;
; go and read readme files first 
; 

;---------------------------------------------------------

[bits 16] ;tell assembler to produce 16 bit binary format
[org 0x7c00] ;theaddress where BIOS will load our bootloader

start: 
	xor ax,ax
	mov ds,ax
	mov es,ax ; these three lines will clear the ax,ds,es registers

	mov bx,0x8000 ; we will start form address 0x8000
	mov si,hello_Rawat ; set source index points to string
	call print_string ;call print_string func()

	hello_Rawat db '_ Rawat_OS _',13,0	;define string 

;define function here
	print_string:
	mov ah,0x0E ;value to tell interrupt handler to take value from al and print it on screen

.repeat_next_char:

	lodsb ;load first character of hello_world string to al register
	cmp al,0
	je .done_print	
	int 0X10 ; call BIOS video interrupt
	jmp .repeat_next_char

.done_print:
	ret

times(510 - ($ -$$)) db 0x00 ;set 512 bytes $$ are 2 bytes, this tells the bios that this gile contains bootloader components
dw 0xAA55 ;boot signature tell bios that this file contains boot components that need to boot












