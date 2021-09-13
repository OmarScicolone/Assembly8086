		.data
DIM 	= 4
riga1:	.word 1, 2, 3, 4
riga2:	.word 2, 0, 2, 2
riga3:	.word 3, 2, 0, 0
riga4:	.word 4, 2, 0, 0


msg1:	.asciiz "Non diagonale" 
msg2:   .asciiz "Diagonale"
msg3:	.asciiz " - Non simmetrica" 
msg4:	.asciiz " - Simmetrica" 



		.text
		.globl main
		.ent main
		
main:	
		li $t0, DIM 	#costante di paragone per cicli
		li $t2, 0	 	#j indice
		li $t5, 0	 	#i indice
		la $t1, riga1 	#primo indirizzo dei valori
		
		
		#CONTROLLO DIAGONALI		
for:	
		beq $t2, DIM, finefor			 #inizio ciclo j
		#{
for2:		
			beq $t5, DIM, esci  
							
			
			bne $t2, $t5, dzero
				#lb $t8, ($t1)
				#beq $t8, $0, nond
				addi $t5, $t5, 1
				add $t1, $t1, 4 
				j for2
				
dzero:		
			lb $t8, ($t1)
			bne $t8, $0, nond
			addi $t5, $t5, 1
			add $t1, $t1, 4 			
			j for2
			
		#}
esci:		
		addi $t2, $t2, 1
		li $t5, 0
		j for

nond:	#stampare "non diagonale"
		li $v0, 4
		la $a0, msg1
		syscall
		j simm
		
finefor: #stampare "diagonale"
		li $v0, 4
		la $a0, msg2
		syscall
		
		
		
simm:		#CONTROLLO SIMMETRIA
		la $t2, riga1 	#primo indirizzo dei valori e primo elemento della diagonale
		la $t3, riga1				#per scendere nella colonna +20n, per scorrere la riga +4n

		li $t4, 0
		li $t6, DIM
		mul $s2, $t6, 4 #quello per passare allemento succe
		addi $s2, $s2, 4
		
		mul $t9, $t6, 4
		
		j for3

agg:	
		#add $t2, $t2, $s2
		#add $t3, $t3, $s2
		
		la $t2, riga1
		add $t2, $t2, $s2
		
		la $t3, riga1 
		add $t3, $t3, $s2
			
		
for3:			
		sub $t6, $t6, 1
		beq $t6, $0, sim
		li $t4, 0
	
		
		
for4:	
		beq $t4, $t6, agg
		
		add $t2, $t2, $t9
		addi $t3, $t3, 4
		
		lb $t7, ($t2)
		lb $t8, ($t3)
			bne $t7, $t8, nosim
			
		addi $t4, $t4, 1
		j for4



nosim:	li $v0, 4
		la $a0, msg3
		syscall
		j fine 

sim:	li $v0, 4
		la $a0, msg4
		syscall
		
		
fine:   li $v0, 10
		syscall
		.end main