		.data
msg1:	.asciiz "Inserire un numero: "
capo:	.byte	'\n'
mareea: .byte   '0'
msg2:	.asciiz "Errore, reinserire numero: "

		
		.text
		.globl main
		.ent main
main: 
		lb $t1, capo
		lb $t7, mareea
		li $v0, 4
		la $a0, msg1
		syscall
		
		
pizz:	add $s0, $0, $0
		
while:	add $t4, $0, $0

		beq $t0, $t1, finiu	
		
		li $v0, 12
		syscall
		beq $v0, $t1, finiu
		sub $v0, $v0, $t7 
		
for:	bne $v0, $t4, trovato
		mul $s0, $s0, 10
		add $s0, $s0, $v0
		j while
		
trovato: addi $t4, $t4, 1
		 bne $t4, 10, for
		
		
		li $v0, 11      
		lb $a0, capo   
		syscall	
		
		li $v0, 4
		la $a0, msg2
		syscall
		j pizz
		
		
		
finiu:   li $v0, 1
		 move $a0, $s0
		 syscall


		li $v0, 10
		syscall
		.end main