Fact: # arg: n in a0, returns n! in a1
addi sp, sp, -8 # reserve our stack area
sw ra, 0(sp) # save the return address
sw a0, 4(sp) # save our n
li t0, 2 #for all n=0,1 or less
blt a0, t0, return_one # 0! and 1! == 1
addi a0, a0, -1
jal Fact # call fact (n-1)
lw t0, 4(sp) # t0 <- n
mul a1, t0, a1 # a1 <- n * fact(n-1)
j end_fact
return_one:
li a1, 1
end_fact:
lw ra, 0(sp) # restore return address from stack
addi sp, sp, 8 # free our stack frame
jr ra # and return