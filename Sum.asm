.model small
.stack 100h
.data 
a db "enter First digit: $"
b db "enter Second digit: $" 
s db "Sum = $"
.code
main proc
    mov ax,@data
    mov ds,ax ;data initializing
    
    mov ah,9
    lea dx,a  ;printing a
    int 21h  
    
    mov ah,1
    int 21h   ;input first digit
    mov bl,al 
    
    mov ah,2
    mov dl,10
    int 21h   ;new line
    mov dl,13
    int 21h 
     
     
    mov ah,9
    lea dx,b  ;printing b
    int 21h  
    
    mov ah,1
    int 21h
    mov bh,al ;input second digit
      
    mov ah,2
    mov dl,10
    int 21h   ;new line
    mov dl,13
    int 21h 
    
    mov ah,9
    lea dx,s  ;printing s
    int 21h  
    
    add bl,bh ;sum of 2 digits
    
    mov ah,2
    mov dl,bl
    sub dl,48 ;output
    int 21h
    
    exit:
    
    mov ah,4ch
    int 21h  ;return
    main endp
end main
    