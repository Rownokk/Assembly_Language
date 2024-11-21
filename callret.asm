.model small
.stack 100h
.data
a db "enter data1: $"
b db 10,13,"enter data2: $"
c db 10,13,"sum: $"
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
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    call myproc 
    mov ah,9
    lea dx,c
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    main endp
    
    
myproc proc
    add bl,bh
    
    sub bl,'0'
    
    ret
    myproc endp
end main
    
    
    