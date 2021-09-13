		.data
lato = 8
aste:	.byte '*'
capo:	.byte '\n'

		.text
		.ent main
main:	

		
		
		lb $a1, aste
		lb $a2, capo
		
		li $a0, lato
		jal	stampaTriangolo
		
		move $a0, $a2
		li $v0, 11
		syscall
		
		
		li $a0, lato
		jal stampaQuadrato

		
		li $v0, 10
		syscall
		.end main
		
stampaTriangolo:
		move $t3, $a0   #in t3 abbiamo 8
		li $t0, 0 		#indiceCiclo
		li $t1, 0 		#indiceTriangolo
		
		j salto

while:	
		li $t1, 0
		move $a0, $a2
		li $v0, 11
		syscall
		j salto

while3:
		addi $t1, $t1, 1
salto:	
		
		move $a0, $a1
		li $v0, 11
		syscall				#stampa *
		
		bne $t1, $t0, while3
		
		addi $t0, $t0, 1
		bne $t0, $t3, while
		
		jr $ra
		
		
		
stampaQuadrato:
		move $t3, $a0
		li $t0, 0 #indiceCiclo
		li $t1, 0 

ciclo3:
		addi $t1, $t1, 1	
ciclo2:	
	
		addi $t0, $t0, 1
		move $a0, $a1
		li $v0, 11
		syscall
		bne $t0, $t3, ciclo2
		
		move $a0, $a2
		li $v0, 11
		syscall
		
		li $t0, 0
		bne $t1, $t3, ciclo3
		
		move $v0, $t3
		jr $ra
		
		
		