.model tiny
.486
.data
	

.code
.startup
; =======================================================================
; get display mode
	mov ah, 0fh
	int 10h
	; al = current video mode
	; ah = # of character columns
	; bh = page #
; =======================================================================
; set display mode
	mov ah, 00h
	mov al, 03h
		; 00h - text mode. 40x25. 16 colors. 8 pages.
		; 03h - text mode. 80x25. 16 colors. 8 pages.
		; 12h - graphical mode. 80x25. 256 colors. 720x400 pixels. 1 page.
	int 10h
; =======================================================================
; get cursor position and size
	mov ah, 03h
	mov bh, 00h ; page # (usually 00h; between 0 to 7)
	int 10h
	; DH = row #
	; DL = column #
	; CH = cursor start line
	; CL = cursor bottom line
; =======================================================================
; set cursor position
	mov ah, 02h
	mov dh, 00h ; row #
	mov dl, 00h ; column #
	mov bh, 00h ; page # (usually 00h; between 0 to 7)
	int 10h
; =======================================================================
; set cursor size
	mov ah, 01h
	mov ch, 00h ; cursor start line (bits 0-4) and options (bits 5-7).
	mov cl, 00h ; bottom cursor line (bits 0-4).
; =======================================================================
; read character at cursor position
	mov ah, 08h
	mov bh, 00h ; page #
	int 10h
	; Error if CF = 1, AX = error code (6)
	; AH = attribute - check manual
	; AL = character.
; =======================================================================
; write character at cursor position
	mov ah, 09h
	mov al, 'a' ; character to display
	mov bh, 00h ; page #
	mov bl, 00h ; attribute - check manual
	mov cx, 01h ; # of times to write character
	int 10h
; =======================================================================
; fill a pixel
	mov ah, 0ch
	mov al, 00h ; pixel color
	mov cx, 00h ; column
	mov dx, 00h ; row
	int 10h
; =======================================================================
; blocking function in the end
	mov ah, 07h ; for int 21h
blocker:
	int 21h
	cmp al, '%'
	jnz blocker
; =======================================================================
.exit
end
