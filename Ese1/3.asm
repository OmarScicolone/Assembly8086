		.data
op1: 	.byte 150
op2: 	.byte 100

		.text
		.globl main
		.ent main

main:    
		lbu $t0, op1 #lbu e non lb perche' 150 non sta su un solo byte e quindi serve piu' spazio eliminando il segno
		lb $t1, op2
		
		add $t0, $t1, $t0
		
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 10
		syscall
		.end main
		