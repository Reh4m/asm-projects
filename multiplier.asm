; El siguiente código en Lenguaje Ensamblador implementa un programa que
;   multiplica los elementos de dos arreglos de datos tipo WORD.

INCLUDE Irvine32.inc

.data
numbers1 WORD 2, 3, 4, 5, 6
numbers2 WORD 2, 3, 4, 5, 6
result DWORD 5 DUP(?)
len DWORD LENGTHOF numbers1

.code
main PROC
    mov ecx, len ; Carga la longitud de los arreglos
    mov esi, OFFSET numbers1 ; Carga la dirección de memoria de numbers1
    mov edi, OFFSET numbers2 ; Carga la dirección de memoria de numbers2
    mov ebx, OFFSET result ; Carga la dirección de memoria de result

    mov eax, 0 ; Limpia el registro eax

    L1:
        mov ax, [esi] ; Primero, se carga el valor actual de numbers1 en ax
        imul ax, [edi] ; Después, se multiplica por el valor actual de numbers2
        mov [ebx], eax ; Mueve el resultado de la multiplicación a la dirección de memoria de result
        add esi, TYPE numbers1 ; Incrementa el desplazamiento de numbers1
        add edi, TYPE numbers2 ; Incrementa el desplazamiento de numbers2
        add ebx, TYPE result ; Incrementa el desplazamiento de result
        loop L1 ; Repite el ciclo hasta que ecx sea 0

    mov ecx, len
    mov esi, OFFSET result
    mov eax, 0

    ; Mueve el puntero a cada dirección de memoria de result y lo imprime
    display:
        mov eax, [esi]
        call WriteDec
        call Crlf
        add esi, TYPE result
        loop display

    exit
main ENDP
END main
