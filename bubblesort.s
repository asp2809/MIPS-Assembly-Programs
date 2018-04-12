#program for sorting an array using bubble sort
.data
list: .space 20
space: .asciiz " "
inputstr: .asciiz "Enter 5 numbers to be sorted:"

.text
main:
li		$v0, 4		# system call #4 - print string
la		$a0, inputstr
syscall				# execute

li $t0, 0

inputloop:
beq $t0, 20, l
li $v0, 5
syscall
sw $v0, list($t0)
addi $t0, $t0, 4
j inputloop
l:
jal bubblesort

jal printarray

li $v0, 10
syscall

bubblesort: 
li $s0, 0       #storing the value of i
L1:
slti $t2, $s0, 20
beq $t2, $zero, end1
li $s1, 0       #storing the value of j
L2:
li $t3, 20
sub $t3, $t3, $s0        #storing the value of n-i-1
slt $t4, $s1, $t3
beq $t4, $zero, end2
move $t5, $s1             #storing the value of j+1
addi $t5, $t5, 4
lw $t6, list($s1)
lw $t7, list($t5)
slt $t8, $t7, $t6
beq $t8, $zero, end3
swap:
lw $t6, list($s1)
lw $t7, list($t5)
sw $t7, list($s1)
sw $t6, list($t5)
end3:
addi $s1, $s1, 4
j L2
end2:
addi $s0, $s0, 4
j L1
end1:
jr $ra

printarray:
li $t0, 0
loop:
beq $t0, 20, exit
li		$v0, 1		# system call #4 - print string
lw		$a0, list($t0)
syscall				# execute

li		$v0, 4		# system call #4 - print string
la		$a0, space
syscall				# execute

addi $t0, $t0, 4
j loop
exit:
jr $ra