	.text
#test ori
ori $a0,$0,456
ori $a1,$a0,788
#test lui
lui $a2,455
lui $a3,0xffff #sign
ori $a3,$a3,0xffff #set $a3 to -1
#twst addu
addu $s0,$a0,$0
addu $s1,$a0,$a1
addu $s2,$0,$0
#twst subu
subu $s3,$0,$0
subu $s4,$0,$a0
subu $s5,$a0,$0
subu $s6,$a1,$a0
#test sw
ori $t0,0x0000
sw $a0,0($t0)
sw $a1,4($t0)
sw $a2,8($t0)
sw $a3,12($t0)
sw $s4,16($t0)
sw $s5,20($t0)
#test lw
lw $a1,0($t0)
lw $a0,4($t0)
lw $a3,8($t0)
lw $a2,12($t0)
lw $s5,16($t0)
lw $s4,20($t0)
#test beq
ori $a0,$0,1
ori $a1,$0,2
ori $a2,$0,1
jal add1
beq $a0,$a1,loop1
beq $a0,$a2,loop2
loop1:
sw $a0,24($t0)
add1:
	ori  $t0,1234
jr $31
loop2:
sw $a1,28($t1)
