		.data
vett:	.word 7, 4, 1000, 2 					#word quindi sempre lw, con lb sbaglia
capo:	.byte '\n' 								#per calcolo lunghezza giusto considerare fine array capo o spazio?
msg:	.asciiz "Lunghezza vettore = "
msg1:	.asciiz "Valore max del vettore = "
		
		.text
		.globl main
		.ent main
main:	
		la $a0, vett
		move $t0, $a0
		
		lw $t3, capo
#----------------------------------
#calcolo lunghezza		
		lw $t1, ($t0)
		
len:	beq $t1, $t3, fuori	
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		lw $t1, ($t0)
		j len
fuori:	
		la $a0, msg 		
		li $v0, 4
		syscall
		
		move $a0, $t2		
		li $v0, 1
		syscall
		
		move $a0, $t3	
		li $v0, 11
		syscall
#----------------------------------
#carimento dati in a0 e a1		
		la $a0, vett	#indirizzo vett
		move $a1, $t2	#lunghezza
		
		jal massimo
		move $s0, $v0
		
		la $a0, msg1 		
		li $v0, 4
		syscall
		
		move $a0, $s0
		li $v0, 1
		syscall
	
		li $v0, 10
		syscall
		.end main
#---------------------------------		
massimo:

			lw $t4, ($a0) 	#max
			li $t6, 1 		#indice per contare i cicli
			
			move $t5, $a0 #indirizzo
			
			
ciclo:		beq $t6, $a1, fine
			addi $t6, $t6, 1
			addi $t5, $t5, 4
			lw $t8, ($t5)
			
			slt $t7, $t4, $t8
			bne $t7, 1, maxi
			move $t4, $t8
			
maxi:			
			j ciclo
fine:		
			move $v0, $t4
			jr $ra
			
			