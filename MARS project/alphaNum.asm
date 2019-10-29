.data
alpha:.space 20
num:.word 0:20
space:.asciiz " "
Nline: .asciiz "\n"
.text
li $t2,0 #t2 is next alpha saved offset
li $s3,1 #constant 1
li $v0,5
syscall
move $s0,$v0 #s0 id num to read
li $t0,0 #t0 is read counter
read:
li $v0,12
syscall
move $s1,$v0 #s1 is alpha readed
addi $t0,$t0,1
beq $t0,$s3,save #first time,just save


check:
li $t1,0 #t1 is search offset
check_again:
lb $s2,alpha($t1) #s2 is alpha to compare
beq $s1,$s2,add1
addi $t1,$t1,1
bne $t1,$t2,check_again #else save it

save:
sll $t3,$t2,2 
sb $s1,alpha($t2)
sw $s3,num($t3)
addi $t2,$t2,1
beq $t0,$s0,print
j read

add1:
sll $t4,$t1,2 #mult 4
lw $t5,num($t4)
addi $t5,$t5,1
sw $t5,num($t4)
beq $t0,$s0,print
j read

print:
li $t0,0 #(start offset)
print_again:
li $v0,11
lb $a0,alpha($t0)
syscall #print character

li $v0,4
la $a0,space
syscall

sll $t1,$t0,2 #num offset
li $v0,1
lw $a0,num($t1)
syscall

li $v0,4
la $a0,Nline
syscall

addi $t0,$t0,1
bne $t0,$t2,print_again


end:
li $v0,10
syscall
