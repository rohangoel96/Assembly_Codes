;-----------------------------------------------------
; I/O handling Macros
;-----------------------------------------------------
print macro str ; should terminate with a $ sign
	lea dx, str
	mov ah, 09h
	int 21h
endm

inputstr macro maxsize ; data should follow pattern - max1, act1, inp1
	lea dx, maxsize
	mov ah, 0Ah
	int 21h
endm

inputchar macro ip
	mov ah, 01h
	int 21h
	mov ip, al
endm
;-----------------------------------------------------
; File handling Macros
;-----------------------------------------------------
fcreate macro filename, attribute, handle
	mov ah, 3Ch
	lea dx, filename
	mov cl, attribute
	int 21h
	mov handle, ax
endm

fwrite macro handle, dataaddr, bytes
	mov ah, 40h
	mov bx, handle
	movzx cx, bytes
	lea dx, dataaddr
	int 21h
endm

fopen macro filename, sharingmode, handle
	mov ah, 3Dh
	mov al, sharingmode
	lea dx, filename
	int 21h
	mov handle, ax
endm

fmoveptr macro handle, movtcode, cx_value, dx_value
	mov ah, 42h
	mov al, movtcode
	mov bx, handle
	mov cx, cx_value
	mov dx, dx_value
	int 21h
endm

fdelete macro filename
	mov ah, 41h
	lea dx, filename
	int 21h
endm

fread macro handle, bytes, placeToSave
	mov ah, 3Fh
	mov bx, handle
	movzx cx, bytes
	lea dx, placeToSave
	;mov dx, placeToSave
	int 21h
endm

fclose macro handle
	mov ah, 3Eh
	mov bx, handle
	int 21h
endm

frename macro filename, renamedfile, attribute ; don't forget to close the file before rename!
	mov ah, 56h
	lea dx, filename
	lea di, renamedfile
	mov cl, attribute
	int 21h
endm
;-----------------------------------------------------
; variables
;-----------------------------------------------------
	fnewline db 0Dh, 0Ah
	fnewlinelen db 2d

	newline db 0Dh, 0Ah, '$'
	newlinelen db 3d
;-----------------------------------------------------
