matrixA: .word 5, 3, 2
.word 6, 6, 4
.word 44, 83, 1
matrixB: .word 10, 3, 7
.word 6, 5, 4
.word 3, 4, 1
matrixC: .word 0, 0, 0
.word 0, 0, 0
.word 0, 0, 0
ldr r1, =matrixA
Ldr r2, =matrixB
ldr r3, =matrixC
mov r4, #3
loop1:
mov r0, r2
mov r5, r2
mov r9, #3
loop2:
mov r8, #0
mov r7, #3
loop3:
ldr r10, [r1], #4
ldr r11, [r0, #12]!
mla r8, r10, r11, r8
subs r7, r7, #1
bne loop3
str r8, [r3], #4
add r0, r0, #4
subs r9, r9, #1
bne loop2
add r1, r1, #12
subs r4, r4, #1
bne loop1
mov r7, #1
swi 0