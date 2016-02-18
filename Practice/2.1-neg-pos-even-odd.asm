;Find number of positive,negative and odd even numbers

.model tiny
.486 
.data
	in1 dd 0FFFFFFEAh, 00000001h, 00000002h, 0FFFFFFE9h,00000019h;-22,1,2,-21,25
	cnt1 db 5
	oddpos db 0
	oddneg db 0
	evenpos db 0
	evenneg	 db 0
	st1 dw 10 dup(?) ;stack declaration always as workds
	stacktop dw ? ; top of the stack
.code
.startup
	lea sp, stacktop
	lea si, in1
	movzx cx, cnt1 ;0 extended with 0 padded; loop works with cx
x1: call FINDPOSEVEN
	loop x1
.exit
FINDPOSEVEN PROC NEAR
lodsd ;mov eax, [si]
bt eax,31 ;check MSB
jc negt
bt eax, 0
jc odd
inc evenpos
jmp endx	
negt: 
bt eax,0
jc oddandneg
inc evenneg
jmp endx

odd: 
bt eax,31
jc oddandneg
inc oddpos
jmp endx

oddandneg: inc oddneg
endx: 
ret
FINDPOSEVEN endp
end 