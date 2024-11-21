.model small
.stack 100h

.data
a db " enter charachter: $" 

b db 10,13, "char: $"
c db 10,13,"not any $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp al,"A"
    jb  no
    cmp al,"Z"
    jg no 
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h 
    jmp exit
    
    no:
    
    mov ah,9
    lea dx,c
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    