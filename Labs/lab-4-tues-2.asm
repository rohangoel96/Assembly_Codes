;Write an ALP that does the following
;(1) Display the string “Enter User Name” and goes to the next line
;(2) Takes in the user entered string compares with user name value already stored in memory
;(3) If there is no match it should exit.
;(4) If there is a match it should display the string “Enter Password” and goes to next line
;(5) Takes in password entered by the user and compares with password already stored in memory
;(6) If there is no match it should exit’
;(7) If there is a match it should display “Hello Username”
;Note:
;While the username is being entered it can be displayed but when password is being entered user
;pressed key should be displayed instead it should display “*” for every key pressed.
;The user name size is fixed to 10 characters and password to 8 characters.

.model tiny
.486 
.data
text1 db "Enter User Name","$"
text2 db "Enter Passowrd","$"
text3 db "Hello User","$"
newline db 0ah,0dh,'$'
userAllowed db "rohan"
max1 db 11
act1 db ?
userEntered db 33 dup("?")
passwordAllowed db "mypasswo"
act2 db 8
passwordEntered db 8 dup("?")

.code
.startup
	lea dx, text1
	mov ah,09h
	int 21h
	
	lea dx, newline
	mov ah,09h
	int 21h
	
	lea dx, max1
	mov ah, 0Ah
	int 21h
	
	cld
	lea si, userAllowed
	lea di, userEntered
	movzx cx, act1
	
	repe cmpsb
	cmp cx, 00h
	je x1
	mov ah,4Ch
	int 21h

x1:
	lea dx, text2
	mov ah,09h
	int 21h
	
	lea dx, newline
	mov ah,09h
	int 21h
	
	lea bx,passwordEntered
	mov dl, "*"
	movzx cx, act2
	
x3:	
	mov ah,08h
	int 21h
	mov [bx],al
	inc bx
	mov ah, 02h
	int 21h
	loop x3
	
	cld
	lea si, passwordAllowed
	lea di, passwordEntered
	movzx cx, act2
	
	repe cmpsb
	cmp cx, 00h
	je x2
	mov ah,4Ch
	int 21h	
	
x2: 
	lea dx, newline
	mov ah,09h
	int 21h
	
	lea dx, text3
	mov ah,09h
	int 21h
	
.exit 
end