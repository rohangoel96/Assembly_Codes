;A n 32-bit data is stored starting from memory location dat1. Write an ALP that will convert every mth
;double word from little endian to big endian format (only the mth double word should be converted).
;The value of m can range between 2 to 9 and is stored in location off1. The value of n is between 10d
;to 120d and is stored in location cnt1. [The size n need not be a multiple of m]
;The value of m is to be provided by the user via the keyboard. In order to take in the user input. The
;program should first display the following string “Enter the value of m”. The user will then enter the
;value using the keyboard. Once the conversion has been completed it should display “Conversion
;Completed” on the next line

.model tiny
.486 
.data
	dat1 dd " 23 "," 23 "," 23 "," 23 "," 23 "," 23 "," 23 "," 23 "," 23 "," 23 ","$$$$"
	cnt1 db 10d
	text1 db "Enter the value of m$"
	newline db 0dh, 0ah, "$"
	off1 db ?
	text2 db "Conversion completed$"
	
.code
.startup
	lea dx, text1
	mov ah, 09h
	int 21h
	
	lea dx, newline
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, 30h ;number will be entered as ASCII, convert to decimal
	mov off1, al

	lea si, dat1
	mov bl, 1
	
	movzx cx, cnt1
	
x2:	mov eax, [si]
	cmp bl, off1
	jnz x1
	bswap eax
	mov bl, 0
x1: mov [si], eax
	add si, 4
	inc bl
	loop x2
	
	lea dx, newline
	mov ah, 09h
	int 21h
	
	lea dx, dat1
	mov ah, 09h
	int 21h

	lea dx, newline
	mov ah, 09h
	int 21h

	lea dx, text2
	mov ah, 09h
	int 21h

.exit 
end