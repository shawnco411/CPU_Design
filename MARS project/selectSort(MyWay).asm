.data
array:.word 0:100
space:.asciiz " "
.text
li $v0,5
syscall
move $s5,$v0 #num of num
li $t0,0 #counter
save:
sll $t1,$t0,2 #offset
li $v0,5
syscall
sw $v0,array($t1)
addi $t0,$t0,1
bne $t0,$s5,save
subi $s1,$s5,1 #last check base
li $t0,0 #t0 checkbase counter
sort:
addi $t1,$t0,1 #check begin
sll $t2,$t0,2
move $s0,$t2 #min offset
lw $s4,array($t2)#value of check base
move $t3,$t1 #check variable
onestep:
sll $t4,$t3,2 #dynamic offset
lw $s2,array($s0) #value of min
lw $s3,array($t4) #value of dynamic
slt $t5,$s3,$s2 #if dynamic<base,t3 is 1,need change
beq $t5,$0,stil
move $s0,$t4
lw $s2,array($s0) #value of min(refresh)
stil:
addi $t3,$t3,1
bne $t3,$s5,onestep 
beq $s0,$t2,Nswap
sw $s4,array($s0)
sw $s2,array($t2)
Nswap:                
addi $t0,$t0,1
bne $t0,$s1,sort

li $t0,0 #counter 
print:
sll $t1,$t0,2
li $v0,1
lw $a0,array($t1)
syscall
li $v0,4
la $a0,space
syscall
addi $t0,$t0,1
bne $t0,$s5,print
