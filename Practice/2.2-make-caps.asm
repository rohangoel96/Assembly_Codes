;if small caps, make if caps

.model tiny
.486 
.data
	alph1 db 'a','w','W','X','a','l','F'
	cnt1 dw 0 

CAPSON MACRO 
	mov al, [si]
	cmp al,'a'
	jl x1
	cmp al,'z'
	jg x1
	sub al,20h
	mov [si],al
x1:	
endm

.code
.startup
	lea si, alph1
	mov cx, cnt1

x2: CAPSON
	inc si
	loop x2
.exit 
end