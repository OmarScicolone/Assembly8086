		.data
var:	.word 0x3FFFFFF0
		
		.text
		.globl main
		.ent main

main:
		
		lw $t1, var
		add $t1, $t1, $t1
		li $v0, 1
		move $a0, $t1
		syscall
		
		addiu $t2, $t1, 40  #bisogna usare addiu perchè
							#fa l'operazione di somma in binario puro
							#invece addi in complemento a 2 che 
							#provoca overflow
							#per la stampa invece non c'è verso di risolvere
							#il problema
							
		
		
		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 10
		syscall
		.end main