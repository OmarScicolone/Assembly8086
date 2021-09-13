		.data
n1: 	.byte 10
n2:		.byte 0x10
n3:		.byte '1'
res:	.space 1  

		.text
		.globl main
		.ent main

main:	
		la $t0, n1			#passaggio in piu'
		lb $t1, ($t0)    	#si poteva fare lb $t1, n1
		
		lb $t2, n2			#la $t0, n2
							#lb $t2, ($t0)
		
		la $t0, n3			#lb $t3, n3
		lb $t3, ($t0)
		
		lb $t4, res			#la $t0, res	
							#lb $t4, ($t0)		
		
		sub $t0, $t1, $t2   #passare per forza dai registri? SI
		add $t4, $t0, $t3
		
		sb $t4, res
		
		li $v0, 1
		lb $a0, res    
		syscall
		
		li $v0, 10
		syscall
		.end main
		