.data
    comma: .asciiz ","     

.text
main:
    li $t0, 1            

for_loop:
    bgt $t0, 10, Exit    

    li $v0, 1            
    move $a0, $t0        
    syscall              

    beq $t0, 10, Exit  

    li $v0, 4              
    la $a0, comma          
    syscall                

    addi $t0, $t0, 1      
    j for_loop            
           

Exit:
    li $v0, 10             
    syscall               
