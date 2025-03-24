.section .text
.global _start

_start:  
    jal x2, Lab
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    addi x5, x0, 5

Lab :
    addi x8, x0, 4
    jalr x2, 0
    addi x16, x0, 4