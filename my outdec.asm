.model small
.stack 100h
.code
main proc
    mov ax,-2345
    call outdec
    
    mov ah,4ch
    int 21h
    main endp

outdec proc
    push ax
    push bx
    push cx
    push dx
    
    or ax,ax
    jge endif
    
    push ax
    mov dl,'-'
    mov ah,2
    int 21h
    pop ax
    neg ax
    
    endif:
    xor cx,cx
    mov bx,10d
    
    repeat:
    xor dx,dx
    div bx
    push dx
    inc cx
    or ax,ax
    jne repeat
    
    mov ah,2
    
    print:
    pop dx
    add dl,'0'
    int 21h
    loop print
    
    pop ax
    
    pop cx
    pop dx
    ret
    outdec endp
    