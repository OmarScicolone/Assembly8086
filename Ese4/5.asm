		.data
x:		.word 154, 123, 109, 86, 4, 0
y:		.word 412, -23, -231, 9, 50, 0
z:		.word 123, -24, 12, 55, -45, 0
mh:		.word 0, 0, 0, 0, 0, 0
spazio:	.byte ' '
capo:	.byte '\n'
		
		.text
		.globl main
		.ent main
main:	
		li $t2, 0	#la somma della prima riga
		li $t0, 0   #l'indirizzo del vettore x
		li $t3, 0	#contatore
		li $t4, 5	#max
		
again:		
		
		lw $t1, x($t0) #caricamento variabile	
		
		li $v0, 1
		move $a0, $t1
		syscall			#blocco di stampa
		li $v0, 11
		lb $a0, spazio
		syscall
		
		add $t2, $t2, $t1
		addi $t3, $t3, 1
		addi $t0, $t0, 4
		bne $t3, $t4, again		#blocco di accumulo, aggiornamento
		sw $t2, x($t0)			#e verifica
		li $v0, 1
		move $a0, $t2			#e stampa
		syscall
#------------------------------------------------------		
		li $v0, 11
		lb $a0, capo
		syscall
#------------------------------------------------------
		li $t2, 0	#la somma della seconda riga
		li $t0, 0   #l'indirizzo del vettore y
		li $t3, 0	#contatore
		
again2:		
		
		lw $t1, y($t0)
		
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		add $t2, $t2, $t1
		addi $t3, $t3, 1
		addi $t0, $t0, 4
		bne $t3, $t4, again2
		sw $t2, y($t0)
		li $v0, 1
		move $a0, $t2
		syscall
#------------------------------------------------------		
		li $v0, 11
		lb $a0, capo
		syscall
#------------------------------------------------------		
		li $t2, 0	#la somma della terza riga
		li $t0, 0   #l'indirizzo del vettore z
		li $t3, 0	#contatore
		
again3:		
		
		lw $t1, z($t0)
		
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		add $t2, $t2, $t1
		addi $t3, $t3, 1
		addi $t0, $t0, 4
		bne $t3, $t4, again3
		sw $t2, z($t0)
		li $v0, 1
		move $a0, $t2
		syscall
#------------------------------------------------------		
		li $v0, 11
		lb $a0, capo
		syscall
#------------------------------------------------------	
#adesso la parte per calcolare l'ultima riga
		
		li $t0, 0				#indirizzi
		li $t1, 0				#caricamento
		li $t3, 0				#indice
		li $t4, 6				#max
				
		
again4:	
		li $t2, 0				#accumulatore
		lw $t1, x($t0)
		add $t2, $t2, $t1
		lw $t1, y($t0)
		add $t2, $t2, $t1
		lw $t1, z($t0)
		add $t2, $t2, $t1
		sw $t2, mh($t0)
		
		addi $t0, $t0, 4
		addi $t3, $t3, 1
		
		li $v0, 1
		move $a0, $t2
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		bne $t3, $t4, again4
		
		





		li $v0, 10
		syscall
		.end main