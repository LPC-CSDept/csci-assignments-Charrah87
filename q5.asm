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
        lw  $t9, num        # Load num into $t9 which ='s 3
        lui $t0, 0xffff     # Load upper immediate

rdy_wait:
        lw  