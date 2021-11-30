#
# QuizPart2.asm
#
# Cory harrah
# 11/29/21
# Part 2 quiz
# Calculate Polynomial Expression: ax2 + bx + c


	.data
prompt:	.asciiz	"Enter a value for x:"		# prompt
prompt2:	.asciiz	"Enter a value for a:"	# prompt
prompt3:	.asciiz	"Enter a value for b:"	# prompt
prompt4:	.asciiz	"Enter a value for c:"	# prompt

valA:	.float	1.0
valB:	.float 	1.0
valC:	.float 	1.0

	.text
	.globl	main
main:	
	la	$a0, prompt	# prompt for 
	li	$v0, 4
	syscall
	
	li	$v0, 6 		# read single precision
	syscall   		# $f0 <= x

	la	$a0, prompt2	# prompt for A
	li	$v0, 4
	syscall
	
	li	$v0, 6 		# read single precision
	syscall   		

	s.s	$f0, valA	# store value A

	la	$a0, prompt3	# prompt for  B
	li	$v0, 4
	syscall
	
	li	$v0, 6 		# read single precision
	syscall   		

	s.s	$f0, valB	# store value B

	la	$a0, prompt4	# prompt for C
	li	$v0, 4
	syscall
	
	li	$v0, 6 		# read single precision
	syscall   		

	s.s	$f0, valC	# store value C


	# sum = ax^2 + bx + c
  
	l.s 	$f1, valA
	l.s 	$f2, valB
	l.s 	$f3, valC

	# $f4 = ax^2
	# $f4 = $f4 + bx
	# $f4 = $f4 + c 


	mul.s 	$f4, $f0, $f0 	# $f4 = x^2
	mul.s 	$f4, $f4, $f1 	# $f4 = ax^2
	mul.s 	$f2, $f2, $f0 	# $f2 = bx
  	add.s 	$f4, $f2, $f4   # $f4 = ax^2 + bx
  	add.s 	$f4, $f4, $f3   # $f4 = ax^2 + bx + c
  
  	mov.s $f12,$f4
  	
  	li $v0, 2		# Print floating point value
  	syscall

  
  	li $v0, 10 		# End program
  	syscall 
