			.data
ora_in: 	.byte 9, 49
ora_out: 	.byte 14, 21
X: 			.byte 1
Y: 			.byte 40
			.text
			.globl main
main: 
			la $a0, ora_in # indirizzo di ora_in
			la $a1, ora_out # indirizzo di ora_out
			lbu $a2, X
			lbu $a3, Y
			jal costoParcheggio
			move $a0, $v0
			
			li $v0, 1
			syscall
			
			
			li $v0, 10
			syscall
			
costoParcheggio:
			move $t6, $a2 #prezzo per ora
			li $t0, 0	  #prezzo totale
			li $t2, 60	
			
			lb $t3, ($a0) #ora iniziale di ingresso
			lb $t1, 1($a0) #minuti iniziali di ingresso
			
			lb $t4, ($a1) #ora iniziale di uscita
			lb $t5, 1($a1) #minuti iniziali di uscita
			
CtrlOre:	 
			beq $t3, $t4, CtrlMin
			bgt $t3, $t4, Fine #controllo ore
			
agg:				
			add $t1, $t1, $a3
			blt $t1, $t2, noCambOra
			addi $t3, $t3, 1
			sub $t1, $t1, $t2
				
noCambOra:	
			
			add $t0, $t0, $t6
			j CtrlOre


CtrlMin:							
			blt $t1, $t5, agg
Fine:
			move $v0, $t0
			
			jr $ra
				
				
				
				
				 