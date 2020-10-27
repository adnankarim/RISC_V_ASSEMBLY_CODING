.data
X: .word 21
Y: .word 49
string: .asciiz "Greatest common divisor of "
and_str: .asciiz " and "
is: .asciiz " is "
.text
.globl main
main :
lw a2,X # a2->x
lw a3,Y # a3->y
#Do while loop
loop:
blt a2,a3,less #if a<b jump to less
sub a2,a2,a3 #a = a-b
j skip #skip less label
less:
sub a3,a3,a2 #b = b-a
skip:
beq a2,a3,end # if equal jump to end9
j loop # to continue the loop
end:
#first string
la a1,string
addi a0,zero,4
ecall
#print x
lw a1,X
addi a0,zero,1
ecall
#print and
la a1,and_str
addi a0,zero,4
ecall
#print y
lw a1,Y
addi a0,zero,1
ecall
#print is
la a1,is
addi a0,zero,4
ecall
#print y
mv a1,a3
addi a0,zero,1
ecall
#exiting
addi a0 , zero , 10
ecall