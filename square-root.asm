; Programa para encontrar la raíz cuadrada entera de un número.
; Este programa funciona haciendo un bucle desde 0 hasta el número y
;   elevando el contador al cuadrado en cada paso.
; Si el cuadrado del contador es mayor que el número, se detiene y el
;   último valor del contador es la parte entera de la raíz cuadrada.

INCLUDE Irvine32.inc

.data
number DWORD 25 ; Número a calcular la raíz cuadrada
sqrt DWORD 0 ; Resultado de la raíz cuadrada

.code
main PROC
    mov eax, number ; Carga el número en eax
    mov ecx, 0 ; Inicializa el contador

    ; El bucle se ejecutará hasta que el contador sea mayor que el número a calcular
    L1:
        inc ecx ; Incrementa el contador
        cmp ecx, eax ; Compara el contador con el número a calcular
        jg done ; Salto a done si el contador es mayor que el número

        ; Si no ha terminado, almacena el contador como la raíz cuadrada actual
        mov edx, ecx ; Copia el contador en edx
        imul edx, ecx ; Multiplica el contador por sí mismo
        cmp edx, eax ; Compara el cuadrado con el número
        jg done ; Si el cuadrado es mayor que el número, salta a done

        ; Si el cuadrado no es mayor que el número, almacena el contador como la raíz cuadrada
        mov sqrt, ecx
        jmp L1 ; Salto al principio del bucle

    done:
        ; Imprime la raíz cuadrada
        mov eax, sqrt
        call DumpRegs
        call WriteInt

    exit
main ENDP
END main
