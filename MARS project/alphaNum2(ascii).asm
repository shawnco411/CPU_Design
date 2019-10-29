.data
array:.word 0:64
space:.asciiz " "
Nline:.asciiz "/n"
.text
li $s2,97 #ascii num of "a"
li $s3,26 #num of alpha

li $v0,5
syscall
move $s0,$v0 #num to read

li $t0,0
read:
li $v0,12
syscall
move $s1,$v0 #s1 contains curr alpha
subi $t1,$s1,$s2
lw $s2,array($t1)
addi $s2,$s2,1
sw $s2,array($t1)
addi $t0,$t0,1
bne $t0,$s0,read
li $t0,0

find:
lw $t1,array($t0)
bne $t1,$0,print
check:
addi $t0,$t0,1
bne $t0,$s3,find
j end

print:
li $v0,11
subi $a0,$t0,$s2
syscall

li $v0,4
la $a0,space
syscall

li $v0,1
move $a0,$t1
syscall

li $v0,4
la $a0,Nline
syscall
j check

end:
li $v0,10
syscall