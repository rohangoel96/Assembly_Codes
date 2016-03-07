; multiply 2- 64 bit numbers

;!!!!!!!!!!!!!NOT WORKING

.model tiny
.486 
.data
	dat1 dd 22222222h,11111111h ;64 bit number : 11111111 22222222
	dat2 dd 44444444h,33333333h ;64 bit number : 33333333 44444444

	ans_bd dd ?
	carr_bd dd ?

	ans_ad_with_carry dd ?
	carr_ad dd ?

	ans_cb dd ?
	carr_cb dd ?

	ans_ca_with_carry dd ?
	carr_ac dd ?

	res dd 4 dup(?)

.code
.startup
	lea si, dat1
	lea di , dat2

	mov eax, [si]
	mov ebx, [di]
	mul ebx	;stored in a combination of EDX:EAX, EDX has the carry for next location
	; we have the result bd here
	mov ans_bd, eax
	mov carr_bd, edx


	mov eax, [si+4]
	mov ebx, [di]
	mul ebx
	; we have the result ad here
	add eax, carr_bd ;add the previous carry
	mov ans_ad_with_carry, eax
	mov carr_ad, edx

	mov eax, [si]
	mov ebx, [di+4]
	mul ebx
	mov ans_cb, eax
	mov carr_cb, edx

	mov eax, [si+4]
	mov ebx, [di]
	mul ebx
	add eax, carr_cb
	mov ans_ca_with_carry, eax
	mov carr_ac, edx

	mov eax,ans_bd
	mov res, eax; lowest dd

	mov eax, ans_ad_with_carry
	add eax, ans_cb
	mov [res+4], eax; second lowerst dd

	mov eax, carr_ad
	adc eax, ans_ca_with_carry
	mov [res+8], eax ; third lowest dd

	mov eax, carr_ac
	adc eax, 0000h
	mov [res+12], eax

.exit 
end