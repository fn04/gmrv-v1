.section .text
.global _start

_start:  
    lb x1, 256(x0)
    lh x2, 260(x0)
    lw x3, 264(x0)
    lbu x4, 268(x0)
    lhu x5, 272(x0)
    