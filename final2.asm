#
# Cory Harrah
# 12/16/21
#
# Make the interrupt handler(kernal text program) that can quit when q is pressed
#
		    .kdata     		#   kernel data     
s1:     	.word 10     
s2:     	.word 11    
new_line: 	.asciiz "\n"     
		

		    .text     
		    .globl     main     
main:     
		    mfc0 	$a0, $12	    # read from the status register     
		    ori     $a0,   0xff11   # enable all interrupts     
		    mtc0 	$a0, $12        # write back to status register     
		    lui     $t0, 0xFFFF     # $t0 =   0xFFFF0000     
		    ori     $a0, $0, 2      # enable keyboard interrupt     
		    sw     	$a0, 0($t0)     # write back to 0xFFFF0000

here:   	j here     		        # stay here forever     
		
exit:
		    li 	$v0, 10     	# exit, if it ever comes here     
		    syscall 