#
# q5.asm
#
# Cory Harrah
# 12/14/21
#
# Take 3 digits through MM I/O. Make the decimal value for the 3 digit input
#

        .data
num:     .word 3

        .text
        .globl main

main:
        lw      $t9, num                # Load num into $t9 which ='s 3
        lui     $t0, 0xffff             # Load upper immediate

rdy_wait:
        lw	$t1, 0($t0)
	andi    $t1, $t1, 0x0001 	# test RC register has 1 in LSB
	beq	$t1, $zero, rdy_wait    # if LSB is 0, branch rd_wait
	lw	$s0, 4($t0)             # if LSB is 1, read a character from I/O device

	sub 	$s0, $s0, 48 		# subtract ASCII code for '0'
	sub 	$t9, $t9, 1             # Subtract 1 from count of 3 characters
	beq 	$t9, $zero, readall     
	mul 	$s1, $s0, 10 		# $s1 is the last digit entered
	nop
	add	$s1, $s0, $s1		# Add the first and second characters
	b 	rdy_wait

        sub 	$t9, $t9, 1
	beq 	$t9, $zero, readall
	b 	rd_wait