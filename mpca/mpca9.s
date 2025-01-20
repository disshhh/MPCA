.data
    array:   .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10    @ Example array
    size:    .word 10                               @ Size of the array
    result:  .word 0                                @ Memory location to store the result

.text
    LDR R0, =array        @ Load address of the array into R0
    LDR R1, =size         @ Load address of the size into R1
    LDR R2, [R1]          @ Load the size of the array into R2

    MOV R3, #0            @ Initialize sum to 0
    MOV R4, #0            @ Initialize index to 0

sum_loop:
    CMP R4, R2            @ Compare index with the size of the array
    BGE end_sum_loop      @ If index is greater than or equal to size, exit loop

    LDR R5, [R0, R4, LSL #2]  @ Load element at current position into R5
    ADD R3, R3, R5        @ Add current element to sum

    ADD R4, R4, #2        @ Increment index by 2 to move to the next alternate position
    B sum_loop            @ Repeat loop

end_sum_loop:
    LDR R6, =result       @ Load address of the result memory location into R6
    STR R3, [R6]          @ Store the sum in the result memory location

    ; Exit program
    MOV R7, #1            @ Exit syscall number
    SWI 0                 @ Perform syscall