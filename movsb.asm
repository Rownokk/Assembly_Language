.MODEL SMALL
.STACK 100H
.DATA
SRC_STRING DB 'HELLO$'
DEST_STRING DB 5 DUP(?)
NEWLINE DB 13, 10, '$'    ; Newline for output
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX  ; Assume both source and destination are in the same segment
    
    LEA SI, SRC_STRING  ; Source string address
    LEA DI, DEST_STRING ; Destination string address
    MOV CX, 5         ; Length of the string to copy
    
    CLD                 ; Clear direction flag (DF = 0), so the string will be copied from left to right
    REP MOVSB           ; Repeat MOVSB for CX times, copying byte by byte
    
    ; Now print the copied string
    LEA DX, DEST_STRING ; Load destination string address into DX
    MOV AH, 9           ; DOS service to display string
    INT 21H             ; Call DOS interrupt to print the string
    
    ; Print newline for clarity
    LEA DX, NEWLINE
    MOV AH, 9           ; DOS service to display string
    INT 21H             ; Call DOS interrupt to print newline  
    
    lea dx,src_string
    mov ah,9
    int 21h
    
    MOV AH, 4CH         ; Terminate program
    INT 21H
MAIN ENDP
END MAIN
