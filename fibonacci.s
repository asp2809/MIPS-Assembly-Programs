.data
str: .asciiz "Fibonacci Series:\n"
input: .asciiz "Enter the number upto which you want to print the series: "
space: .asciiz ", "

.text
main:
li $s0, 1       #initializing the first number in s0
li $s1, 1       #initializing the second number in s1
li		$v0, 4		# system call #4 - print string
la		$a0, input
syscall				# execute
li $v0, 5
syscall
la $s2, 0($v0)       #initializing s2 with the nth number that we have to find
addi $s2, $s2, -2
li		$v0, 4		# system call #4 - print string
la		$a0, str
syscall				# execute
li		$v0, 1		# system call #1 - print int
la		$a0, 0($s0)
syscall				# execute
li		$v0, 4		# system call #4 - print string
la		$a0, space
syscall				# execute
li		$v0, 1		# system call #1 - print int
la		$a0, 0($s1)
syscall				# execute
loop:
beq $s2, $zero, end
add $t0, $s1, $s0
move $s0, $s1
move $s1, $t0
li		$v0, 4		# system call #4 - print string
la		$a0, space
syscall				# execute
li		$v0, 1		# system call #1 - print int
la		$a0, 0($s1)
syscall				# execute
addi $s2, $s2, -1
j loop
end:
li $v0, 10
syscall