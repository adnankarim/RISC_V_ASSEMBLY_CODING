#  Write an assembly program that prints the pattern shown using loops and branches.


.data
space: .asciiz " "
asterisk: .asciiz "* "
newline: .asciiz "\n"
.text
.globl main
main :
addi a2 , zero , 6 # a2->n=6
jal ra, triangle #calling function triangle to print pattern
j end
#function
triangle:
addi sp,sp,-20 # adjust stack for 2 items
sw s4,16(sp)
sw s3,12(sp)
sw s2, 8(sp) #save s2 for use afterwards
sw s1, 4(sp) # save s1 for use afterwards
sw s0, 0(sp) # save s0 for use afterwards
slli s0,a2,1 #spaces
addi s0,s0,-2 #spaces
# s0->k6
# s1->i
addi s1,x0,0
loop1:
#s2->j
addi s2,x0,0
loop2:
la a1,space
addi a0 , zero , 4 # a0=4 prints string in a1 in console
ecall #prints sspaces
addi s2,s2,1 #j++
blt s2,s0,loop2 #j<k
#decrementing k--
addi s0,s0,-1
#loop3
addi s3,x0,0 #s=0
loop3:
la a1,asterisk
addi a0 , zero , 4 # a0=4 prints string in a1 in console
ecall #prints asterisk
mv s4,s1
addi s4,s4,1
addi s3,s3,1#s++
blt s3,s4,loop3
#new line
la a1,newline
addi a0 , zero , 4 # a0=4 prints string in a1 in console
ecall #prints newline char
addi s1,s1,1 #i++
blt s1,a2,loop1 #i<n
lw s0, 0(sp) # restore register s0 for caller
lw s1, 4(sp) # restore register s1 for caller
lw s2, 8(sp) # restore register s2 for caller
lw s3, 12(sp) # restore register s3 for caller
lw s4, 16(sp) # restore register s4 for caller
addi sp,sp,20 # adjust stack to delete 5 items
jr ra # jump back to calling routine
end :
addi a0 , zero , 10
ecall