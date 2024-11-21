.model small
.stack 100h
.data
a db "Enter Upper Case: $"
b db "Lower Case: $"
.code
main proc
    mov ax,@data  ;initializing data
    mov ds,ax
    
    mov ah,9
    lea dx,a ;printing a
    int 21h 
    
    mov ah,1
    int 21h   ;input UpperCase
    mov bl,al
    
    mov ah,2
    mov dl,0dh
    int 21h    ;printing new line
    mov dl,0ah
    int 21h
    
    mov ah,9
    lea dx,b  ;printing b
    int 21h
    
    mov ah,2
    mov dl,bl ;printing lower case
    add dl,32 ;converting
    int 21h
    
    Exit:
    
    mov ah,4ch
    int 21h   ;return
    main endp 

end main