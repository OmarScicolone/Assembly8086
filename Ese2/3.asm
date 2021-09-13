		.data
a:		.word 10	
b1:		.word 10
c:		.word 1
msg1:	.asciiz "i numeri in ordine sono: " 
msg2:	.asciiz " - "

		.text
		.globl main
		.ent main

main:	
		lw $t0, a
		lw $t1, b1
		lw $t2, c
		
			sgt $t3, $t0, $t1
			beq $t3, $0, notswap
			
			move $s0, $t1 
			move $t1, $t0 
			move $t0, $s0
			#scambio fatto
			#qui hai a>b
			
notswap:	 

			sgt $t4, $t0, $t2
			beq $t4, $0, notswap2
			
			move $s0, $t2 
			move $t2, $t0 
			move $t0, $s0
			#scambio fatto
			#qui hai a>c

notswap2:	
			
			sgt $t5, $t1, $t2
			beq $t5, $0, notswap3
			
			move $s0, $t2 
			move $t2, $t1 
			move $t1, $s0
			#scambio fatto
			#qui hai b>c

notswap3:
			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 1
			move $a0, $t0
			syscall
		
			li $v0, 4
			la $a0, msg2
			syscall
		
			li $v0, 1
			move $a0, $t1
			syscall
		
			li $v0, 4
			la $a0, msg2
			syscall
		
			li $v0, 1
			move $a0, $t2
			syscall
		
		
		li $v0, 10
		syscall
		.end main