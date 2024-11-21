.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,"ENTER POSITION TO DELETE (1-3): $"
B DB 10,13,"UPDATED STACK: $"
C DB 10,13,"DELETED ELEMENT: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,SS
    MOV SP,100H      ; Set up the stack (stack pointer)
    
    ; Push initial values onto the stack
    PUSH 1H
    PUSH 2H
    PUSH 3H
    
    ; Display prompt to enter which element to delete
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ; Get input (1, 2, or 3)
    XOR AX,AX
    MOV AH,1
    INT 21H 
    SUB AL,'0'        ; Convert ASCII input to numeric
    XOR AH,AH
    MOV BX,AX         ; BX will store the position to delete
    
    ; Now delete the selected element
    CMP BX,1          ; If the user selects 1 (topmost element)
    JE DELETE_TOP
    CMP BX,2          ; If the user selects 2 (second element)
    JE DELETE_MIDDLE
    CMP BX,3          ; If the user selects 3 (third element)
    JE DELETE_BOTTOM
    
    JMP DONE          ; If invalid input, skip deletion

DELETE_TOP:
    POP AX            ; Pop top element (deleting it)
    JMP SHOW_UPDATE   ; Go to display the updated stack

DELETE_MIDDLE:
    POP AX            ; Pop top element
    POP DX            ; Pop second element (we are deleting this one)
    
    ; Store the deleted element to print later
    MOV DL,AL
    CALL PRINT_DELETED
    
    PUSH AX           ; Push top element back (preserve order)
    JMP SHOW_UPDATE   ; Go to display the updated stack

DELETE_BOTTOM:
    POP AX            ; Pop top element
    POP DX            ; Pop second element
    POP CX            ; Pop third element (we are deleting this one)
    
    ; Store the deleted element to print later
    MOV DL,CL
    CALL PRINT_DELETED
    
    PUSH DX           ; Push second element back (preserve order)
    PUSH AX           ; Push top element back
    JMP SHOW_UPDATE   ; Go to display the updated stack

SHOW_UPDATE:
    ; Print updated stack contents
    MOV AH,9
    LEA DX,B
    INT 21H

    ; Show updated stack (print the remaining elements)
    MOV BP,SP         ; Set BP to current SP
    
    POP AX            ; Pop top of stack
    MOV DL,AH         ; Show higher byte first
    CALL PRINT
    MOV DL,AL         ; Show lower byte
    CALL PRINT

    POP AX            ; Pop next element (if it exists)
    MOV DL,AH
    CALL PRINT
    MOV DL,AL
    CALL PRINT

DONE:
    MOV AH,4CH        ; Exit to DOS
    INT 21H 
    MAIN ENDP

PRINT PROC
    ADD DL,'0'        ; Convert value to ASCII
    MOV AH,2
    INT 21H
    RET
PRINT ENDP

PRINT_DELETED PROC
    MOV AH,9
    LEA DX,C          ; Print "DELETED ELEMENT: "
    INT 21H
    ADD DL,'0'        ; Convert value to ASCII
    MOV AH,2
    INT 21H
    RET
PRINT_DELETED ENDP


END MAIN
