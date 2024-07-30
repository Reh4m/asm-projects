; Programa en Lenguaje Ensamblador que incorpora dos procedimientos para realizar
;   una suma y una multiplicación de dos números enteros de 16 bits respectivamente.

INCLUDE Irvine32.inc

.data
num1 WORD 10
num2 WORD 20

.code
main PROC
    ; Operación de Suma
    mov ax, num1
    mov bx, num2
    call sum

    movzx eax, ax
    call WriteDec
    call Crlf

    ; Operación de Multiplicación
    mov ax, num1
    mov bx, num2
    call multiply

    movzx eax, ax
    call WriteDec
    call Crlf

    exit
main ENDP

; Suma de dos números
sum PROC
    mov ax, num1
    add ax, num2

    ret
sum ENDP

; Multiplicación de dos números
multiply PROC
    mov ax, num1
    mul num2

    ret
multiply ENDP

END main
