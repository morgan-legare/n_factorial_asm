; This program calculates n! for any given n value.

extern printf
extern scanf

global main
	%define EXIT_SUCCESS 0
	%define NULL 0
	%define NL 10
section .bss

section .data
	n: dd 0 ; allocate 4 bytes and initialize to 0 

section .rodata
	fmt_ask_n: db NL, "Enter value for n: ", NULL
	fmt_get_n: db "%d", NULL
	fmt_n_fact: db NL, "n! is: %d", NL, NULL

section .text

main:
	push ebp
	mov ebp, esp

; code below
	push fmt_ask_n
	call printf
	add esp, 4

	push n
	push fmt_get_n
	call scanf
	add esp, 8
	
	mov eax, [ n ]  ; move n to eax
	mov ebx, [ n ]	; move n to ebx
.loop:
	cmp ebx, 1	; cmps ebx (n) == 1
	je .endloop	; exits loop if eax (n) == 1 
	dec ebx		; dec ebx ( n - 1) 
	imul eax, ebx	; n * (n - 1)
	jmp .loop	; continues loop
	
.endloop:
	mov [ n ], eax
	push dword [ n ]
	push fmt_n_fact
	call printf
	add esp, 8 

; code above
	mov esp, ebp
	pop ebp
	mov eax, EXIT_SUCCESS
	ret
