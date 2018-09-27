
# 1) homework 3 코드에서 마지막 인스트럭션 실행 후 에러가 발생하는 이유

# 다른 homework 코드들과 마찬가지로 homework 3 코드에서도 Attempt to execute non-instruction at 0x00400044 와 같은 에러 메세지가 나타난다. 이는 마지막 주소에서 instruction 이 아닌 문장을 실행하려 했다는 에러이다.이러한 에러가 나타나는 이유는 main 함수를 호출할 때 jal (jump and link) main 을 이용하여 main 함수를 호출한 다음, 다시 진행하던 원래의 위치로 돌아가는 return 이 이루어지지 않았기 때문이다. 이를 해결하기 위해서는 main 함수를 호출할 때 사용되었던 jal main 과 짝을 맞추어 jr $ra 인스트럭션을 main 함수 내부의 마지막에 추가해 주어야 한다. 추가한 다음에 코드 작동은 main 함수가 종료된 다음, 다시 main 함수가 호출되며 반복되는 형태가 된다 이를 통해 원래 a[0] = a[1], a[1] = a[2], a[2] = 10 의 과정이 반복되며 최종적으로 a[0], a[1], a[2] 주소의 값들이 정수 10(0xa) 의 값을 가지게 됨을 spim 의 data segment 를 통해 확인할 수 있었다.

	.data  0x10004000
.word 0xffffffff # save -1 to 0x10004000 (a[0])
.word 0x00001234 # save 0x1234 to 0x10004004 (a[1])
.word 0x000000ff # save 0x00ff to 0x10004008 (a[2])

	.text
	.globl main # main function
main:       
    lui $t0, 0x1000 # save 0x10000000 to $t0 register
    addi $t0, $t0, 0x4000 # add 0x00004000 to $t0 register. now $t0 is 0x10004000

    lw $t1, 4($t0) # now $t1 has value of a[1]
    sw $t1, 0($t0) # save value of $t1(a[1]) to address of $t0(a[0])
    
    lw $t1, 8($t0) # now $t1 has value of a[2]
    sw $t1, 4($t0) # save value of $t1(a[1]) to address of $t0 + 4(a[1])

    addi $t1, $0, 10 # now $t1 is 10, because $t1 = $0 + 10 = 0 + 10
    sw $t1, 8($t0) # save value of $t1(10) to address of $t0 + 9(a[2])
    
    jr $ra # return to $ra address (return address)