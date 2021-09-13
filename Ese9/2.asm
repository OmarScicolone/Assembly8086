			.data
str_orig: 	.asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente"
str_sost: 	.asciiz "per me si va"
str_new: 	.space 200
			.text
			.globl main
			.ent main
main: 
			la $a0, str_orig
			la $a1, str_sost
			la $a2, str_new

			la $t9, str_new	#controllo
			
			jal sostituisci

			li $v0, 4
			move $a0, $t9 #stampa
			syscall
			
			li $v0, 10
			syscall



sostituisci:
			li $t0, '%'
			li $t2, 0x00
			lb $t1, ($a0)
				
			
ciclo2:		beq $t1, $t2, fine
			bne $t1, $t0, agg
			
ciclo:		lb $t3, ($a1)
			beq $t3, $t2, fine2
			sb $t3, ($a2)
			
			addi $a2, $a2, 1
			addi $a1, $a1, 1
			addi $t4, $t4, 1
			j ciclo
fine2:
			sub $a1, $a1, $t4
			li $t4, 0
			
			addi $a0, $a0, 1
			lb $t1, ($a0)
			j ciclo2
agg:
			sb $t1, ($a2)
			addi $a2, $a2, 1 #CORRETTO AGG 1
			addi $a0, $a0, 1 #CORRETTO AGG 1
			lb $t1, ($a0)
			j ciclo2
fine:
			jr $ra