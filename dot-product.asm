; El siguiente código en Lenguaje Ensamblador implementa la operación del producto
;   punto entre dos vectores.

INCLUDE Irvine32.inc

.data
    vector1 BYTE 1, 2, 3, 4, 5
    vector2 BYTE 6, 7, 8, 9, 10
    dot_product DWORD 0
    len DWORD LENGTHOF vector1

.code
main PROC
    mov ecx, len ; Carga la longitud de los vectores en ecx
    mov esi, OFFSET vector1 ; Carga la dirección del primer vector en esi
    mov edi, OFFSET vector2 ; Cargo la dirección del segundo vector en edi

    L1:
        movzx eax, byte ptr [esi] ; Carga el byte actual del vector1 en ax
        movzx ebx, byte ptr [edi] ; Carga el byte actual del vector2 en bx
        imul eax, ebx ; Realiza la multiplicación de los bytes
        add dot_product, eax ; Suma el resultado de la multiplicación al producto punto
        inc esi ; Incrementa esi al siguiente byte en vector1
        inc edi ; Incrementa edi al siguiente byte en vector2
        loop L1

    ; Imprime el producto punto
    mov eax, dot_product
    call WriteDec

    exit
main ENDP
END main
