.model small
.stack 100h
.data
a db 1,2 dup (0),3,4,5,6,7
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea si,a
    mov cx,8
    
    mov ah,2
    print:
    
    mov dl,[si]
    
    add dl,'0'
    int 21h 
     push ax
    mov dl,','
    int 21h
   
    inc si
    
    loop print
    
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov cx,8
    mov ah,2
    output:
    
    
    pop ax
    
    add dl,'0'
    mov dl,al 
    int 21h
    
    mov dl,','
    int 21h
    
    loop output
    
   