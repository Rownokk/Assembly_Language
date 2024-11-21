.model small
.stack 100h
.data
a db "enter uppercase: $"
b db 10,13, "lowercase: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,a
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
  
    mov bl,al
    
    lea dx,b
    mov ah,9
    int 21h
    
    mov ah,2
    
    mov dl,bl
    sub dl,32
    int 21h