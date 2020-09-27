.data
input:	  .word 0x0000000F
one: 	  .word 0x80000000
str1:     .string "clz value of "
str2:     .string " is "

.text
main:
        lw  a0, input   # Load input from static data
        jal ra, clz     # Jump-and-link to the 'clz' label

        # Print the result to console
        mv  a1, a0
        lw  a0, input
        jal ra, printResult

        # Exit program
        li a7, 10
        ecall

clz:
# t0 = one
# t1 = cnt = 32
# t2 = res
# a0 = i
        lw   t0, one
        li   t1, 32
        li   t2, 0
_beg:   bne  t1, zero, cnt
_ret:   mv   a0, t2
        ret
cnt:    addi t1,t1,-1
        and  t3, a0, t0 # i & one
        bne  t3, zero, _ret
        addi t2, t2, 1
        srli t0, t0, 1
        j _beg

# --- printResult ---
# a0: input
# a1: result
printResult:
        mv t0, a0
        mv t1, a1
        la a0, str1
        li a7, 4
        ecall
        mv a0, t0
        li a7, 1
        ecall
        la a0, str2
        li a7, 4
        ecall
        mv a0, t1
        li a7, 1
        ecall
        ret
