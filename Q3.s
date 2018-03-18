.data
    array: .word 3, 4, 0, 8, 7
    l1: .asciiz "Sorted Array is\n"

.text

_start:
    lw $a0,array
    li $a1,5
    
    jal bubblesort
    jal printarray

    li $v0, 10
    syscall

    print:
        li $v0, 4
        la $a0, l1
        syscall
        
        add $t0, $zero, $zero
        while:
        beq $t0, 20, exit
        li $v0, 1
        lw $a0, array($t0)
        syscall

        addi $t0, $t0, 4
        j while
        exit:
            jr $ra

    bubblesort:
        addi $sp,$sp,-20
        sw $ra,16($sp)      #return address stored in last part of stack
        sw $s3,12($sp)      #Base address of array stored in $s3
        sw $s2,8($sp)       #value of n stored in $s2
        sw $s1,4($sp)       #value of i stored in $s1
        sw $s0,0($sp)       #value of j stored in $s0
        
        add $s3,$a0,$zero
        add $s2,$zero,$a1
        add $s1,$zero,$zero     #initialize i with 0

        L1:         
            slt $t1,$s1,$s2        #checking if i<n
            beq $t1,$zero,end1
            add $s0,$zero,$zero      #if the value of i not less than n then jump to end1

            sub $t3,$s2,$s1     
            addi $t3,$t3,-1         #setting the value of n-i-1

        L2:
            slt $t4,$s0,$t3
            beq $t4,$zero,end2

            sll $t5,$s0,2
            add $t5,$s3,$t5

            lw $t6, 0($t5)
            lw $t7, 4($t5)

            slt $t2, $t7, $t6
            beq $t2,$zero,end3

            add $a0, $s3, $zero
            add $a1, $s0, $zero

            jal swap
            addi $s0,$s0,1
            j L2

        end3:
            addi $s0,$s0,1      #adding 1 to the value of j
            j L2

        end2: 
            addi $s1,$s1,1      #adding 1 to the value of i
            j L1

        end1:
            lw $ra,16($sp)
            lw $s3,12($sp)
            lw $s2,8($sp)
            lw $s1,4($sp)
            lw $s0,0($sp)
            addi $sp,$sp,20
            jr $ra
        
        swap:
             sll $t0, $a1, 2
             add $t0, $a0, $t0

             lw $t0, 0($t1)
             lw $t2, 4($t1)
             sw $t2, 0($t1)
             sw $t0, 4($t1)

             jr $ra
        
        