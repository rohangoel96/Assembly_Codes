;Write an ALP that will copy a set of 10 bytes from memory location loc1 to memory location loc2 in the reverse order.

.model tiny
.486 
.data
loc1 db 67h,0ABh,0FFh,2Fh,61h ;0 before every data starting with alphabets
loc2 db 5 dup(?) ;reserving space
.code
.startup
	lea si,loc1 ;load effective address i.e offset in si
	lea di, loc2
	mov cx,5 ;counter
	add di,cx ;currently di pointing to first; but we need to store from the last; add 5 to di so that it points to the last
	dec di ;as indexing starts from 0; last location is 4
x1:	mov al, [si]
	mov [di],al
	;first byte has been tranferred
	inc si ;as only byte
	dec di
	dec cx
	jnz x1
.exit 
end