; Programa en Lenguaje Ensamblador que calcula la suma de las primeras 24
;   potencias de 2.

INCLUDE Irvine32.inc

.data
base DWORD 2
exponent DWORD 24

.code
main PROC
    mov ecx, exponent

    call AddPowers

    exit
main ENDP

AddPowers PROC
    mov eax, 1
    xor edx, edx

    L1:
        imul eax, base
        push eax
        loop L1

    mov ecx, exponent

    L2:
        pop eax
        add edx, eax
        loop L2

    mov eax, edx
    call WriteDec
    call Crlf

    ret
AddPowers ENDP

END main
