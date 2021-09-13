		.data
wrd:	.asciiz "ciao" #alla fine ha \0 oppure 0?
cara:	.byte 'a'	   #non posso caricare il valore \0...
carA:	.byte 'A'	   #VEDI SOTTO
 		
		.text
		.globl main
		.ent main
main:
		la $t0, wrd				 #prima lettera
		
		lb $t3, cara
		lb $t4, carA
		sub $a1, $t3, $t4 		 #il valore per la differenza
ciclo:	
		lb $t1, ($t0)			 #mettiamo in t1 il carattere
		beq $0, $t1, fine		 #controlliamo se il carattere e' zero, fine stringa
		
		move $a0, $t1			 #in a0 per passarlo alla proc
		
		jal grande
		sb $v0, ($t0)
		
		addi $t0, $t0, 1 		###PERCHE DI 1?
		j ciclo
	
fine:	
		li $v0, 4
		la $a0, wrd
		syscall
		
		li $v0, 10
		syscall
		.end main
		
		
		
grande:
		sub $v0, $a0, $a1
		jr $ra