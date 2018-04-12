#program to match two strings
.data
    msg1: .asciiz "Enter the first string:"
    msg2: .asciiz "Enter the second string:"
    msg3: .asciiz "The strings are not equal."   #string to be printed when the strings are not equal
    msg4: .asciiz "The strings are equal."       #string to be printed when the strings are not equal

    str1: .space 100
    str2: .space 100

.text

main:
    la $a0, msg1        #printing the message for entering the first string
    li $v0, 4
    syscall

    la $s1, str1        #storing the value of string 1
    move $t0, $s1
    jal storeval

    la $a0, msg2        #printing the message for entering the second string
    li $v0, 4
    syscall

    la $s2, str2        #storing the valur of string 2
    move $t0, $s2
    jal storeval

    jal compare         #comparing the value of string

    li $v0, 10          #making syscall to exit the program
    syscall

    compare:
        lb $t2, ($s1)
        lb $t3, ($s2)
        bne $t2,$t3,L1
        beq $t2,$zero,L2

        addi $s2,$s2,1
        addi $s1,$s1,1
        j compare

        L1:
            la $a0, msg3
            li $v0, 4
            syscall
            jr $ra
        
        L2:
            la $a0, msg4
            li $v0, 4
            syscall
            jr $ra


    storeval:           
        move $a0,$t0
        li $a1,99
        li $v0,8
        syscall
        jr $ra

    

    