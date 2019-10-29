.data
array1: .word 0:64
array2: .word 0:64
space: .asciiz " "
Nline:.asciiz "\n"
.text
	li $v0,5
	syscall
	move $s0,$v0 #s0 equals column and row num
	mult $s0,$s0
	mflo $s4 #$s4 stores one matrix's num of element
	li $s1,0 #stores curr row num
	li $s2,0 #stores curr column num
      
      la $t1,array1 #t1 stores array1;s addr
      la $t2,array2 #t2 stores array2;s addr
save:  mult $s1,$s0
       mflo $s3		#s3 stores ((curr row)-1)*total row num
       add $s3,$s3,$s2
       sll $s3,$s3,2 #mult 4
       add $s3,$s3,$t1 #get real addr of array1 num
       	 li $v0,5
       	 syscall
         move $t0,$v0 #read a integer
       sw $t0,($s3)
       addi $s2,$s2,1
       bne $s2,$s0,save  #if curr row not finished,continue
       addi $s1,$s1,1
       li $s2,0
       bne $s1,$s0,save	#if first matrix not finished,continue
       beq $t1,$t2,end #if two array is saved,end
       move $t1,$t2
       li $s1,0
       li $s2,0
       j save
end:       
     li $s1,0 s curr row num
     li $s2,0 #used as array1's curr column num
     li $t0,0 #used as addr of first mult element
     li $t1,0 #used as addr of second mult element
     li $s5,0 #s5 stores base result

offset_initial:
     li $t4,0 #used as counter
     mult $s1,$s0
     mflo $t0
     sll $t0,$t0,2	#get initial offset of num1
      move $t1,$s2
     sll $t1,$t1,2     #get initial offset of num2 
mult_begin:
     lw $t2,array1($t0)	#t2 stores first num and mult result
     lw $t3,array2($t1) #t3 stores second num and s0 mult 4
     mult $t2,$t3
     mflo $t2		#t2 stores curr mult result
     add $s5,$s5,$t2
     addi $t4,$t4,1		#counter++
     addi $t0,$t0,4		#turn to next num1
     sll $t3,$s0,2
     add $t1,$t1,$t3		#turn to next num2	
     bne $t4,$s0,mult_begin #if one result not computed,continue
     li $v0,1
     move $a0,$s5
     li $s5,0
     syscall  #print one result
     li $v0,4
     la $a0,space
     syscall
     addi $s2,$s2,1 #turn to next num
     bne $s2,$s0,offset_initial #curr row nit finished
     li $v0,4
     la $a0,Nline 
     syscall #print /n
     li $s2,0
     addi $s1,$s1,1
     bne $s1,$s0,offset_initial
     
     li $v0,10
     syscall
            
  
       	

