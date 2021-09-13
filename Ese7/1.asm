		.data
	
		.text
		.globl main
		.ent main

main:	
		li $t0, 15	
		li $t1, 16
		li $t2, 17
		li $t3, 18
		
		li $s0, 223
		li $s1, 224
		li $s2, 225
		li $s3, 226
		
		addi $sp, $sp, -16
		sw $t0, 12($sp)
		sw $t1, 8($sp)
		sw $t2, 4($sp)
		sw $t3, 0($sp)
		
		
		jal somma
		move $a0, $v0
		li $v0, 1
		syscall
		move $t4, $a0
		
		lw $t3, 0($sp)
		lw $t2, 4($sp)
		lw $t1, 8($sp)
		lw $t0, 12($sp)
		addi $sp, $sp, 16
		
		
		
		
		
		
		li $v0, 10
		syscall
		.end main
		


somma:
		addi $sp, $sp, -16
		sw $s0, 12($sp)
		sw $s1, 8($sp)
		sw $s2, 4($sp)
		sw $s3, 0($sp)
		
		li $t0, 0
		li $t1, 0
		li $t2, 0
		li $t3, 0
		
		li $s0, 0
		li $s1, 0
		li $s2, 0
		li $s3, 0
		
		lw $t2,	28($sp)
		lw $s2, 12($sp)
		
		add $v0, $t2, $s2
		
		lw $s3, 0($sp)
		lw $s2, 4($sp)
		lw $s1, 8($sp)
		lw $s0, 12($sp)
		addi $sp, $sp, 16
		
		jr $ra
		
		
		