/*convert C code into X=(a+b)-c */
/*convert C code into Z=(a<<2)|(b & 15)*/

a: .WORD 10
b: .WORD 15
c: .WORD 20
x: .WORD 0

LDR R1,=a
LDR R2,=b
LDR R3,=c
LDR R8,=x

LDR R4,[R1]
LDR R5,[R2]
LDR R6,[R3]
ADD R7,R4,R5
SUB R7, R7,R6
STR R7,[R8]

SWI 0X11

/*
a: .WORD 1
b: .WORD 15
z: .WORD 0

LDR R1,=a
LDR R2,=b
LDR R3,=z

LDR R4,[R1]
LDR R5,[R2]
MOV R1,R1,LSL #2
AND R5,R5,#15
ORR R7,R0,R5
STR R7,[R3]
SWI 0X11
*/