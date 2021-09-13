.data
var:	.word 0x3FFFFFF0
		
		.text
		.globl main
		.ent main

main:
		
		lw $t1, var
		add $t1, $t1, $t1
		
		addi $t2, $0, 40
		addu	$t2, $t1, $t2 
							
		
		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 10
		syscall
		.end main