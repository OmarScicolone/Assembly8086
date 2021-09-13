		.data
msg1:	.asciiz "Inserire un numero: "
capo:	.byte	'\n'
zero: .byte   '0'
msg2:	.asciiz "Errore, reinserire numero: "
msg3:	.asciiz "Errore OVERFLOW, reinserire numero: "
msg4:	.asciiz "Errore OVERFLOW2, reinserire numero: "


		
		.text
		.globl main
		.ent main
main: 
		lb $t1, capo
		lb $t7, zero
		li $v0, 4
		li $t3, 10
		la $a0, msg1
		syscall
		
		
daccapo:	add $s0, $0, $0
		
while:	add $t4, $0, $0

		beq $t0, $t1, fin	
		
		li $v0, 12
		syscall
		beq $v0, $t1, fin
		sub $v0, $v0, $t7 
		
for:	bne $v0, $t4, nontrov
		mult $s0, $t3 
		
		mfhi $t2
		#or $t2, $t2, $0			
		beq $t2, $0, ad
									#controllo hi vuoto
		
		li $v0, 11      
		lb $a0, capo   
		syscall	
		li $v0, 4
		la $a0, msg3
		syscall
		j daccapo
		
		
		
ad:		mflo $s0		
		add $t5, $s0, $v0  
		blt	$t5, $s0, errore
		move $s0, $t5
		j while
		
errore:	
		li $v0, 11      
		lb $a0, capo   
		syscall	
		li $v0, 4
		la $a0, msg4
		syscall
		j daccapo
							
		
nontrov: addi $t4, $t4, 1
		 bne $t4, 10, for
		
		
		li $v0, 11      
		lb $a0, capo   
		syscall	
		
		li $v0, 4
		la $a0, msg2
		syscall
		j daccapo
		
		
		
fin:  	 li $v0, 1
		 move $a0, $s0
		 syscall


		li $v0, 10
		syscall
		.end main