.TEXT
LDR R1, =FibonacciSeries ; Load the address where the Fibonacci series will be stored into register R1
MOV R2, #0              ; Initialize the first Fibonacci number to 0
MOV R3, #1              ; Initialize the second Fibonacci number to 1
MOV R4, #0              ; Initialize a counter to 0

Loop:
    STR R2, [R1, R4, LSL #2] ; Store the current Fibonacci number in the array
    ADD R5, R2, R3           ; Calculate the next Fibonacci number
    MOV R2, R3               ; Update the first Fibonacci number
    MOV R3, R5               ; Update the second Fibonacci number

    ADD R4, R4, #1           ; Increment the counter
    CMP R4, #10              ; Assuming there are 10 numbers in the Fibonacci series, adjust as needed
    BLT Loop                 ; Branch back to the Loop if the counter is less than 10

.BSS
FibonacciSeries: .SPACE 40  ; Space for 10 Fibonacci numbers (assuming 32-bit words)
