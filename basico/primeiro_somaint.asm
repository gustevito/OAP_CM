.macro fim
	li $v0, 10
	syscall
.end_macro

.macro insereInt(%inteiro)
	li $v0, 5
	syscall
	move %inteiro, $v0
.end_macro

.text
	.globl main		
main:
	insereInt($t0)
	insereInt($t1)
	
	add $t2, $t0, $t1
	
	li $v0, 1
	move $a0, $t2
	syscall
	fim
	
	
