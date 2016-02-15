;Write an ALP that finds the maximum number from a set of 32-bit numbers

.model tiny
.486 
.data
	ARRAY1 dd 10h,0FFh,1010h,04h,99h,0FFh, 0A1h
	COUNT db 7
	RESULT dd ?
.code
.startup
	lea si, ARRAY1
	mov cl, COUNT
	
	mov eax, [si]

x2:	cmp [si], eax
 	jle x1
	mov eax,[si]
x1: add si, 04h
	dec cl
	jnz x2

	mov RESULT,eax
.exit 
end