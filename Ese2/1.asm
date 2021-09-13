		.data
msg1:	.asciiz "Inserire un intero: "
msg2:	.asciiz "Numero inserito dispari "
msg3:	.asciiz "Numero inserito pari "

		.text
		.globl main
		.ent main
main: 
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		andi $t1, $t0, 1
		
		beq $t1, $zero, pari
		li $v0, 4 #questa riga di codice compare due volte. in questo caso puo' essere scritta una sola volta prima del beq	
		la $a0, msg2
		syscall
		j dispari
		
pari:	li $v0, 4
		la $a0, msg3
		syscall
		
dispari:
		
		li $v0, 10
		syscall
		.end main