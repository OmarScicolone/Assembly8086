		.data
hw:		.half 50
msg1:	.asciiz "Il numero di bit ad 1 e': "

		.text
		.globl main
		.ent main

main:	
		lh $t1, hw
		li $t0, 1
		
		li $t5, 16
		
ciclo:		
		and 	$t3, $t1, $t0
		beq 	$t3, $0, jumpa
		addi	$t4, $t4, 1
		
		
jumpa:	
		addi	$t6, $t6, 1
		sll		$t0, $t0, 1
		
		
		bne 	$t6, $t5, ciclo
		
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall
			
		
		li $v0,10
		syscall
		.end main