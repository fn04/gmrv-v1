.section .text
.global _main

_main:  
    lw x1, 0(x0)
    sb x1, 4(x0)
    sh x1, 8(x0)
    sw x1, 12(x0)

    