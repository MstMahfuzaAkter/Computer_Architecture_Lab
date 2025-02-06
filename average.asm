.data
    result_msg: .asciiz "Average: "  # Message to display

.text
main:
    li $t0, 1      # Initialize the first odd number (1)
    li $t1, 0      # Sum of numbers (initialize to 0)
    li $t2, 0      # Counter for how many numbers

loop:
    add $t1, $t1, $t0  # Add current number to sum
    addi $t2, $t2, 1   # Increment count

    addi $t0, $t0, 2   # Move to the next odd number
    ble $t0, 21, loop  # Continue loop while number <= 21

    # Compute average: sum / count
    div $t1, $t2       # Divide sum by count
    mflo $t3           # Get quotient (average) in $t3

    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print average
    li $v0, 1
    move $a0, $t3
    syscall

    # Exit
    li $v0, 10
    syscall
