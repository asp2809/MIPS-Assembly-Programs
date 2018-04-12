.data
    list: .word 5, 4, 2, 0, 1
.text

main:
    addi $s0, $zero, 5  #setting the value of min as 5
    addi $t0, $zero, 0
    jal L1
    li		$v0, 1		# system call #4 - print string
    la		$a0, 0($s0)
    syscall				# execute
    li $v0, 10
    syscall
    
    L1:
        slti $t2, $t0, 20
        bne $t2, $zero, L3
        jr $ra
    L3:
        lw $t4, list($t0)
        slt $t1, $s0, $t4
        bne $t1, $zero, L2
        move $s0, $t4
    L2: 
        addi $t0, $t0, 4
        j L1