.data
    text1: .asciiz "Enter first number: "
    text2: .asciiz "Enter second number: "
    text3: .asciiz "Enter third number: "
    result: .asciiz "The largest number is: "

.text
main:
    li $v0, 4#print first number
    la $a0, text1
    syscall
    
    li $v0, 5# Read first number
    syscall
    move $t0, $v0  # Store first number in $t0

    li $v0, 4 # Print for second number
    la $a0, text2
    syscall

    li $v0, 5# Read second number
    syscall
    move $t1, $v0  # Store second number in $t1

    li $v0, 4# Print third number
    la $a0, text3
    syscall

    li $v0, 5# Read third number
    syscall
    move $t2, $v0 # Store third number in $t2

    # Find the largest number
    move $t3, $t0  # Assume first number is largest

    bgt $t1, $t3, update1  # If second number > largest so far, update
    j check2

update1:
    move $t3, $t1  # Update largest to second number

check2:
    bgt $t2, $t3, update2  # If third number > largest so far, update
    j print_result

update2:
    move $t3, $t2  # Update largest to third number

print_result:
    # Print result message
    li $v0, 4
    la $a0, result
    syscall

    # Print largest number
    li $v0, 1
    move $a0, $t3
    syscall

    # Exit
    li $v0, 10
    syscall
