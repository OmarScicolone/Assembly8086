		.data
var1:   .byte 'm'
var2:   .byte 'i'
var3:   .byte 'p'
var4:   .byte 's'
var5:   .byte 0    #terminatore di stringa
		
		.text
		.globl main
		.ent main

main:	     #minuscolo/maiuscolo differiscono per 32

		la $t0, var1		#caricato l'indirizzo di var1 in t0
		lb $t1, ($t0)       #caricato il contenuto di quello che c'è all'indirizzo contenuto nel registro t0 in t1
							#fondamentalmente passaggio in piu
							
		sub $t1, $t1, 32    #sottrazione: se non sappiamo il valore 32
							#possiamo ricavarci il valore da A-a
		
		la $t0, var2
		lb $t2, ($t0)		#I
		sub $t2, $t2, 32
		
		
		la $t0, var3
		lb $t3, ($t0)		#P
		sub $t3, $t3, 32
		
		la $t0, var4
		lb $t4, ($t0)		#S
		sub $t4, $t4, 32
		
		sb $t1, var1 		#STORE(memorizzazione) di quello che c'è in di t1 in var1
		sb $t2, var2		#I
		sb $t3, var3		#P
		sb $t4, var4		#S
		
		li $v0, 4       #con 11(stampa carattere) anzichè 4 (stampa stringa)
		la $a0, var1    #e lb (load byte) anziche la (load address)
		syscall		    #avrebbe stampato solo M anzichè MIPS
								
		
		
		li $v0, 10
		syscall
		.end main