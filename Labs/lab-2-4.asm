;Write an ALP that will count the number of negative numbers in an array of 
;16-bit signed data stored from location ‘ARRAY1’. The number of elements in the
;array is present in location ‘COUNT’. The count of negative numbers must be stored in location ‘NEG1’

.model tiny
.486 
.data
	ARRAY1 dw 0FFFEh,0022h,0FFF0h,000Bh,5005h,6000h
	COUNT db 06h
	NEG1 db 00h
.code
.startup
	lea si, ARRAY1
	;mov bl, 00
	mov cl, COUNT
	
x2:	mov ax, [si]
	cmp ax,0000h
	jg x1
	;inc bl
	INC BYTE PTR NEG1
x1: add si,02h
	dec cl
	jnz x2

;mov NEG1, bl
.exit 
end