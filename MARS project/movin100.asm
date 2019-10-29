.data
SRC:.word 0:200
DEST:.word 0:200
.text
li $t0,0 #count
li $s0,100
li $t1,0 #offset
movin:
lw $t2,SRC($t1)
sw $t2,DEST($t1)
addi $t1,$t1,4
addi $t0,$t0,1
bne $t0,$s0,movin
li $v0,10
syscall
