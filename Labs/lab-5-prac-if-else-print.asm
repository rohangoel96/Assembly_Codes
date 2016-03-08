;Write an ALP that displays “Microprocessor” if key a is pressed or 
;displays “Interfacing” if key b is 
;pressed by user. If user presses any other key “######” 
;must be displayed. The key that the user 
;presses must not be displayed onscreen.
.model tiny
.486 
.data
	micro db "Microprocessor","$"
	inter db "Interfacing","$"
	hash db "######","$"
.code
.startup

	mov ah, 08h
	int 21h
	
	cmp al,'a'
	jnz x1
	lea dx, micro
	jmp x4
	
x1:	cmp al,'b'
	jnz x2
	lea dx, inter
	jmp x4 

x2: lea dx, hash
x4: mov ah, 09h
	int 21h	 

.exit 
end