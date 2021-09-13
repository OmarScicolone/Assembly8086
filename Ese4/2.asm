		.data
opa:	.word 2043
opb:	.word 5
tab:	.word som, sottr, molt, divi
res:	.word 0
		
		.text
		.globl main
		.ent main

main:	
		lw $t1, opa
		lw $t3, opb
		li $t4, 0
		li $t0, 0

		
		li $v0, 5
		syscall
		move $t0, $v0
		sll $t0, $t0, 2
	
		lw $t2, tab($t0)
		jr $t2
		
som:
		add $t4, $t1, $t3
		sw $t4, res
		j fine
sottr:
		sub $t4, $t1, $t3
		sw $t4, res
		j fine

molt:
		mul $t4, $t1, $t3
		sw $t4, res
		j fine


divi:
		div $t4, $t1, $t3
		sw $t4, res
		
fine:	
		li $v0, 1
		move $a0, $t4
		syscall
		
		li $v0, 10
		syscall
		.end main
