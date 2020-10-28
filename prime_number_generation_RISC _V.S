#Write an assembly program that prints all the prime numbers between 1 and 100. You should
#not use pre-defined data. Variants of arithmetic, logical, load, store and branch instructions
#are only allowed. (Hint: Knowledge of Greatest Common Divisor, you gained in the previous
#sections of this lab might be useful)

.data
Limit: .word 100 #upto 100
string: .asciiz "Prime Numbers From 1 to 100 are:\n "
space: .asciiz " "
.text
.globl main
main :
la a1,string
addi a0 , zero , 4 #string print
ecall
lw a4,Limit # loading into argument
addi t6,a4,1 #101
addi t0,zero,1 #NUMBER=1 iterator1
LOOP1:
bge t0,t6,LOOP1_END #loop Cond
addi t1,zero,0 #count=0
addi t2,zero,2 #iterator2
addi t5,t0,2
srli t5,t5,1 #number/2
LOOP2:
bge t2,t5,LOOP2_END #loop Cond2 i< NUMBER/2
add a2,zero,t0#mod first arg
add a3,zero,t2#mod 2nd arg1 1
jal ra, Modulo
bne a1,zero,LOOP2_SKIP#jump when mod not equal zero
addi t1,t1,1#count++
j LOOP2_END
LOOP2_SKIP:
addi t2,t2,1#i++
j LOOP2 #gO FORNXT ITERATION
LOOP2_END:
#(count==0 && i!=1)
beq t1,zero,T_ZERO
j LOOP1_SKIP
T_ZERO:
addi t3,zero,1
bne t0,t3,NOT_EQ
j LOOP1_SKIP
NOT_EQ:
mv a1,t0#a1=prime number
addi a0,zero,1#pri nt integer
ecall
la a1,space
addi a0 , zero , 4 #string prints space
ecall
LOOP1_SKIP:
addi t0,t0,1#i++
j LOOP1 #gO FOR NEXT ITERATION
LOOP1_END:
j end
#Modulo Function
Modulo:
blt a2,a3,remend #a<b return a
L1:
sub a2,a2,a3 # a=a-b
blt a2,a3,remend #when a becomes a<b return a
j L1 #continue until becomes a<b
remend:
mv a1,a2 # return remainder in a1
end_L:
jr ra # jump back to calling routine
end:
#exiting
addi a0 , zero , 10
ecall