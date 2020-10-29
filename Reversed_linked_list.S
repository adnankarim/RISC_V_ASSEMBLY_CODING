.data
space: .asciiz " "
.word
#Allocation
#a1->head
li a0,9 #sbrk
li a1,8 #node1
ecall
mv a2,a0
#a2->first
li a0,9
li a1,8
ecall
mv a3,a0
#a3->second
li a0,9
li a1,8
ecall
mv a4,a0
.text
.globl main
#Assigning values
#and pointing to next node if exists
#head
li t0,5
sw t0,0(a2)#head->value=5
sw a3,4(a2)#head->Next= first
#first
li t0,10
sw t0,0(a3)#head->value=10
sw a4,4(a3)#head->Next= second
#second
li t0,15
sw t0,0(a4)#head->value=15
sw zero,4(a4)#head->Next= NULL
mv a5,a2
jal ra,print_reversed_list
j end
print_reversed_list: #arg=a5
#PROLOGUE
addi sp,sp,-12
sw ra,0(sp)
sw a5,4(sp)#ptr
sw s0,8(sp)10
lw s0,4(a5)#load into s0
bne s0,zero,Else
#if next->NULL
lw s0,0(a5) #get value
li a0,1 #int print
mv a1,s0
ecall
#space print
li a0,4
la a1,space
ecall
j end_print
Else:
#if !(next->NULL)
lw a5,4(a5)
jal print_reversed_list
lw t0, 4(sp) # from stack into t0
lw t0,0(t0) #get value
li a0,1
mv a1,t0 #mov into a1
ecall
#space print
li a0,4
la a1,space
ecall
end_print:
#EPILOGUE
lw ra,0(sp)
sw a5,4(sp)
lw s0,8(sp)
addi sp,sp,12
jr ra
end:
#exiting
addi a0 , zero , 10
ecall