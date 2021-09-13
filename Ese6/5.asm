		.data
msg:  .asciiz "Inserire n: "
msg1:  .asciiz "Inserire k: "

		.text
		.globl main
		.ent main
main:
		li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 5
		syscall
		move $t8, $v0
		
		
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		move $a0, $t8
		move $a1, $v0
		
		
		jal combina
		move $t9, $v0
		
		li $v0, 1
		move $a0, $t9
		syscall
			
		
		li $v0, 10
		syscall

combina:	
		
		move $t2, $a1 #k 
		
		
		#calcolo num e den
		move $t1, $a0 #numeratore in t1 da aggiornare
		move $t4, $a1 #denominatore in t4 da aggiornare
		li $t0, 0     #indice per num
		move $t5, $a0
		move $t3, $a0
ciclo:	
		addi $t2, $t2, -1
		beq $t2, $0, fincal
		
		
		sub $t5, $t3, $t2
		mul $t1, $t1, $t5 		#aggiornamento num
		
		mul $t4, $t4, $t2	  	#aggiornamento den
		j ciclo
		
fincal: 
		div $v0, $t1, $t4
		
		jr $ra	
			
			