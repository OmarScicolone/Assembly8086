		.data
matrice1: .word	4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
matrice2: .word	6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
INDICE = 2
DIM = 3
SPAZIO = DIM*4
risultato: .space SPAZIO #magari chiedere

		.text
		.globl main
		.ent main
main:
		la $a0, matrice1
		la $a1, matrice2
		la $a2, risultato
		li $a3, DIM
		
		li $t0, INDICE
		subu $sp, $sp, 4
		sw $t0, ($sp)
		
		jal Variazione

		li $v0, 10
		syscall
		.end main

Variazione:
		
		li $t1, 0   #indice per ciclo
		li $t2, 4	#numero per aggiornare l'indice
		
		lw $t6, ($sp)  	  		#carichiamo l'indice del numero da prendere
		mul $t4, $t6, $t2 		#il valore da aggiungere all'indirizzo DELLA SECONDA MATRICE per prendere il primo numero
		add $a1, $a1, $t4		#aggiungiamo all'indice t4 per fargli prendere il primo
		
		mul $t3, $a3, $t2 		#la variazione di indirizzo della seconda matrice
								#serve anche per la prima
		mul $t8, $t3, $t6		#il numero da aggiungere all'indirizzo della prima matrice per prendere il primo elemento che ci interessa
		add $a0, $a0, $t8
inizio:	
		beq $t1, $a3, fine
		
		lw $t5, ($a1)			#SECONDO NUMERO PRESO
		
		
		lw $t9, ($a0)			#PRIMO NUMERO PRESO
		
		
		sub $t5, $t5, $t9
		mul $t5, $t5, 100
		div $t5, $t5, $t9
		
		sw $t5, ($a2)
		
		add $a1, $a1, $t3
		add $a0, $a0, $t2
		addi $a2, $a2, 4
		addi $t1, $t1, 1
		j inizio

fine:	
		jr $ra