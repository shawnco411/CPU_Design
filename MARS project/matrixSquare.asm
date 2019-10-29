.data
temp:.word 0:64
result:.word 0:64
space:.asciiz " "
Nline: .asciiz "\n"
.text
li $v0,5
syscall
move $s0,$v0 #get n


li $v0,5
syscall
move $s1,$v0 #get m

mult $s1,$s1
mflo $s7 #totalnum

move $t0,$s1 #total row num
move $t1,$s1 #total column num
move $s2,$0 #curr row num
move $s3,$0 #curr column num
store:
mult $s2,$t1
mflo $s4
add $s4,$s4,$s3
sll $s4,$s4,2 #get real offset
li $v0,5
syscall
sw $v0,temp($s4)
addi $s3,$s3,1
bne $s3,$t1,store #curr row not finished,continue
addi $s2,$s2,1
move $s3,$0
bne $s2,$t0,store #not all num stored,continue

bne $s0,$0,getSquare
jal move2r 
j print #is zero,just print it

getSquare:
move $s2,$0 #curr row num
move $s3,$0 #curr column num
initial:
li $t6,0 #counter
li $s5,0 #base result
mult $s2,$t1
mflo $t2 #first num1's offset
move $t3,$s3 #first num2's offset
oneResult: #每个result由行数列数（外围）初始化
sll $t7,$t2,2
sll $t8,$t3,2
lw $t4,temp($t7)
lw $t5,temp($t8)
mult $t4,$t5
mflo $t4
add $s5,$s5,$t4
addi $t2,$t2,1 #next num1
add $t3,$t3,$t1 #next num2
addi $t6,$t6,1 #counter++
bne $t6,$t1,oneResult

mult $s2,$t1
mflo $s4
add $s4,$s4,$s3
sll $s4,$s4,2
sw $s5,result($s4)
addi $s3,$s3,1 #column++
bne $s3,$t1,initial #curr row not finished,continue
move $s3,$0
addi $s2,$s2,1
bne $s2,$t0,initial

li $t2,1
bne $s0,$t2,excute
j print #is 1,just pint square

excute:
li $t7,1 #t7 used as n counter
realMult:
jal move2t
move $s2,$0 #curr row num
move $s3,$0 #curr column num
initial2:
li $t6,0 #counter
li $s5,0 #base result
mult $s2,$t1
mflo $t2 #first num1's offset
move $t3,$s3 #first num2's offset
oneResult2: #每个result由行数列数（外围）初始外
sll $s4,$t2,2
sll $s6,$t3,2
lw $t4,temp($s4)
lw $t5,temp($s6)
mult $t4,$t5
mflo $t4
add $s5,$s5,$t4
addi $t2,$t2,1 #next num1
add $t3,$t3,$t1 #next num2
addi $t6,$t6,1 #counter++
bne $t6,$t1,oneResult2

mult $s2,$t1
mflo $s4
add $s4,$s4,$s3
sll $s4,$s4,2
sw $s5,result($s4)
addi $s3,$s3,1 #column++
bne $s3,$t1,initial2 #curr row not finished,continue
move $s3,$0
addi $s2,$s2,1
bne $s2,$t0,initial2 #caculate completed once
addi $t7,$t7,1
bne $t7,$s0,realMult


print:
move $s2,$0 #curr row num
move $s3,$0 #curr column num
li $t6,0 #counter
start:
mult $s2,$t1
mflo $s4
add $s4,$s4,$s3
sll $s4,$s4,2
li $v0,1
lw $a0,result($s4)
syscall
li $v0,4
la $a0,space
syscall
addi $s3,$s3,1
bne $s3,$t0,start #one row not finished,continue

li $v0,4
la $a0,Nline
syscall #newline

addi $s2,$s2,1
move $s3,$0
bne $s2,$t0,start
end:
li $v0,10
syscall

move2t:
li $t2,0
start_move2t:
sll $t3,$t2,2 #get real offset
lw $t4,result($t3)
sw $t4,temp($t3)
addi $t2,$t2,1
bne $t2,$s7,start_move2t
jr $ra #back

move2r:
li $t2,0
start_move2r:
sll $t3,$t2,2 #get real offset
lw $t4,temp($t3)
sw $t4,result($t3)
addi $t2,$t2,1
bne $t2,$s7,start_move2r
jr $ra #back




