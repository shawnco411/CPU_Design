.data
temp:.word 0:64
result: .word 0:64
space:.asciiz " "
Nline:.asciiz "\n"
.text
li $v0,5
syscall
move $s0,$v0 #s0 is n
li $v0,5
syscall
move $s1,$v0 #$s1 is m
mult $s1,$s1
mflo $s2 #total num

li $t0,0 #used as counter
read:
sll $t1,$t0,2 #get real offset
li $v0,5
syscall
sw $v0,temp($t1)
addi $t0,$t0,1
bne $t0,$s2,read

bne $s0,$0,getSquare
jal move2r
j print

getSquare:
li $s3,0 #curr row num
li $s4,0 #vurr column num
initial:
li $t0,0 #oneresult counter
li $s5,0 #base result
mult $s3,$s1
mflo $t1 #first num1
move $t2,$s4 #first num2
one_result:
sll $t3,$t1,2
sll $t4,$t2,2 #fet real offset
lw $t3,temp($t3)
lw $t4,temp($t4)
mult $t3,$t4
mflo $t3
add $s5,$s5,$t3 #add base
addi $t1,$t1,1
add $t2,$t2,$s1
addi $t0,$t0,1
bne $t0,$s1,one_result #one result not finished,continue
mult $s3,$s1
mflo $t0
add $t0,$t0,$s4
sll $t0,$t0,2 #get real addr to store
sw $s5,result($t0)
addi $s4,$s4,1
bne $s4,$s1,initial #curr result row,not finished,excute again
addi $s3,$s3,1
move $s4,$0
bne $s3,$s1,initial #total num not finished

li $t0,1
beq $s0,$t0,print

li $t5,1 #mult counter
realMult:
jal move2t
li $s3,0 #curr row num
li $s4,0 #vurr column num
initial1:
li $t0,0 #oneresult counter
li $s5,0 #base result
mult $s3,$s1
mflo $t1 #first num1
move $t2,$s4 #first num2
one_result1:
sll $t3,$t1,2
sll $t4,$t2,2 #fet real offset
lw $t3,temp($t3)
lw $t4,temp($t4)
mult $t3,$t4
mflo $t3
add $s5,$s5,$t3 #add base
addi $t1,$t1,1
add $t2,$t2,$s1
addi $t0,$t0,1
bne $t0,$s1,one_result1 #one result not finished,continue
mult $s3,$s1
mflo $t0
add $t0,$t0,$s4
sll $t0,$t0,2
sw $s5,result($t0)
addi $s4,$s4,1
bne $s4,$s1,initial1 #curr result row,not finished,excute again
addi $s3,$s3,1
move $s4,$0
bne $s3,$s1,initial1 #total num not finished
addi $t5,$t5,1 #multed once
bne $t5,$s0,realMult

print:
li $t0,0 #print counter
li $t1,0 #row counter
startP:
sll $t2,$t0,2 #real offset
li $v0,1
lw $a0,result($t2)
syscall
li $v0,4
la $a0,space
syscall
addi $t0,$t0,1 #one num printed
addi $t1,$t1,1 #row counter++
beq $t0,$s2,end #all num printed,end
bne $t1,$s1,startP #one row not finished
li $v0,4
la $a0,Nline
syscall
move $t1,$0
j startP


end:
li $v0,10
syscall

move2t:
li $t7,0 #used as counter (t789 used)
move2t_start:
sll $t9,$t7,2 #real offset
lw $t8,result($t9)
sw $t8,temp($t9)
addi $t7,$t7,1
bne $t7,$s2,move2t_start
jr $ra
 

move2r:
li $t7,0 #used as counter
move2r_start:
sll $t9,$t7,2 #real offset
lw $t8,temp($t9)
sw $t8,result($t9)
addi $t7,$t7,1
bne $t7,$s2,move2r_start
jr $ra