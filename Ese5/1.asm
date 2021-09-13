		.data
w:		.word 3141592653
		
		.text
		.globl main
		.ent main

main:	
		li $t1, 10
		lw $t0, w
		li $t2, 0	#resto
		li $t3, 0   #numero di volta in volta (?)
		li $t4, 0	#indice per contare quanti numeri
		
		
while:	beq $t0, $0, stampa    #t0 il quoziente
		
		divu $t0, $t1		
		mfhi $t2			#qui in t2 abbiamo il resto
		mflo $t0			#qui in t0 abbiamo il nuovo quoziente
		
		addi $sp, $sp, -4
		sw $t2, ($sp)
		
		
		addi $t4, $t4, 1 
		j while

stampa:	
		beq $t5, $t4, fine
		lb $t3, ($sp)
		
		li $v0, 11
		add $a0, $t3, '0'	
		syscall
		
		addi $sp, $sp, 4
		addi $t5, $t5, 1 #aggiornamento di t5
		j stampa
		
fine:

		li $v0, 10
		syscall
		.end main
