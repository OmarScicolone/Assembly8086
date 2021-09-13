		.data
x:		.word 0, 1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10
y:		.word 0, 1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10
pita:	.space 484 #ogni numero e' 32 bit, quindi 32 * 121 /4
spazio: .byte ' ' 
capo:	.byte '\n'
.text
		.globl main
		.ent main

main:	
		li $t5, 0
		li $t0, 0 #indirizzox
		li $t3, 0 #indirizzoy
		
		li $t6, 0 #x
		li $t7, 0 #y
		
		li $t1, 0 #indice x
		li $t4, 0 #indice y
		
		li $t2, 11 #il 10 per il ciclo
		j for

agg:	addi $t1, $t1, 1 #aggiornameto di indicex
		addi $t0, $t0, 4  #aggiornameto di indirizzox
		
		li $v0, 11
		lb $a0, capo
		syscall
		
for:	beq $t1, $t2, fine
		li $t4, 0 #ri-inizializzazione di indicey a 0
		li $t3, 0 #ri-inizializzazione di indirizzoy a 0
		
		lw $t6, x($t0)

for2:	beq $t4, $t2, agg
		lw $t7, y($t3)
		mul $t8, $t6, $t7
		
		sw $t8, pita($t5)
		addi $t5, $t5, 4

		li $v0, 1
		move $a0, $t8
		syscall
		li $v0, 11
		lb $a0, spazio
		syscall
		
		
		
		addi $t4, $t4, 1
		addi $t3, $t3, 4
		j for2
		
fine: 	
		li $v0, 11
		lb $a0, capo
		syscall		
		
		li $v0, 11
		lb $a0, capo
		syscall
		li $t0, 480
		li $v0, 1
		lb $a0, pita($t0)
		syscall
		

		li $v0, 10
		syscall
		.end main
		
		
		
		