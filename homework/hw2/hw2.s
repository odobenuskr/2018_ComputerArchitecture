	.data  0x10002000

.word 0x01020304 # Q1: what is the address of this word?
                 # Q2: what is the address of 0x02 in this word?
.word 0x01234567 # Q3: what is the address of this word?
                 # Q4: what is the address of 0x67 in this word?
.word 0x89abcdef # Q5: what is the address of this word?
                 # Q6: what is the address of 0x89 in this word?
.byte 1 # Q7: what is the address of this byte?
.byte 2 # Q8: what is the address of this byte?
.byte 3 # Q9: what is the address of this byte?
.byte 4 # Q10: what is the address of this byte?

	.text
	.globl main
main:       # answer Q11 and beyond in hexadecimal and binary number.
    lui $t0, 0x1000 # Q11 : what is the value of $t0 after this instruction is executed?
    addi $t0, $t0, 0x2000 # Q12 : what is the value of $t0 after this instruction is executed?
    lb  $t1, 0($t0) # Q13 : what is the value of $t1 after this instruction is executed?
    lb  $t1, 1($t0) # Q14 : what is the value of $t1 after this instruction is executed?
    lb  $t1, 2($t0) # Q15 : what is the value of $t1 after this instruction is executed?
    lb  $t1, 3($t0) # Q16 : what is the value of $t1 after this instruction is executed?
    lw  $t1, 16($t0) # Q17 : write 2 error messages after this instruction is executed
		                # Q18 : what caused this error? explain.
										# Q19 : correct this instruction so that there is no error.
										# Q20 : what is the byte order of this computer?
