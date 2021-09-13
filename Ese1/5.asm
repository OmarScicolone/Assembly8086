			.data
acapo:	.asciiz "\n" 
msg1: 		.asciiz "valore 1= "
msg2:		.asciiz "valore 2= "
msg3:		.asciiz "nuovo valore 1= "
msg4:		.asciiz "nuovo valore 2= "
			
			
			.text
			.globl main
			.ent main
main:		

			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 5
			syscall
			move $t1, $v0
			
			li $v0, 4
			la $a0, msg2
			syscall
			
			li $v0, 5
			syscall
			move $t2, $v0
			
			add $t1, $t1, $t2
			sub $t2, $t1, $t2
			sub $t1, $t1, $t2
			
			li $v0, 4
			la $a0, msg3
			syscall
			
			li $v0, 1
			move $a0, $t1
			syscall
			
			li $v0, 4
			la $a0, acapo
			syscall
			
			li $v0, 4
			la $a0, msg4
			syscall
			
			li $v0, 1
			move $a0, $t2
			syscall
			
			
			
			li $v0, 10
			syscall
			.end main			