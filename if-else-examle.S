# Below are two copies of a same program with different values of variables t0 and t1 (“a” and
# “b”). Optimize the if-else condition with the same code in both programs such that your
# codeshould comprise ofonlythreeinstructions(counting pseudo-instruction as one).


.data
Pass : .asciiz "a <= b"
Fail : .asciiz "a > b"
.text
.globl main
main :
addi t0 , zero , 10 # a
addi t1 , zero , 20 # b
# Update h e r e
la a1 , Fail #initially consider a>b
blt t1 , t0 , done #if less b<a
la a1 , Pass #load pass
done :
addi a0 , zero , 4
ecall
end :
addi a0 , zero , 10
ecall