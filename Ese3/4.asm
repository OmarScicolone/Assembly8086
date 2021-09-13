		.data
DIM = 3
array:	.word 0
msg2:	.asciiz "La media vale: "
msg1:	.asciiz "inserire un numero: "

		.text
		.globl main
		.ent main
main:
		li $t0, DIM
		lw $t4, array
		add $t1, $0, $0
		addi $t3, $0, 1

		
for:	addi $t1, $t1, 1
		
		
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		add $t4, $v0, $t4		
		
		bne	$t1, $t0, for
		div $t4, $t4, $t0

		
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		move $a0, $t4
		syscall

		
		
		li $v0, 10
		syscall
		.end main