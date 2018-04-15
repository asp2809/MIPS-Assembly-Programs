.data
str: .asciiz "The Factorial of the number is: "
input1: .asciiz "Enter the number you want to find the factorial of: "

.text 
main:
li		$v0, 4		# system call #4 - print string
la		$a0, input1
syscall				# execute
li $v0, 5
syscall
la $s0, 0($v0)       #initaializing the input in s0
li $s1, 1            #initializing the result by 1
jal fact
li		$v0, 4		# system call #4 - print string
la		$a0, str
syscall				# execute
li		$v0, 1		# system call #1 - print int
la		$a0, 0($s1)		# 
syscall				# execute
li $v0, 10
syscall

fact:
beq $s0, $zero, l1  #condition for checking whether number is zero or not
addi $sp, $sp, -8   #making space in stack
sw $s0, 0($sp)      #storing the return addres and the number at that moment in stack
sw $ra, 4($sp)
addi $s0, $s0, -1
jal fact
l1:
lw $t0, 0($sp)      #loading the value of return address and number
lw $ra, 4($sp)
addi $sp, $sp, 8
mul $s1, $s1, $t0   #multiplying the number with s1 and as the program goes on this line calculates the result and stores it in s1
jr $ra