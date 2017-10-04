.MODEL tiny    

.stack 100h

.data
num db 12  
CR equ 13  ;salto de carro
LF equ 0Ah ;salto de carro

men1 db CR,LF,'Digite la palabra termine con punto',CR,LF,'$'

.CODE 

Inicio: ;Punto de entrada al programa   

    mov ax,@data
    mov ds,ax
    
    ;defino caracter inicial
    mov ax,2Dh
    push ax
    
    ;imprimo mensaje
    lea dx,men1
    call print   
    
    ;ciclo para cargar la pila hasta punto
    ciclo:
        call getCh
        mov ah, 0h ;borrar ah, ax limpia
        push ax
        cmp al, 2eh
    jne ciclo

    ;ciclo para imprimir la pila hasta punto
    popcl:
        pop ax     
        call impr
        cmp al, 2Dh
    jne popcl
    jmp fin


    
    ;imprimir lo que las pilas tienen
    impr proc
        mov dl,al
        mov ah, 02h
        int 21h
        ret
    endp
    
           
    ;obtiene los datos del teclado    
    getCh proc
        mov ah,01
        int 21h 
        ret 
    endp  
    
    ;imprime datos desde la pantalla    
    print proc        
        mov ah,9
        int 21h
        ret 
    endp
    
    ;cambiar el orden de la pila
    
    ;Para terminar con DOS
    fin:        
        mov ah,0
        int 21h


END Inicio 
           
           