#program to check a given string is a palindrome
.data
str: .asciiz "maama"
pal: .asciiz "The string is a palindrome"
npal: .asciiz "The string is not a palindrome"

.text
main:
li $s0, 0       #initializing the starting point
li $s1, 4      #initializing the point from the end
jal L1
li $v0, 10
syscall
#Approach: We will go from the starting as well as the end and loop throough until the starting point is greater than the ending point and will check if both letters are equal or not
L1:
slt $t0, $s0, $s1
beq $t0, $zero, end
lb $t1, str($s0)
lb $t2, str($s1)
bne $t1, $t2, end2
addi $s0, $s0, 1
addi $s1, $s1, -1
j L1
end:
li		$v0, 4		# system call #4 - print string
la		$a0, pal
syscall				# execute
jr $ra
end2:
li		$v0, 4		# system call #4 - print string
la		$a0, npal
syscall				# execute
jr $ra
