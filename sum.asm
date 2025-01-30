.data
    comma: .asciiz ","  
    sum_msg: .asciiz "\nSum: "

.text
main:
    li $t0,1           
    li $t1,0           
for_loop:
    bgt $t0,10,Exit     

    li $v0,1           
    move $a0,$t0      
    syscall             

    add $t1, $t1, $t0   

    beq $t0,10,Exit   

    li $v0,4          
    la $a0,comma      
    syscall            

    addi $t0, $t0, 1   
    j for_loop         

Exit:
    li $v0,4           
    la $a0, sum_msg     
    syscall             
    li $v0,1            
    move $a0, $t1       
    syscall             

    li $v0,10           
    syscall             
