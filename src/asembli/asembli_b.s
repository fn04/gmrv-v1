.global _main
.text

_main:
    addi x1, x0, 4
    addi x2, x0, 4
    beq x1, x2, 18
    addi x6, x0, 4
    addi x5, x0, 8
    beq x1, x2, 32
    addi x5, x0, 12
    addi x5, x0, 16
    addi x5, x0, 20
    addi x5, x0, 24

LAB:
    addi x24, x0, 9

