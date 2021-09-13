		.data
msg1:	.asciiz "Inserire numero: "
msg2:   .asciiz "Aggiungere numero alla sequenza? 1 per SI, 0 per NO = "
capo:	.byte '\n' 

		
		.text
		.globl main
		.ent main
main:
		li $t2, 1

		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		move $a0, $v0 #in s0 abbiamo il numero inserito

again:		
		jal calcolaSuccessivo
		#qua abbiamo il valore ritornato dalla funzione in v0
		
		move $t3, $v0
		
		li $v0, 11
		lb $a0, capo
		syscall
		
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 5
		syscall
		
		move $a0, $t3
		beq $v0, $t2, again 
		
		
		
		li $v0, 10
		syscall
		.end main

calcolaSuccessivo:
		
		li $t0, 1
		and $t1, $a0, $t0
		
		beq $t1, $t0, dispari
#pari
		div $a0, $a0, 2
		j stampa

dispari:	
			mul $a0, $a0, 3
			add $a0, $a0, 1
stampa:	
		li $v0, 1
		syscall
		move $v0, $a0
		jr $ra
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		