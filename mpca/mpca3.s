.TEXT
LDR R1, =Num1      ; Load the address of the first number into register R1
LDR R2, =Num2      ; Load the address of the second number into register R2

LDR R3, [R1]       ; Load the value of the first number from memory into register R3
LDR R4, [R2]       ; Load the value of the second number from memory into register R4

ADD R5, R3, R4     ; Add the two numbers and store the result in register R5

LDR R6, =Result    ; Load the address where the result will be stored into register R6
STR R5, [R6]       ; Store the result in the memory location pointed to by R6

.BSS
Num1:   .WORD 5     ; First number (initialized to 5, replace with your value)
Num2:   .WORD 7     ; Second number (initialized to 7, replace with your value)
Result: .SPACE 4    ; Memory space to store the result (assuming it's a 32-bit word)