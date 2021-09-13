	    .data
serie:  .space 80
spazio: .byte '\n'

		
		.text
		.globl main
		.ent main
		
main:	
		
		li $t2, 18
		li $t0, 0
		
		li $t3, 0
		sw $t3, serie($t0)
		
		li $v0, 1
		lw $a0, serie($t0)
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		
		addi $t0, $t0, 4
		
		li $t3, 1
		sw $t3, serie($t0)
		
		li $v0, 1
		lw $a0, serie($t0)
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
ciclo:	beq $t1, $t2, fine

		lw $t4, serie($t0)
		
		addi $t0, $t0, -4
		lw $t5, serie($t0)
		
		add $t6, $t4, $t5
		addi $t0, $t0, 8
		
		sw $t6, serie($t0)
		
		
		li $v0, 1
		lw $a0, serie($t0)
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		addi $t1, $t1, 1
		j ciclo
		
fine:

		li $v0, 10
		syscall
		.end main