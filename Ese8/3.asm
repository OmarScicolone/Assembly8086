		.data
NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM
		.text
		.globl main
		.ent main
main: 
		la $a0, prezzi
		la $a1, scontati
		li $a2, NUM
		li $a3, SCONTO
		li $t0, ARROTONDA
		subu $sp, 4
		sw $t0, ($sp)
		jal calcola_sconto

		.end main
		
calcola_sconto:
		li $t2, 100
	
		
		lw $t1, ($a0)
		mul $$t1, $t1, $a3
		