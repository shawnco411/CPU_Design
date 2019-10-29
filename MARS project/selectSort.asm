.data
array: .word 0:100
space: .asciiz " "
.text
     li $v0,5
     syscall
     move $s0,$v0 #s0 stores array num
     li $t0,0 #t0 used as offset
     li $t1,0 #t1 used as counter
save:li $v0,5
     syscall
     sw $v0,array($t0)
     addi $t0,$t0,4
     addi $t1,$t1,1
     bne $t1,$s0,save #if not all num stored,continue

move $s1,$t0 #set s1 to last num's offset+4
addi $s2,$s1,-4 #set s2 to last checkbase num's offset+4
li $t0,0 #set t0 now checkbase num's offset
li $t2,0  #used as compare result(<?)
sort:addi $t1,$t0,4 #t1 stores check begin num's offset
     move $s0,$t0 #set s0 to min num's offset,assume checkbase is min first
     lw $s4,array($t0) #get check base's value
     move $t3,$t1 #t3 used as check dynamic variable
onestep:
     lw $s3,array($s0) #s3 stores now min num's value,refresh 
     lw $t4,array($t3)	#t4 stores dynamic check num's value
     slt $t2,$t4,$s3 #t5=1 if begin num<first num
     beq $t2,$0,stil  #if not <,turn to still
     move $s0,$t3
     lw $s3,array($s0)
stil:addi $t3,$t3,4
     bne $t3,$s1,onestep #if one step not finished,continue
     beq $s0,$t0,Nswap 	#if min is check base,no need to swap
     sw $s3,array($t0) #move min to checkbase
     sw $s4,array($s0) #move checkbase to min num's addr
Nswap:
     addi $t0,$t0,4
     bne $t0,$s2,sort #if not all base num checked,continue
     
     li $t0,0 #used as offset variable
print:
	lw $a0,array($t0)	#a0 stores num to print
	li $v0,1
	syscall	#print num
	li $v0,4
	la $a0,space
	syscall
	addi $t0,$t0,4
	bne $t0,$s1,print
li $v0,10
syscall
	   
       
