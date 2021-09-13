			.data
unoUno:		.word	5656
unoDue:		.word	1
dueUno:		.word	156
dueDue:		.word	12
msg1:		.asciiz "Il determinante2x2 vale = "


			.text
			.globl main
			.ent main
main:		
			lw $a0, unoUno
			lw $a1, unoDue
			lw $a2, dueUno
			lw $a3, dueDue
			
			addi $sp, $sp, -4
			sw $ra, ($sp)
			
			jal determinante2x2
		
			move $t9, $v0
			
			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 1
			move $a0, $t9
			syscall
		
			lw $ra, ($sp)
			addi $sp, $sp, 4
			
			jr $ra
			
determinante2x2:
			mul $t0, $a0, $a3
			mul $t1, $a1, $a2
			sub $v0, $t0, $t1
			
			jr $ra
			
			