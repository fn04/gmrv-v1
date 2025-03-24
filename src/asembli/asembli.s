.section .text
.global _start

_start:  
    addi x10, x0, 2
    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    xori x2, x1, 1
    ori x3, x0, 1
    andi x4, x0, 1
    slli x5, x6, 2
    srli x6, x7, 1
    srai x7, x8, 2
    slti x8, x9, 4
    sltiu x9, x10, 1