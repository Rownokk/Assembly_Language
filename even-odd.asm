.model small
.stack 100h
.data
a db "enter num: $"
b db 10,13,"num is odd.$" 
c db 10,13,"num is even.$" 
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
    
    test bl,1
    
    jz even
    
    odd:
    mov ah,9
    lea dx,b
    int 21h
    jmp endd
    
    even:
    mov ah,9
    lea dx,c
    int 21h
    jmp endd
    
    endd:
    mov ah,4ch
    int 21h
