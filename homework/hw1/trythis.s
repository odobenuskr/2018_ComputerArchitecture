	.data  0x10000000
.word 0x1  # Q1 : what is the memory address of this data (in hexdecimal number) ?
.word 0x2  # Q2 : what is the memory address of this data (in hexdecimal number) ?
.word 0x3  # Q3 : what is the memory address of this data (in hexdecimal number) ?
.word 0x4  # Q4 : what is the memory address of this data (in hexdecimal number) ?

	.text
	.globl main
main:
    lui $t0, 0x1000 # Q5 : what is the value of $t0 after this instruction is executed?
    lw  $t1, 0($t0) # Q6 : what is the value of $t1 after this instruction is executed?
    lw  $t2, 4($t0) # Q7 : what is the value of $t2 after this instruction is executed?

    add $t3, $t1, $t2  # Q8 : what is the value of $t3 after this instruction is executed?


	
