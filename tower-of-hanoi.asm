; El siguiente código en Lenguaje Ensamblador implementa el algoritmo de
;   ordenamiento de burbuja para ordenar un arreglo de números definido por el
;   programador.

INCLUDE Irvine32.inc

.data
myArr DWORD 3, 5, 1, 7, 2, 8, 0, 9, 6, 4
len DWORD LENGTHOF myArr ; Inicializa con la longitud del arreglo.

.code
main PROC
    mov ecx, len ; Carga la longitud del arreglo en el registro ecx.
    ; El registro ecx se utiliza como contador tanto para el ciclo externo como para el ciclo interno.
    dec ecx ; Decrementa el valor de ecx en 1. Esto debido a que el arreglo se indexa desde 0.

    L1: ; Inicio del ciclo externo (Bubble Sort).
        push ecx ; Guarda el valor del elemento actual en la pila.
        mov ecx, len ; Restaura el valor de ecx para el ciclo interno.
        dec ecx

        L2: ; Inicio del ciclo interno.
            mov eax, myArr[ecx*4] ; Carga el valor del elemento actual en eax.
            ; El registro eax utiliza para identificar el elemento actual.
            cmp eax, myArr[ecx*4 - 4] ; Compara el valor actual con el anterior.
            jge skip ; Salta a la etiqueta Skip si el valor actual es mayor o igual al anterior.

            xchg eax, myArr[ecx*4 - 4] ; Intercambia la posición del valor actual con el anterior.
            mov myArr[ecx*4], eax ; Guarda el valor anterior en la posición actual.

            skip: ; Se utiliza para omitir la instrucción de intercambio si los elementos ya están ordenados.
                loop L2 ; Continua con el ciclo interno.

        pop ecx ; Saca el elemento actual de la pila.

        loop L1 ; Continua con el ciclo externo.

    mov ecx, len ; Carga la longitud del arreglo en ecx.

    display:
        mov eax, myArr[ecx*4]
        call WriteDec
        call Crlf
        loop display

    exit
main ENDP
END main
