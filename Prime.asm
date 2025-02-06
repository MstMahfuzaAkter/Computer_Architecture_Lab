.data
	message:.asciiz "Enter a number:"
	prime_message:.asciiz "The number is prime.\n"
	not_prime_message:.asciiz "The number is not prime.\n"
.text
main:
	li $v0,4
	la $a0,message
	syscall
	
        li $v0,5
        syscall
        move $t0,$v0
        
        	ble $t0,1,not_prime
        	
        	li,$t1,2
        	
check_loop:
	mul $t2,$t1,$t1
	bgt $t2,$t0,prime
	
        div $t0,$t1
        mfhi $t3
         			
	beqz $t3,not_prime
	
	addi $t1,$t1,1
	j check_loop
	
prime:
    li $v0, 4
    la $a0, prime_message
    syscall
    j exit

not_prime:
    li $v0, 4
    la $a0, not_prime_message
    syscall

exit:
    li $v0, 10
    syscall	