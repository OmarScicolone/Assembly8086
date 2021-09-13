		.data
a:		.space 	8
bi:		.space	8
ci:		.space	8
capo:	.byte '\n'
msg1:	.asciiz "Inserire a, b, c, dell'equazione ax^2 + bx + c = 0 " 
msg2:	.asciiz "a vale: " 
msg3:	.asciiz "b vale: " 
msg4:	.asciiz "c vale: " 
msg5:	.asciiz "L'equazione ha una sola soluzione" 
msg6:	.asciiz "L'equazione non ha soluzioni" 
msg7:	.asciiz "L'equazione ha 2 soluzioni" 

		.text
		.globl main
		.ent main
		
main:	

		la $t0, a
		la $t1, bi
		la $t2, ci
		
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 11
		lb $a0, capo
		syscall
		
		
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, msg4
		syscall
		li $v0, 5
		syscall
		move $t2, $v0
		
		
		#b^2 - 4ac
		#b^2
		mul $t1, $t1, $t1
		mul $t3, $t0, $t2
		mul $t3, $t3, 4
		sub $t4, $t1, $t3 #in t4 il delta
		
		beq $t4, $0, unasol 
		slt $t5, $t4, $0
		beq $t5, 1, nosol
		
		li $v0, 4
		la $a0, msg7  #l equazione ha due soluzioni
		syscall
		j fine
		
		
nosol:	li $v0, 4
		la $a0, msg6
		syscall
		j fine

unasol: li $v0, 4
		la $a0, msg5
		syscall

		
fine:   li $v0, 10
		syscall
		.end main
		