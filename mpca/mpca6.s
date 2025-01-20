.TEXT
LDR R1, =Numbers     ; Load the address of the array of numbers into register R1
LDR R2, =LargestNum  ; Load the address where the largest number will be stored into register R2
MOV R3, #0           ; Initialize the largest number to 0
MOV R4, #0           ; Initialize a counter to 0

Loop:
    LDR R5, [R1, R4]   ; Load the current number from the array into register R5

    CMP R5, R3         ; Compare the current number with the largest number
    BLE NextIteration  ; If the current number is less than or equal to the largest, go to the next iteration

    ; If the current number is greater than the largest, update the largest number
    MOV R3, R5
    STR R3, [R2]

NextIteration:
    ADD R4, R4, #1      ; Increment the counter
    CMP R4, #10         ; Assuming there are 10 numbers in the array, adjust as needed
    BLT Loop            ; Branch back to the Loop if the counter is less than 10

.BSS
Numbers:       .WORD 15, 7, 28, 5, 14, 20, 32, 18, 25, 11   ; Example set of numbers
LargestNum:    .SPACE 4    ; Space for the largest number (assuming a 32-bit word)
