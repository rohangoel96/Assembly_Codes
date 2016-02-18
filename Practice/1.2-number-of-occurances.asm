;An array of data is stored in data segment starting at ARRAY1. 
;The number of elements in the array is stored in location COUNT1.  
;Write a program to count the number of occurrences of the element
;in CODE1 in the ARRAY1 and store this result in location RESULT1

.model tiny
.486
.data
	ARRAY1 dw 1234h,1000h,1234h,1000h,1234h,0FF00h
	COUNT1 db 06h
	RESULT1 db 0
	CODE1 dw 1234h
.code
.startup
	lea si,ARRAY1
	mov ax,CODE1
	mov cl,COUNT1
x1:	cmp [si],ax
	jne x2
	inc byte ptr RESULT1
x2:	inc si
	inc si ;increment two times as it's a word
	dec cl
	jnz x1
.exit
end