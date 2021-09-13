			.data
unoUno:		.word	1
unoDue:		.word	2
unoTre:		.word	3
dueUno:		.word	4
dueDue:		.word	5
dueTre:		.word	6
treUno:		.word	1
treDue:		.word	8
treTre:		.word	9
msg1:		.asciiz "Il determinante3x3 vale = "
			
			.text
			.globl main
			.ent main
main:	
			addi $sp, $sp, -4
			sw $ra, ($sp)
			
			lw $a0, unoUno
			lw $a1, unoDue
			lw $a2, unoTre
			lw $a3, dueUno
			
			lw $t0, dueDue
			lw $t1, dueTre
			lw $t2, treUno
			lw $t3, treDue
			lw $t4, treTre
			
			addi $sp, $sp, -20
			sw $t0, 16($sp)
			sw $t1, 12($sp)
			sw $t2, 8($sp)
			sw $t3, 4($sp)
			sw $t4, ($sp)
			
			
			jal determinante3x3
			move $t9, $v0
			
			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 1
			move $a0, $t9
			syscall
			
			
			lw $t4, ($sp)
			lw $t3, 4($sp)
			lw $t2, 8($sp)
			lw $t1, 12($sp)
			lw $t0, 16($sp)
			addi $sp, $sp, 20

			
			lw $ra, ($sp)
			addi $sp, $sp, 4
			
			jr $ra

determinante3x3:
			addi $sp, $sp, -4
			sw $ra, ($sp)
			
			move $t5, $a0  #unoUno
			move $t6, $a1 #unoDue
			move $t7, $a2 #unoTre
			move $t8, $a3 #dueUno
			
			
			
			
			
			lw $a0, 20($sp)
			lw $a1, 4($sp)
			lw $a2, 16($sp)
			lw $a3, 8($sp)
			jal determinante2x2
			mul $s0, $v0, $t5
			
			move $a0, $t8
			lw $a1, 4($sp)
			lw $a2, 16($sp)
			lw $a3, 12($sp)
			jal determinante2x2
			mul $s1, $v0, $t6
			
			move $a0, $t8
			lw $a1, 8($sp)
			lw $a2, 20($sp)
			lw $a3, 12($sp)
			jal determinante2x2
			mul $s2, $v0, $t7
			
			sub $v0, $s0, $s1
			add $v0, $v0, $s2
			
			lw $ra, ($sp)
			addi $sp, $sp, 4
			
			jr $ra
			
determinante2x2:

			mul $a0, $a0, $a1
			mul $a2, $a2, $a3
			sub $v0, $a0, $a2
			
			jr $ra		