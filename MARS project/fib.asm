.data
.text
initial:
li $t0,1 #used as first and second element
sw $t0,0($a1)
sw $t0,4($a1)
subi $a0,$a0,2 #num-2
save:
lw $t0,0($a1)
lw $t1,4($a1)
add $t0,$t0,$t1
sw $t0,8($a1)
subi $a0,$a0,1
addi $a1,$a1,4
bgtz $a0,save
jr $ra 