.model small
.stack 100h
.data
a db "enter string: $"
b db 10,13,"reverse: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    xor cx,cx
    mov ah,1
    input:
    int 21h
    cmp al,13
    je end_input
    push ax
    inc cx
    jmp input
    
    end_input:
    mov ah,9
    lea dx,b
    int 21h
    
    output:
    pop ax
    mov ah,2
    mov dl,al
    int 21h
    loop output
    
    mov ah,4ch
    int 21h