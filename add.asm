.model small
.stack 100h
.data
a db "enter dig 1: $"
b db 10,13,"enter dig 2: $" 
s db 10,13,"Sum: $"
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
    
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,1
    int 21h
    
    sub al,'0'
    mov bh,al 
    
    mov ah,9
    lea dx,s
    int 21h
    
    
    add bl,bh
   
    
    mov ah,2
    
    add bl,'0' 
    mov dl,bl
    int 21h
    
    
    
    
    
    
    