  .data  0x10004000
.word 0xffffffff # save -1 to 0x10004000
.word 0x00001234 # save 0x1234 to 0x10004004
.word 0x000000ff # save 0x00ff to 0x10004008

  .text
  .globl main
main:

  lui $t0, 0x1000
  addi $t0, $t0, 0x2000

  lw $t1, 4($t0)
  sw $t1, 0($t0)

  lw $t1, 8($t0)
  sw $t1, 4($t0)

  addi $t1, $0, 10
  sw $t1, 8($t0)
