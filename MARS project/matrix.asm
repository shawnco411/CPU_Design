.data
	matrix:.space 10000
	space:.asciiz " "
	Nline:.asciiz "\n"
.text
	la $s0,matrix #set $s0 to start address
	li $v0,5
	syscall
	move $s1,$v0	#set $s1 to row num 
	
	li $v0,5
	syscall
	move $s2,$v0	#set $s2 to column num
	
	multu $s1,$s2
	mflo $s3 	#set $s3 to total num
	li $t0,0	#set $t0 to i

	for_1_begin:
		slt $t1,$t0,$s3
		beq $t1,$zero,for_1_end
		nop
		sll $t2,$t0,2 # 4*curr num==address increasement num
		addu $t2,$s0,$t2 #set $t2 to curr address
		li $v0,5
		syscall
		sw $v0,0($t2)	#save new word
		addi $t0,$t0,1 #i++
		j for_1_begin
		nop
	for_1_end:
	addi $t2,$t2,4
	print:
		addi $t0,$t0,-1	
		addi $t2,$t2,-4 #get previous address
		slt $t1,$t0,$0
		bne $t1,$0,print_end #if all word is checked
		nop
		lw $t3,0($t2)	#set $t3 to word to check
		beq $t3,$zero,print
		nop
		
		divu $t0,$s2
		mflo $t4  #set $t1 to curr row num
		mfhi $t5
		addi $t4,$t4,1
		addi $t5,$t5,1
		
		move $a0,$t4
		li $v0,1
		syscall	 #print row num
		
		li $v0,4
		la $a0,space
		syscall
		
		move $a0,$t5  #set $t4 to curr column num
		li $v0,1
		syscall	#print column num 
		
		li $v0,4
		la $a0,space
		syscall		#space
		
		li $v0,1
		move $a0,$t3
		syscall	#print num
		
		li $v0,4
		la $a0,Nline
		syscall	#new line
		j print
		nop
	print_end:
	li $v0, 10
	syscall