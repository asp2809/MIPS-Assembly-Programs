#program to print hello world in MIPS Assembly
.data
    msg: .asciiz "Hello World!!!"

.text

main:
    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 10
    syscall
    