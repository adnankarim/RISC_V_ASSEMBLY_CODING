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