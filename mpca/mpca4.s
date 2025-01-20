.TEXT
LDR R1, =Numbers   ; Load the address of the array of numbers into register R1
LDR R2, =EvenNumbers  ; Load the address where even numbers will be stored into register R2
LDR R3, =OddNumbers   ; Load the address where odd numbers will be stored into register R3
MOV R4, #0         ; Initialize a counter to 0

Loop:
    LDR R5, [R1, R4]  ; Load the current number from the array into register R5

    AND R6, R5, #1    ; Check if the number is odd (LSB is 1)
    CMP R6, #0        ; Compare the result with 0
    BEQ Even          ; Branch to Even label if the number is even

    ; If the number is odd, store it in the memory location for odd numbers
    STR R5, [R3, R4, LSL #2]
    B NextIteration

Even:
    ; If the number is even, store it in the memory location for even numbers
    STR R5, [R2, R4, LSL #2]

NextIteration:
    ADD R4, R4, #1    ; Increment the counter
    CMP R4, #10       ; Assuming there are 10 numbers in the array, adjust as needed
    BLT Loop          ; Branch back to the Loop if the counter is less than 10

.BSS
Numbers:      .WORD 2, 5, 8, 11, 14, 17, 20, 23, 26, 29  ; Example set of numbers
EvenNumbers:  .SPACE 40  ; Space for 10 even numbers (assuming 32-bit words)
OddNumbers:   .SPACE 40  ; Space for 10 odd numbers (assuming 32-bit words)
