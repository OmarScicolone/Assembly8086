		.data
msg1:	.asciiz "Inserire un intero: "
msg2:	.asciiz "Inserire un altro intero: "
msg3:	.asciiz "Il primo intero non e' rappresentabile su un byte "
msg4:	.asciiz "Il secondo intero non e' rappresentabile su un byte "

		.text
		.globl main
		.ent main 
		
main:	
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 5
		syscall
		move $t2, $v0
		
		li $t0, 0xFFFFFF00
		and $t3, $t1, $t0
		and $t4, $t2, $t0
		
		
		beq $t3, $zero, entra
		#non entra
		li $v0, 4
		la $a0, msg3
		syscall
		j fine
		
		
entra:	
		beq $t4, $zero, entra2
		#non entra
		li $v0, 4
		la $a0, msg4
		syscall
		j fine
		
		#adesso seguente operazione
entra2:		
		not  $s0, $t2
		and  $s1, $t1, $s0
		not  $s2, $s1
		xor  $s3, $t1, $t2
		or 	 $s5, $s3, $s2
		
		
		li $t7, 0x000000FF 		#capire perchè il prof fa questi
		and $ts5, $s5, $t1		#due passaggi in piu, che traformano il res da -1 a 255
		
		
		
		li $v0, 1
		move $a0, $s5
		syscall


fine:			
		li $v0, 10
		syscall
		.end main
		