.text
check1:
ble $a0,$a1,check2 #branch if satisfied(a0<=a1)
move $t0,$a0
move $a0,$a1
move $a1,$t0
check2:
ble $a1,$a2,finished  #bracnch id satisfied(a1<=a2)
move $t0,$a1
move $a1,$a2
move $a2,$t0
check3:
ble $a0,$a1,finishded   #check again ,in case that new a1 is less than a0(a0<=a1)
move $t0,$a0
move $a0,$a1
move $a1,$t0
finished:
jr $ra


 