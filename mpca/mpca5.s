.TEXT
LDR R1, =Numbers       ; Load the address of the array of numbers into register R1
LDR R2, =PositiveNumbers ; Load the address where positive numbers will be stored into register R2
LDR R3, =NegativeNumbers ; Load the address where negative numbers will be stored into register R3
LDR R4, =ZeroNumbers     ; Load the address where zero numbers will be stored into register R4
MOV R5, #0             ; Initialize a counter to 0

Loop:
    LDR R6, [R1, R5]     ; Load the current number from the array into register R6

    CMP R6, #0           ; Compare the number with 0
    BGT Positive         ; Branch to Positive label if the number is greater than 0
    BLT Negative         ; Branch to Negative label if the number is less than 0

    ; If the number is 0, store it in the memory location for zero numbers
    STR R6, [R4, R5, LSL #2]
    B NextIteration

Positive:
    ; If the number is positive, store it in the memory location for positive numbers
    STR R6, [R2, R5, LSL #2]
    B NextIteration

Negative:
    ; If the number is negative, store it in the memory location for negative numbers
    STR R6, [R3, R5, LSL #2]

NextIteration:
    ADD R5, R5, #1        ; Increment the counter
    CMP R5, #10           ; Assuming there are 10 numbers in the array, adjust as needed
    BLT Loop              ; Branch back to the Loop if the counter is less than 10

.BSS
Numbers:        .WORD 2, -5, 8, -11, 0, 14, -17, 20, 0, -29   ; Example set of numbers
PositiveNumbers: .SPACE 40  ; Space for 10 positive numbers (assuming 32-bit words)
NegativeNumbers: .SPACE 40  ; Space for 10 negative numbers (assuming 32-bit words)
ZeroNumbers:     .SPACE 40  ; Space for 10 zero numbers (assuming 32-bit words)
