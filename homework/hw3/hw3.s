	.data  0x10004000

.word 0xffffffff # save -1 to 0x10004000 (a[0])

.word 0x00001234 # save 0x1234 to 0x10004004 (a[1])

.word 0x000000ff # save 0x00ff to 0x10004008


	.text
	.globl main
main:       
    lui $t0, 0x1000 # save 0x10000000 to $t0 register
    addi $t0, $t0, 0x4000 # add 0x00004000 to $t0 register. now $t0 is 0x10004000

    lw $t1, 4($t0) # now $t1 has value of a[1]
    sw $t1, 0($t0) # save value of $t1(a[1]) to address of $t0(a[0])
    
    lw $t1, 8($t0) # now $t1 has value of a[2]
    sw $t1, 4($t0) # save value of $t1(a[1]) to address of $t0 + 4(a[1])

    addi $t1, $0, 10 # now $t1 is 10, because $t1 = $0 + 10 = 0 + 10
    sw $t1, 8($t0) # save value of $t1(10) to address of $t0 + 9(a[2])