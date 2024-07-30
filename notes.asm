
; 1. Direccionamiento indirecto

.data
val1 BYTE 10h

.code
; ESI contiene el desplazamiento de val1
mov esi, OFFSET val1
; MOV utiliza el operando indirecto como el origen
; El desplazamiento en ESI se utiliza para hacer referencia a la dirección en memoria y mover un byte a AL
; El valor dentro de los corchetes denota que es una dirección en memoria
mov al, [esi]

movzx eax, al


; 2. Arreglos y direccionamiento indirecto

.data
arregloB BYTE 10h, 20h, 30h

.code
; Los operandos indirectos pueden apuntar a distintos elementos de un arreglo

; Carga el desplazamiento en ESI
mov esi, OFFSET arregloB ; 20200
; Apunta al primer byte del arreglo
mov al, [esi] ; AL = 10h
; Incrementa el desplazamiento al siguiente elemento
inc esi ; 20201 + 1
; Apunta al segundo byte del arreglo
mov bl, [esi] ; BL = 20h
; Incrementa el desplazamiento al siguiente elemento
inc esi ; 20202 + 1
mov cl, [esi] ; CL = 30h

movzx eax, al
movzx ebx, bl
movzx ecx, cl


; 3. Arreglo de 16 bits o 2 bytes

.data
arregloW WORD 1000h, 2000h, 3000h

.code
; Carga el desplazamiento en ESI
mov esi, OFFSET arregloW ; 20200
mov ax, [esi] ; AX = 1000h
; Incrementa el desplazamiento 2 bytes
add esi, 2 ; 20202 + 2
mov bx, [esi] ; BX = 2000h
; Incrementa el desplazamiento 2 bytes
add esi, 2 ; 10204 + 4
mov cx, [esi] ; CX = 3000h

movzx eax, ax
movzx ebx, bx
movzx ecx, cx


; 4. Arreglo de 32 bits o 4 bytes

.data
arregloW WORD 100000h, 200000h, 300000h

.code
; Carga el desplazamiento en ESI
mov esi, OFFSET arregloW ; 20200
mov eax, [esi] ; EAX = 100000h
; Incrementa el desplazamiento 4 bytes
add esi, 4 ; 20204 + 4
mov ebx, [esi] ; EBX = 200000h
; Incrementa el desplazamiento 2 bytes
add esi, 4 ; 10208 + 8
mov ecx, [esi] ; ECX = 300000h


; 5. Promedio de 3 números

.data
arregloD DWORD 100000h, 200000h, 300000h
len DWORD LENGTHOF arregloD

.code
mov ecx, 0 ; Contador
mov edi, len ; Longitud del arreglo

; Carga el desplazamiento en ESI
mov esi, OFFSET arregloD ; 20200
mov eax, [esi] ; 100000h
add ecx, eax ; Suma el valor de EAX a ECX, 100000h

add esi, 4 ; 20204
mov eax, [esi] ; 200000h
add ecx, eax ; Suma el valor de EAX a ECX, 300000h

add esi, 4 ; 20208
mov eax, [esi] ; 300000h
add ecx, eax ; Suma el valor de EAX a ECX, 600000h

mov eax, ecx ; Carga el valor final de la suma en EAX
xor edx, edx ; Limpia EDX

; Divide EAX entre EDI
div edi ; EAX = EAX / EDI


; 6. Operadores indexados

.data
; Procesamiento de arreglos
arregloB BYTE 10h, 20h, 30h

.code

; El registro índice se inicializa en cero antes de acceder al primer elemento del arreglo
mov esi, 0 ; 20200
; mov esi, 1 ; 20201 = 10h
; mov esi, 2 ; 20202 = 30h

; Suma ESI al desplazamiento de arregloB
; Carga la dirección y el byte en memoria generada por la expresión al registro AL
mov al, [arregloB + esi] ; 10h

movzx eax, al


; 7. Suma de desplazamiento

.data
arregloW WORD 1000h, 2000h, 3000h

.code
; Carga el desplazamiento en ESI
mov esi, OFFSET arregloW

; Carga la dirección en memoria de ESI
mov ax, [esi] ; 1000h
; Utiliza desplazamiento constante y suma la dirección en memoria de ESI en 2
mov bx, [esi + 2] ; 2000h
; Utiliza desplazamiento constante y suma la dirección en memoria de ESI en 4
mov cx, [esi + 4] ; 3000h

movzx eax, ax
movzx ebx, bx
movzx ecx, cx


; 8. Factores de escala

; Si usamos un arreglo de 8 bytes, multiplicamos el subíndice por 4 (tamaño de bits de una doble palabra)
; para generar el desplazamiento de un elemento en en específico.

.data
arregloD DWORD 100h, 200h, 300h, 400h
.code
mov esi, 3 * TYPE arregloD ; Carga el desplazamiento en 3 * el tamaño de bytes de arregloD (4)
mov eax, arregloD[esi] ; 400h

.data
arregloD DWORD 1, 2, 3, 4
.code
mov esi, 3 ; subíndice (elemento a obtener)
mov eax, arregloD[esi * 4] ; ESI * factor de escala = 400h

.data
arregloD DWORD 1, 2, 3, 4
.code
mov esi, 3 ; subíndice (elemento a obtener)
mov eax, arregloD[esi * TYPE arregloD] ; Utilizando el operador TYPE para obtener el número de bytes
