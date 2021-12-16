#
# q5.asm
#
# Cory Harrah
# 12/14/21
#
# Take 3 digits through MM I/O. Make the decimal value for the 3 digit input
#

	.data
num:	.word 3
x:	.word 100

        .text
        .globl  main

main:
	lw 	$t9, num  		# three character
	lw	$t8, x
	ori	$s1, $zero, 0		# Load 12 into $t2

	lui 	$t0, 0xffff 		# lui : load upper immediate

rdy_wait:
	lw	$t1, 0($t0)
	andi 	$t1, $t1, 0x0001 	# test the Receiver control register 				     # has 1 in LSB # ready?
	beq	$t1, $zero, rdy_wait 	# if LSB is 0, branch rdy_wait
	lw	$s0, 4($t0)		# if LSB is 1, read a character from IO

	sub 	$s0, $s0, 48 		# subtract ASCII code for '0' ; '3' - 			      	      # '0' = 3

	sub 	$t9, $t9, 1
	beq 	$t9, $zero, readall
	mul	$s0, $s0, $t8
	nop
	add	$s1, $s0, $s1
	div	$t8, $t8, 10
	nop

	b 	rdy_wait		# branch back to rdy_wait


readall:
	add 	$a0, $s1, $s0
	li 	$v0, 1
	syscall 
	li 	$v0, 10
	syscall
