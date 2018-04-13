.data
str: .asciiz "The sum of even terms is:"
.text
main:
li $s0, 0           #starting the value from 0
li $s1, 0           #caluculating the sum in the s1 register
li $v0, 5
syscall
move $s2, $v0       #taking the value from the user and storing it in s2     
jal sum1
li		$v0, 4		# system call #4 - print string
la		$a0, str
syscall				# execute
li		$v0, 1		# system call #1 - print int
la      $a0, ($s1)
syscall				# execute
li $v0,10
syscall
sum1:
addi $sp, $sp, -8
sw $s0, 4($sp)
sw $ra, 0($sp)
addi $s0, $s0, 2
sle $t0, $s0, $s2
beq $t0, $zero, L1
jal sum1
L1:
lw $t1, 4($sp)
lw $ra, 0($sp)
add $s1, $s1, $t1
addi $sp, $sp, 8
jr $ra
