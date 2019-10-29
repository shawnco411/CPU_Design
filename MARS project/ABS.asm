    .text
    .globl main
main:
    li $a0,1938
    jal ABS
    li $v0,1
    syscall		#output reult1
    li $a0,-9339
    jal ABS
    li $v0,1
    syscall		#output result2
li $v0,10
syscall
##########################################
ABS:
    bgez $a0,back #if >=0 then keep
    sub $a0,$0,$a0
    back:
    jr $ra
