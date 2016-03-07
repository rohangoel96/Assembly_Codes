;n 32-bit data are stored starting from memory location dat1.
;Write an ALP that will insert the string “????”  after every mth  double word 
;The value of m can range between 2 to 4 and is stored in location off1. 
;The value of n is between 10d to 120d and is stored in location cnt1. 
;The size n need not be a multiple of m

.model tiny
.486 
.data
	dat1 dd 11111111h, 22222222h, 33333333h, 44444444h, 55555555h, 66666666h, 77777777h, 88888888h, 99999999h
	temp dd 9 dup (?)
	off1 db 2
	cnt1 db 9
.code
.startup
	lea si, dat1
	lea di, temp

	movzx cx, cnt1
	rep movsd

	mov bl, 1
	lea si, temp
	lea di, dat1
	movzx cx, cnt1

x3:	cmp bl, off1
	jz x1
	movsd
	jmp x2
x1: add si, 4
	mov bl ,0  	
x2: inc bl
	loop x3

	mov eax, 00000000h
	mov [di] , eax

.exit 
end