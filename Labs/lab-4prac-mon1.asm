;An n-character string is stored starting from memory location loc1. Write an ALP
;that will replace every mth character of the string with “(double quotes – ASCII
;equivalent for “ is 22H). The value of m can range between 5 to 9 and is stored in
;location off1. The values of n is between 10d to 120d and is stored in location cnt1.
;[The size n need not to be a multiple of m]

.model tiny
.486 
.data
	loc1 db "iamrohangoel"
	off1 db 5
	cnt1 db 12
	loc2 db 12 dup (?)
.code
.startup
	lea si, loc1
	lea di, loc2
	movzx cx, cnt1 ; sign extention as loop works on cx

	mov bh, 22h
	mov bl,1

x2:	lodsb
	cmp bl,5
	jnz x1
	mov [di],bh
	inc di
	mov bl,0
	jmp x3

x1: stosb
x3:	inc bl
	loop x2

.exit 
end