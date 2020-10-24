MUL:
addi sp , sp , -8 #PROLOGUE
sw ra , 4( sp )
sw s0 , 0( sp )7
addi s0 , zero , 0 #result = 0
addi t0 , zero , 0 # i = 0
beq a1 , zero , endfor
for:
add s0 , s0 , a0 #result += arg1
addi t0 , t0 , 1 #i++
blt t0 , a1 , for
endfor:
add a0 , zero , s0 #return result
lw ra , 4( sp ) # EPILOGUE
lw s0 , 0( sp )
addi sp , sp , 8
jr ra