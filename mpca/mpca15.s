.global _start 
_start:

	.text
	.data
	matrix1:
	.word 1,2,3,4,5,6,7,8,9 
	matrix2:
	.word 1,0,0,0,1,0,0,0,1 
	matrix3:
	.word 0,0,0,0,0,0,0,0,0 
	mov r0,#0 
	mov r1,#0 
	ldr r2,=matrix3 
	ldr r4,=matrix1
	ldr r5,=matrix2
	mov r9,#0
	mov r10,#0
	l2:
	ldr r6,[r4,r10]
	ldr r7,[r5,r10]
	mul r8,r6,r7
	str r8,[r2,r10]
	add r10,r10,#4
	add r1,r1,#1
	add r9,r9,#1
	cmp r9,#9
	beq end
	bne l2

