;Write an ALP that will examine a set of signed 8-bit nos. and find the smallest positive no. (for e.g. in
;a set of nos. 80h, 21h,92h,45h – smallest positive no. is 21h). The numbers are stored from location
;dat1, the count of the nos. is stored in location cnt1 and the smallest positive number must be stored
;in location res1.

.model tiny
.486 
.data
	DAT1 db 80h, 21h,92h,45h
	CNT1 db 04h
	RES1 db ?
.code
.startup
	lea si, DAT1
	mov bl, 7Fh
	mov cl, 04h

x1:	lodsb
	cmp al,00h
	jl x3
	cmp al,bl
	jg x3
	mov bl,al
x3:	loop x1
	
	mov RES1, bl

.exit 
end