.model small
.stack 100h
.data
a db "enter Hex digit : $"
b db 10,13,"corresponding binary: $" 
s db 10,13,"not a hex digit."
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
    
    cmp bl,"0"
    jl  Not_hex
    cmp bl,"9"
    jle Hex_num
    
    cmp bl,"A"
    jb Not_hex
    cmp bl,"F"
    jle Hex_char
    
    Not_hex:
    mov ah,9
    lea dx,s
    int 21h
    jmp endd
    
    Hex_num:
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp endd
    
    Hex_char:
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,49
    int 21h
    
    sub bl,17
   
    
    
    mov ah,2
    
    mov dl,bl
    int 21h
    jmp endd
    
    endd:
    mov ah,4ch
    int 21h
    
    
    