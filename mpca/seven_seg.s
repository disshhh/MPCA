;Write a program to display values using Seven Segment Display;(Upcounter).

a:.word 100000
.equ A, 0x80
.equ B, 0x40
.equ C, 0x20
.equ D, 0x08
.equ E, 0x04
.equ F, 0x02
.equ G, 0x01
.equ P, 0x10

mov r2, #16
tab:
.word A|B|C|D|E|G ;0
.word B|C ;1
.word A|B|F|E|D ;2
.word A|B|F|C|D ; 3
.word G|F|C ;4
.word A|G|F|C|D ;5
.word A|G|E|D|C|F ;6
.word A|B|C ;7
.word A|B|C|D|E|F|G ;8
.word A|B|G|F|C ;9
.word A|G|E|C|B|F ;A
.word A|B|C|D|E|F|G|P ;B
.word A|G|E|D ;C
.word A|B|C|D|E|G|P ;D
.word A|G|F|E|D ;E
.word A|G|F|E ;F

ldr r5, =tab

upcount:ldr r0, [r5], #4
swi 0x200
bl delay
sub r2, r2, #1
cmp r2, #0
beq exit
b upcount
delay:
ldr r6, =a
ldr r7, [r6]
loop:
sub r7, r7, #1
cmp r7, #0
bne loop
mov pc, lr
exit:
swi 0x11