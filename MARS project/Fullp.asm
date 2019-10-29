.data
array :.word 0:7
symbol:.word 0:7
Nline:.asciiz "\n"
space:.asciiz " "
.text
li $s4,0 #use s4 as i
li $v0,5
syscall
move $s0,$v0 #set $s0 to n
li $a1,0 #set a1 to index
li $t1,4
mult $s0,$t1
mflo $t1
move $s3,$t1 #last offset+4
move $s2,$t1
subi $s2,$s2,4 #last offset
Fullp:
li $s4,0
slt $t0,$a1,$s0
bne $t0,$0,Work  #if index<n,turn to work,not print 
li $t0,0 #used as offset to load num to print
Print:
li $v0,1
lw $a0,array($t0)
syscall
li $v0,4
la $a0,space
syscall
addi $t0,$t0,4
bne $t0,$s3,Print 
li $v0,4
la $a0,Nline
syscall
j Back

Work:
slt $t2,$s4,$s0 #if i<n,t2 is 1
bne $a1,0,unfinished #if index!=0 unfinished
beq $t2,$0,end	#if index=0&&i>n
unfinished:
beq $t2,$0,Back #if i>=n,back to former
li $t2,4t
mult $s4,$t2
mflo $t5 #use t5 as i's offset
li $t4,4
mult $t4,$a1
mflo $t4 #set t4 to be index's offset
lw $t3,symbol($t5) 
bne $t3,$0,Notzero
addi $t3,$s4,1
sw $t3,array($t4)
li $t3,1
sw $t3,symbol($t5) #set used
#move $s1,$sp #save stack top to s1
SaveStack:
sw $s4,0($sp)	#save i
subi $sp,$sp,4
sw $a1,0($sp)	#save index
subi $sp,$sp,4
move $t3,$s2 #use t3 as last offset(save from last)
saveArray:
lw $t4,array($t3)
sw $t4,0($sp) 
subi $t3,$t3,4
subi $sp,$sp,4
bgez $t3,saveArray
move $t3,$s2 #last offset
saveSymbol:
lw $t4,symbol($t3)
sw $t4,0($sp)
subi $t3,$t3,4
subi $sp,$sp,4
bgez $t3,saveSymbol
addi $a1,$a1,1 #index+1
j Fullp #checkfull
Back:
#beq $a1,$0,end
li $t3,0 #first offset
addi $sp,$sp,4
loadSymbol:
lw $t4,0($sp)
sw $t4,symbol($t3)
addi $sp,$sp,4
addi $t3,$t3,4
bne $t3,$s3,loadSymbol
li $t3,0
loadArray:
lw $t4,0($sp)
sw $t4,array($t3)
addi $sp,$sp,4
addi $t3,$t3,4
bne $t3,$s3,loadArray
lw $a1,0($sp) #load index
addi $sp,$sp,4
lw $s4,0($sp) #load i
li $t2,4
mult $s4,$t2
mflo $t5 #use t5 as i's offset
sw $0,symbol($t5)
Notzero:
addi $s4,$s4,1 #i++
j Work
end:
li $v0,10
syscall
     

