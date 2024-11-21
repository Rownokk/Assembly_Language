.model small
.stack 100h 
.data 
a db "3a-2b: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,'0'
    mov bl,al 
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
    
    
    mov ah,1
    int 21h
    sub al,'0'
    mov bh,al  
    
      mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9
     lea dx,a
     int 21h
     
     
     mov dh,bl
     sub dh,bh
     sub dh,bh
     add dh,bl
     add dh,bl
     mov ah,2 
     
     add dh,'0'
    
     mov dl,dh
     int 21h
     
    
    
     
    
    
    
    