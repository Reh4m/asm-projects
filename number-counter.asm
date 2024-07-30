; Programa en Lenguaje Ensamblador que compara el contenido de un registro con un arreglo de 30 elementos
;   y cuenta cuántas veces se repite el contenido del registro en el arreglo.

INCLUDE Irvine32.inc

.data
myArr DWORD 1, 1, 3, 1, 5, 1, 7, 8, 9, 2
      DWORD 4, 1, 4, 3, 2, 8, 8, 2, 1, 5
      DWORD 7, 2, 3, 4, 6, 6, 9, 1, 2, 4
number WORD 1

.code
main PROC
    mov esi, OFFSET myArr ; Carga la dirección base del arreglo en el registro ESI
    mov ebx, 0 ; Inicializa el contador en 0
    mov ecx, 30 ; Inicializa el contador de iteraciones en 30

    L1:
        mov eax, [esi] ; Carga el elemento actual del arreglo en el registro EAX
        cmp ax, number ; Compara el valor actual del arreglo con el valor del registro number
        jne next ; Si no son iguales, salta a la etiqueta next
        inc ebx ; En caso contrario, incrementa el contador en 1, y salta a la etiqueta next

    next:
        add esi, 4 ; Mueve el puntero a la siguiente posición del arreglo
        loop L1 ; Decrementa el contador de iteraciones y salta a la etiqueta L1 si no es 0

    ; Por último, muestra el valor del contador en la consola
    mov eax, ebx
    call WriteDec

    exit
main ENDP
END main
