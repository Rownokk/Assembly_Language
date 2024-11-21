.model small
.stack 100h
.data
a db "enter a digit: $"
b db 10,13,"ans : $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    sub al,'0'
    mov bl,al 
    
    
    mov cl,1
    
    shl bl,cl
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bl 
    add dl,'0'
    int 21h