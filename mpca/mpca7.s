LDR R1, =ByteNumbers  ; Load the address of the array of byte numbers into register R1
LDR R2, =Result       ; Load the address where the result will be stored into register R2
MOV R3, #0            ; Initialize the result to 0
MOV R4, #0            ; Initialize a counter to 0

Loop:
    LDRB R5, [R1, R4]   ; Load the current byte from the array into register R5

    ; Sign-extend the byte to a 32-bit signed value
    MOV R6, R5, ASR #7  ; Arithmetic shift right by 7 bits to propagate the sign bit

    ADD R3, R3, R6      ; Add the current number to the result

    ADD R4, R4, #1      ; Increment the counter
    CMP R4, #10         ; Assuming there are 10 numbers in the array, adjust as needed
    BLT Loop            ; Branch back to the Loop if the counter is less than 10

    STR R3, [R2]        ; Store the result in the memory location pointed to by R2

.BSS
ByteNumbers:  .BYTE 2, -5, 8, -11, 0, 14, -17, 20, 0, -29   ; Example array of byte numbers
Result:       .SPACE 4    ; Space for the result (assuming a 32-bit word)
