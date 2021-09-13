		.data
capo:	.byte '\n'
msg1:	.asciiz "Palindroma"
msg2:	.asciiz "Non Palindroma"
	
		.text
		.globl main
		.ent main
main:	
		lb $t1, capo
		li $t0, 0
		li $t2, 0
		li $t5, 0
		li $t6, 0
		li $t7, 0
		
agg:	
		li $v0, 12
		syscall
		beq $v0, $t1, start #inizia controllo
		addi $sp, $sp, -4
		addi $t0, $t0, 1
		sb $v0, ($sp)  
		j agg
	
start:

		div $t6, $t0, 2  	#numero di cicli da fare
						
		lb $t2, ($sp)		#carica l'ultimo inserito
		
							
							
							#prendi il primo
		move $t7, $sp 		#prendi l'indirizzo
		mul $t0, $t0, 4  	#moltiplica per quattro l'indice
		add $t7, $t0, $t7 	#aggiungi all'indirizzo l'indice per quattro 
		addi $t7, $t7, -4   #togli quattro che punta a \n
		lb $t3, ($t7)		#carica il primo

ctrl:	#controllo
		
		beq $t5, $t6, stamp
		
		addi $sp, $sp, 4
		lb $t2, ($sp)		
		addi $t7, $t7, -4
		lb $t3, ($t7)
		addi $t5, $t5, 1
		
		bne $t2, $t3, neq
		
		j ctrl
		
		
stamp: 	#stampa messaggio di conferma
		
		li $v0, 4
		la $a0, msg1
		syscall
		j fine	
			
neq:	#stampa mess d'errore
		li $v0, 4
		la $a0, msg2
		syscall

fine:   		
		li $v0, 10
		syscall
		.end main