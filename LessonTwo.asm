section	.text
    global _start            ; должно быть объявлено для использования gcc
	
_start:	                    ; сообщаем линкеру входную точку
    mov ECX, '4'
	   sub ECX, '0'

	mov EDX, '5'
	   sub EDX, '0'
	
CALL sum 				;вызвали  sum
	mov [res], eax
	mov ecx, msg
	mov edx, len
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ecx, res
	mov edx, 1
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

sum:
	mov eax, ecx
	add eax, edx
	add eax, '0'
	ret
	
section	.data
	msg dw 'The Sum: '
	len equ $- msg

segment .bss
	res resb 1

