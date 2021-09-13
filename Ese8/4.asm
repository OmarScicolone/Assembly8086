		.data
DIM = 5

vet1: .word 56, 12, 98, 129, 58
vet2: .word 1, 0, 245, 129, 12
risultato: .space DIM

		.text
		.globl main
		.ent main
main:
		la $a0, vet1
		la $a1, vet2
		la $a2, risultato
		li $a3, DIM
		
jal CalcolaDistanzaH

		
		
		li $t7,0
		la $a2, risultato
stampa:	
		beq $t7, $a3, esci
		
		lw $a0, ($a2) 
		li $v0, 1
		syscall
		addi $a2,$a2,4
		addi $t7,$t7,1
		j stampa
esci:
		

		li $v0, 10
		syscall
		
		.end main

CalcolaDistanzaH:
		li $t2, 0  #indice per ciclo
		li $t3, 0  #indice per l'altro ciclo
		li $t9, 32 #numro bit
for:
		beq $t2, $a3, fine
		
		lw $t0, ($a0)
		lw $t1, ($a1)


		
for2:	
		beq $t3, $t9, fine2

		and $t4, $t0, 1
		and $t5, $t1, 1
		
		beq $t4, $t5, uguali
		addi $t6, $t6, 1 #aggiorna ogni volta che sono diversi
uguali:		
		srl $t0, $t0, 1
		srl $t1, $t1, 1
		addi $t3, $t3, 1
		j for2
fine2:	
		sw $t6, ($a2)
		addi $a2,$a2,4
		
		li $t6, 0
		li $t3, 0
		
		addi $a0,$a0,4
		addi $a1,$a1,4
		addi $t2,$t2,1
		
		j for
		
		
fine:	

		jr $ra
		
		