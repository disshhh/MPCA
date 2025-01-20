LDR r0, =array_A
LDR r1, =array_B
MOV r2, #4
MOV r5, #0

Convolution:
    LDR r3, [r0], #4
    LDR r4, [r1], #4
    MUL r6, r3, r4
    ADD r5, r5, r6
    ADD r5, r5, r5
    SUBS r2, r2, #1
    CMP r2, #0
    BNE Convolution

SWI 0x011
.data
array_A: .word 1, 2, 3, 4
array_B: .word 5, 6, 7, 8
