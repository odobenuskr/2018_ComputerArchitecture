	.data  0x10004000
.word 0xffffffff # save -1 to 0x10004000 (a[0])
.word 0x00001234 # save 0x1234 to 0x10004004 (a[1])
.word 0x000000ff # save 0x00ff to 0x10004008 (a[2])

	.text
	.globl main
main:

    lui $t0, 0x1000 		# save 0x10000000 to $t0 register
    addi $t0, $t0, 0x4000 	# add 0x00004000 to $t0 register. now $t0 is base address 0x10004000

    # addi $t1, $0, 0		# save start index(0) to $t1 register. but $t1 is already 0 value, so it's not necessary
    addi $t2, $0, 2		# save end index(2) to $t2 register 
 
    For:
    lw $t3, 4($t0) 		# now $t3 has value of a[n+1]
    sw $t3, 0($t0) 		# save value of $t3(a[n+1]) to address of $t0(a[n])

    addi $t0, $t0, 0x0004	# change base address t0 (t0 = t0 + 4)
    addi $t1, $t1, 1		# update index to +1
    slt $t4, $t1, $t2		# if index is smaller than 2
    bne $t4, $0, For		# go to 'For' branch