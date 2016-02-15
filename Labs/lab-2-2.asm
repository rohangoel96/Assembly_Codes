;Write an ALP to add 2 8-byte nos. using them as 32-bit data

.model tiny
.486 
.data
	NUMBER1 dd 89ABCDEFh,01234567h	;NUMBER1 = 0123456789ABCDEFh lower word written first
	NUMBER2 dd 00000011h,00000000h	;NUMBER2 = 0000000000000011h
	COUNT db 02h ; 16 bytes of data each
	;RESULT dd 4 dup(?)
	;RESULT_CARRY db ? 
.code
.startup
	
	lea si, NUMBER1
	lea di, NUMBER2

	mov cl, COUNT
	mov bl, 00h ;final carry 

	CLC ;important  to clear the carry flag before using ADC

x1:	mov eax, [si]
	adc [di], eax

	add si,04h
	add di,04h
	dec cl
	jnz x1

	jnc x2
	inc bl
x2: mov [di],bl	

.exit 
end