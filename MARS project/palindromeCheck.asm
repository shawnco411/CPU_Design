.data
data:.space 20
Nline:.asciiz "\n"
.text
li $v0,5
syscall
move $s0,$v0 #vo contains character num
li $t0,2
divu $s0,$t0
mflo $s1  
addi $s1,$s1,-1 #s1 is start num's offset(oneword->one byte)
mfhi $s2 #if s2=1->s0 is odd; if s2=0->s0 is even
li $t0,1 #set initial incresement to be 1(even)
beq $s2,$0,save_start
li $t0,2  #if odd,increse 2

save_start:
li $t1,0 #t1 is counter
save:
li $v0,12
syscall
sb $v0,data($t1)
addi $t1,$t1,1
bne $t1,$s0,save
 
li $t3,0 #used as result
check:
lb $t1,data($s1)
add $t2,$s1,$t0	#t2 is reverse num's offset
lb $t2,data($t2)
addi $t0,$t0,2  #change num incresement
addi $s1,$s1,-1 #turn to left num
bne $t1,$t2,result
bgez $s1,check #all num is checked ok
li $t3,1

result:
li $v0,4
la $a0,Nline
syscall
li $v0,1
move $a0,$t3
syscall




