.data
example100:.word 0:400
.text
li $t0,0 #used as counter
li $t2,0 #used as offset
li $s0,100 # total num to add
li $s1,0 #used as result
add100:
lw $t1,example100($t2)
add $s1,$s1,$t1
addi $t0,$t0,1
addi $t2,$t2,4
bne $t0,$s0,add100
save:
sw $s1,example100($t2)
li $v0,10
syscall