.text
#test ori
ori $a0,$0,456
ori $a1,$a0,788
#test lui
lui $a2,455
lui $a3,0xffff #sign
ori $a3,$a3,0xffff #set $a3 to -1
#test sw
ori $t0,0x0000
sw $a0,0($t0)
sw $a1,4($t0)
sw $a2,8($t0)
sw $a3,12($t0)
