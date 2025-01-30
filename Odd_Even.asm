.data
    p: .asciiz "Enter a number: "  
    even_msg: .asciiz "The number is even.\n" 
    odd_msg: .asciiz "The number is odd.\n" 

.text
main:
    li $v0, 4                  
    la $a0, p          
    syscall                    

    
    li $v0, 5                  
    syscall                    
    move $t0, $v0              


    li $t1, 2                 
    div $t0, $t1               
    mfhi $t2          
    beq $t2, $zero, even      

   
odd:
    li $v0, 4                  
    la $a0, odd_msg            
    syscall                    
    j exit                   

even:
    li $v0, 4                 
    la $a0, even_msg         
    syscall                    

exit:
    li $v0, 10                
    syscall                    
