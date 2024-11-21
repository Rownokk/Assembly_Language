.model small
.stack 100h

.data
msg1 db 'Enter a string (e.g., 23221): $'
result db 10,13, 'Character 2 appears: $'
input db 20 dup('$')
char db '5'       ; The character to count
count db 0        ; Frequency count

.code
main proc
    ; Setup data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt message
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Get user input
    lea dx, input
    mov ah, 0Ah
    int 21h

    ; Initialize pointers
    lea si, input + 2   ; SI points to the first character in input (skip first 2 bytes)
    mov cx, 20          ; Set CX as the maximum number of characters to check

count_loop:
    lodsb               ; Load the next character from the input into AL
    cmp al, 0Dh         ; Check for Enter key (end of input)
    je display_result   ; If Enter, jump to display result
    cmp al, char        ; Compare the character in AL with '2'
    jne continue_loop   ; If not equal, skip incrementing count

    inc count           ; Increment count if '2' is found

continue_loop:
    loop count_loop     ; Repeat until all characters are checked

display_result:
    ; Display the result message
    mov ah, 9
    lea dx, result
    int 21h

    ; Display the character '2' for the number of times it was counted
    mov cl, count       ; Load the count into CL
    mov dl, char        ; Load the character to print into DL

print_loop:
    mov ah, 2           ; DOS interrupt to print a character
    int 21h
    loop print_loop     ; Repeat for the count of the character

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp
end main