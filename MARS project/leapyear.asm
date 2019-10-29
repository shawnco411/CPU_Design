.data
n:.word
.text
	la $t0,n
	lw $a0,0($t0)
	li $v0,5
	syscall

	move $t0,$v0
	li $t1,4
	li $t2,400
	divu $t0,$t2
	mfhi $t3
	beq $t3,$zero,yes
	li $t2,100
	divu $t0,$t1
	mfhi $t3
	bgtz $t3,not
	nop
	divu $t0,$t2
	mfhi $t3
	beq $t3,$zero,not
yes:
	li $a0,1
	li $v0,1
	syscall
	j end
not:
	li $a0,0
	li $v0,1
	syscall
	j end
end:	
	