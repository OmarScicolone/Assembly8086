		.data
msg1:	.asciiz "Inserire numero: "
	
		.text
		.globl main
		.ent main
main:	
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		move $a0, $v0 #in a0 abbiamo il numero inserito
	
		addi $sp, $sp, -4
		sw $ra, ($sp)
		
		jal sequenzaDiCollatz
		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
sequenzaDiCollatz:
		addi $sp, $sp, -4
		sw $ra, ($sp)
		
		jal calcolaSuccessivo
		
		move $a0, $v0
		li $v0, 1
		syscall
		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
calcolaSuccessivo:
		li $t0, 1
		li $v0, 0

again:	add $v0, $v0, 1
		and $t1, $a0, $t0
		
		beq $t1, $t0, dispari
#pari
		div $a0, $a0, 2
		j conta

dispari:	
			mul $a0, $a0, 3
			add $a0, $a0, 1

conta:		bne $a0, $t0, again		
			add $v0, $v0, 1
			jr $ra
			

			
		
		
		
		
		
		
		
		
		
		
		
		
	