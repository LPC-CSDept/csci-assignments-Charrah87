#
# final1.asm
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
	andi 	$t1, $t1, 0x0001 	# test the Receiver control register 				     
	beq	$t1, $zero, rdy_wait 	# if LSB is 0, branch rdy_wait
	lw	$s0, 4($t0)		# if LSB is 1, read a character from IO

	sub 	$s0, $s0, 48 		# subtract ASCII code for '0'			      	      

	sub 	$t9, $t9, 1		# subtract 1 from counter
	beq 	$t9, $zero, readall	# Branch to final add+print when =0
	mul	$s0, $s0, $t8		# Multiply by $t8
	nop
	add	$s1, $s0, $s1		# Add $s1 and $s0 together
	div	$t8, $t8, 10		# Divide > 100 > 10 > 1
	nop

	b 	rdy_wait		# branch back to rdy_wait


readall:
	add 	$a0, $s1, $s0		# Add the final digit and previous sum
	li 	$v0, 1			# Print values
	syscall 
	li 	$v0, 10			# Exit program
	syscall
