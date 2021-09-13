			.data
anni: 		.word 1945, 2008, 1800, 2006, 1748, 1600
risultato: 	.word 0, 0, 0, 0, 0, 0
lunghezza: 	.word 6

			.text
			.globl main
			.ent main
main:	
		la $a0, anni
		la $a1, risultato
		lw $a2, lunghezza
		
		jal bisestile
		
		#PROVA 
		sub $a1, $a1, 24
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4 
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4
		lw $a0, ($a1)
		li $v0, 1
		syscall
		addi $a1, $a1, 4   		
		#FINE PROVA
		
		li $v0, 10
		syscall
		
bisestile:
		li $t0, 0         #indice
		li $t2, 100
		li $t4, 400
		li $t5, 1
		li $t6, 4

ciclo:								                 	
		lw $t1, ($a0)
if:		
		div $t1, $t2		#divisione per 100
		mfhi $t3			#event resto
		bne $t3, $0, else
			div $t1, $t4
			mfhi $t3
			bne $t3, $0, agg
			sw $t5, ($a1)	
			j agg		
else:	
		div $t1, $t6
		mfhi $t3
		bne $t3, $0, agg
		sw $t5, ($a1)
		j agg

agg:
		addi $t0, $t0, 1
		addi $a0, $a0, 4 
		addi $a1, $a1, 4

		bne $t0, $a2, ciclo
		jr $ra
		 