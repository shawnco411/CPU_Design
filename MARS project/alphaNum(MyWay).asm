.data
alpha:.space 20
num:.word 0:20
space:.asciiz " "
Nline:.asciiz "\n"
.text
li $s3,1 #constant 1
li $t3,0 #save offset
li $v0,5
syscall
move $s0,$v0 #num to read
li $t0,0 #read counter
read:
li $v0,12
syscall
move $s1,$v0 #s1 is num readed
addi $t0,$t0,1
beq $t0,$s3,save #first time,just save
li $t1,0 #check offset
check:
lb $s2,alpha($t1)
beq $s1,$s2,add1
addi $t1,$t1,1
bne $t1,$t3,check
save:
sll $t4,$t3,2
sb $s1,alpha($t3)
sw $s3,num($t4)
addi $t3,$t3,1
bne $t0,$s0,read #read again
j print
add1:
sll $t2,$t1,2
lw $t4,num($t2)
addi $t4,$t4,1
sw $t4,num($t2)
bne $t0,$s0,read
j print
print:
li $t0,0 #begin offset
startP:
sll $t1,$t0,2
li $v0,11
lb $a0,alpha($t0)
syscall
li $v0,4
la $a0,space
syscall
li $v0,1
lw $a0,num($t1)
syscall
li $v0,4
la $a0,Nline
syscall
addi $t0,$t0,1
bne $t0,$t3,startP