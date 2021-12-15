#
# q5.asm
#
# Cory Harrah
# 12/14/21
#
# Take 3 digits through MM I/O. Make the decimal value for the 3 digit input
#

        .data
num     .word 3

        .text
        .globl main

main:
        lw      $t9, num                # Load num into $t9 which ='s 3
        lui     $t0, 0xffff             # Load upper immediate

rdy_wait:
        lw	$t1, 0($t0)
	andi    $t1, $t1, 0x0001 	# test RC register has 1 in LSB
	beq	$t1, $zero, rd_wait     # if LSB is 0, branch rd_wait
	lw	$s0, 4($t0)             # if LSB is 1, read a character from I/O device