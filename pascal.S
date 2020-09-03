main:
    addi $a0, $zero, 10 # n = 10
    addi $a1, $zero, 5  # m = 5
    jal pascal          # call pascal(10, 5)
    j exit

pascal:
    addi $sp, $sp, -16
    sw $ra, 0x0($sp)    # Save $ra register into stack
    sw $s0, 4($sp)
    sw $t0, 8($sp)
    sw $t1, 12($sp)
    addi $v0, $zero, 1
    beq $a0, $a1, return
    beq $a1, $zero, return
    add $t0, $a0, $zero
    add $t1, $a1, $zero
    addi $a0, $t0, -1
    addi $a1, $t1, -1
    jal pascal
    add $s0, $v0, $zero
    addi $a0, $t0, -1
    add $a1, $t1, $zero
    jal pascal
    add $v0, $s0, $v0

return:
    lw $ra, 0($sp)  #Load $ra register from stack
    lw $s0, 4($sp)
    lw $t0, 8($sp)
    lw $t1, 12($sp)
    addi $sp, $sp, 16
    jr $ra
exit:
