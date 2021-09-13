		.data
giorni:	.byte 62		
ore: 	.byte 5		
minuti:	.byte 44
capo:	.byte '\n'
msg0:	.asciiz "Da T0 sono passati: "
msg1:	.asciiz " giorni "
msg2:	.asciiz " ore "
msg3:	.asciiz " minuti "
msg4:	.asciiz "Che in minuti sono: "
risultato: .word 0
		
		.text
		.globl main
		.ent main
main:
		lw $t7, risultato
		
		
		
		li $v0, 4
		la $a0, msg0
		syscall
		
		lb $a0, giorni
		li $v0, 1
		syscall
		move $t0, $a0
		li $v0, 4
		la $a0, msg1
		syscall
		
		
	
		lb $a0, ore
		li $v0, 1
		syscall
		move $t1, $a0
		li $v0, 4
		la $a0, msg2
		syscall
		
		
		lb $a0, minuti
		li $v0, 1
		syscall
		move $t2, $a0
		li $v0, 4
		la $a0, msg3
		syscall
		
		
		li $v0, 11
		lb $a0, capo
		syscall
		li $v0, 4
		la $a0, msg4
		syscall
		
		mul $t0, $t0, 24
		mul $t0, $t0, 60
		
		mul $t1, $t1, 60
		
		add $t7, $t0, $t1
		add $t7, $t7, $t2
		
		move $a0, $t7
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		.end main