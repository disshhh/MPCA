.DATA
str:    .ASCIZ "dog"

.TEXT
    LDR r0, =str          ; Load address of the string into r0

    ; Find the end of the string (null-terminated)
    MOV r1, #0
Loop:
    LDRB r2, [r0, r1]     ; Load byte from the string at offset r1
    CMP r2, #0            ; Check if byte is null (end of string)
    BEQ FoundEnd          ; If end of string found, exit loop
    ADD r1, r1, #1        ; Increment offset
    B Loop

FoundEnd:
    CMP r1, #1            ; Check if string has at least two characters
    BLT End               ; If not, skip swapping
    
    ; Swap the first and last characters
    MOV r3, r0            ; Save the address of the string in r3
    LDRB r4, [r0]         ; Load the first character into r4
    ADD r5, r0, r1        ; Calculate the address of the last character
    SUB r5, r5, #1
    LDRB r6, [r5]         ; Load the last character into r6
    STRB r6, [r3]         ; Store the last character at the beginning of the string
    STRB r4, [r5]         ; Store the first character at the end of the string
    
End:
    ; Terminate program
    SWI 0x11
