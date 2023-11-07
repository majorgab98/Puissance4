#Appels De Systeme
	.eqv PrintInt,1
	.eqv PrintString,4
	.eqv ReadInt,5
	.eqv Exit,10
	.eqv PrintChar,11
	.eqv ReadString,8
	.eqv ReadChar,12
 
.data
tableau:
  .byte ':', '.', '.', '.', '.', '.', '.', ':','\n'
  .eqv matN,6
  .eqv matM,6

joueur_messageX: .string "Le joueur X doit jouer."
joueur_messageO: .string "Le joueur O doit jouer."
erreur: .string "Erreur d'entrée"
X_gagne: .string "Le joueur X gagne"
O_gagne: .string "Le joueur O gagne"
X_perd: .string "Le joueur X perd"
O_perd: .string "Le joueur O perd"
joueurX: .byte 'X'
joueurO: .byte 'O'

.text
	la s0, tableau
	li s2, 0

main:

	li a0, 1 
	li s2, 0
loopj:
	li t0, matM
	bge s2, t0, fin

	li a7, PrintChar
	li a0, ':'
	ecall

	li s1, 0
	j loopi
loopi:
	li t0, matN
	bge s1, t0, affichage

	li t0, matM
	mul s3, s1, t0
	add s3, s3, s2
	slli s3, s3, 0
	add s3, s3, s0

	li t1, '.'
	sb t1, 0(s3)

	lb a0, 0(s3)
	li a7, PrintChar
	ecall

	addi s1, s1, 1
	j loopi
affichage:
	li a7, PrintChar
	li a0, ':'
	ecall

	li a7, PrintChar
	li a0, '\n'
	ecall

	addi s2, s2, 1
	j loopj

fin:
	li a7, Exit
	ecall
