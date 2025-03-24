	.file	"main.c"
	.option pic
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"i"
	.align	2
.LC1:
	.string	"e"
	.align	2
.LC2:
	.string	"board: %s (id=%d)\n"
	.align	2
.LC3:
	.string	"rv32i"
	.align	2
.LC4:
	.string	"Sat, 28 Sep 2024 21:52:40 +0700"
	.align	2
.LC5:
	.string	"build: %s for %s\n"
	.align	2
.LC6:
	.string	"core%d: "
	.align	2
.LC7:
	.string	"darkriscv@%dMHz w/ "
	.align	2
.LC8:
	.string	"rv32%s "
	.align	2
.LC9:
	.string	"MAC "
	.align	2
.LC10:
	.string	"\n"
	.align	2
.LC11:
	.string	"bram0: text@%d+%d data@%d+%d stack@%d\n"
	.align	2
.LC12:
	.string	"bram0: %d bytes free\n"
	.align	2
.LC13:
	.string	"uart0: 115.2kbps (div=%d)\n"
	.globl	__udivsi3
	.align	2
.LC14:
	.string	"timr0: %dHz (div=%d)\n"
	.align	2
.LC15:
	.string	"Welcome to DarkRISCV!\n"
	.align	2
.LC16:
	.string	"> "
	.align	2
.LC17:
	.string	"led"
	.align	2
.LC18:
	.string	"led flip!\n"
	.align	2
.LC19:
	.string	"reboot"
	.align	2
.LC20:
	.string	"rebooting...\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	s3,44(sp)
	la	s3,io
	lw	a5,0(s3)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	lbu	a0,0(a5)
	andi	a0,a0,0xff
	call	board_name@plt
	lw	a5,0(s3)
	mv	a1,a0
	.LA2: auipc	a0,%pcrel_hi(.LC2)
	lbu	a2,0(a5)
	addi	a0,a0,%pcrel_lo(.LA2)
	andi	a2,a2,0xff
	call	printf@plt
	.LA3: auipc	a2,%pcrel_hi(.LC3)
	.LA4: auipc	a1,%pcrel_hi(.LC4)
	.LA5: auipc	a0,%pcrel_hi(.LC5)
	addi	a2,a2,%pcrel_lo(.LA3)
	addi	a1,a1,%pcrel_lo(.LA4)
	addi	a0,a0,%pcrel_lo(.LA5)
	call	printf@plt
	lw	a5,0(s3)
	.LA6: auipc	a0,%pcrel_hi(.LC6)
	addi	a0,a0,%pcrel_lo(.LA6)
	lbu	a1,2(a5)
	andi	a1,a1,0xff
	call	printf@plt
	lw	a5,0(s3)
	.LA7: auipc	a0,%pcrel_hi(.LC7)
	addi	a0,a0,%pcrel_lo(.LA7)
	lbu	a1,1(a5)
	andi	a1,a1,0xff
	slli	a1,a1,1
	call	printf@plt
	call	check4rv32i@plt
	.LA1: auipc	a1,%pcrel_hi(.LC1)
	addi	a1,a1,%pcrel_lo(.LA1)
	beqz	a0,.L2
	.LA0: auipc	a1,%pcrel_hi(.LC0)
	addi	a1,a1,%pcrel_lo(.LA0)
.L2:
	.LA8: auipc	a0,%pcrel_hi(.LC8)
	addi	a0,a0,%pcrel_lo(.LA8)
	call	printf@plt
	li	a2,16
	li	a1,16
	li	a0,1000
	call	mac@plt
	li	a5,1256
	beq	a0,a5,.L16
.L3:
	.LA10: auipc	a0,%pcrel_hi(.LC10)
	addi	a0,a0,%pcrel_lo(.LA10)
	call	printf@plt
	la	a3,_data
	la	s0,_edata
	la	a1,_text
	la	s1,_stack
	.LA11: auipc	a0,%pcrel_hi(.LC11)
	la	a2,_etext
	sub	a4,s0,a3
	sub	a2,a2,a1
	mv	a5,s1
	addi	a0,a0,%pcrel_lo(.LA11)
	call	printf@plt
	.LA12: auipc	a0,%pcrel_hi(.LC12)
	sub	a1,s1,s0
	addi	a0,a0,%pcrel_lo(.LA12)
	call	printf@plt
	lw	a5,0(s3)
	.LA13: auipc	a0,%pcrel_hi(.LC13)
	addi	a0,a0,%pcrel_lo(.LA13)
	lhu	a1,6(a5)
	li	a5,-559038464
	addi	a5,a5,-273
	slli	a1,a1,16
	srli	a1,a1,16
	sw	a5,0(s0)
	call	printf@plt
	lw	a4,0(s3)
	la	s4,utimers
	li	s2,999424
	lbu	a5,1(a4)
	lw	a1,12(a4)
	lw	s0,12(a4)
	andi	a5,a5,0xff
	slli	a4,a5,5
	sub	a4,a4,a5
	slli	a0,a4,6
	sub	a0,a0,a4
	slli	a0,a0,3
	add	a0,a0,a5
	addi	a1,a1,1
	slli	a0,a0,7
	call	__udivsi3@plt
	mv	a1,a0
	.LA14: auipc	a0,%pcrel_hi(.LC14)
	mv	a2,s0
	addi	a0,a0,%pcrel_lo(.LA14)
	call	printf@plt
	lw	a5,0(s3)
	li	a4,-128
	.LA15: auipc	a0,%pcrel_hi(.LC10)
	sb	a4,3(a5)
	addi	a0,a0,%pcrel_lo(.LA15)
	sw	zero,0(s4)
	call	printf@plt
	.LA16: auipc	a0,%pcrel_hi(.LC15)
	addi	a0,a0,%pcrel_lo(.LA16)
	mv	s1,sp
	call	printf@plt
	li	s0,-128
	addi	s2,s2,575
.L9:
	.LA17: auipc	a0,%pcrel_hi(.LC16)
	addi	a0,a0,%pcrel_lo(.LA17)
	call	printf@plt
	li	a2,32
	li	a1,0
	mv	a0,s1
	call	memset@plt
	lw	a4,0(s3)
	j	.L6
.L4:
	lbu	a5,4(a4)
	andi	a5,a5,2
	bnez	a5,.L17
.L6:
	lbu	a5,3(a4)
	slli	a5,a5,24
	srai	a5,a5,24
	bgez	a5,.L4
	lw	a5,0(s4)
	addi	a3,a5,-1
	sw	a3,0(s4)
	bnez	a5,.L5
	lhu	a5,8(a4)
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,8(a4)
	sw	s2,0(s4)
.L5:
	sb	s0,3(a4)
	lbu	a5,4(a4)
	andi	a5,a5,2
	beqz	a5,.L6
.L17:
	li	a1,32
	mv	a0,s1
	call	gets@plt
	.LA18: auipc	a1,%pcrel_hi(.LC17)
	addi	a1,a1,%pcrel_lo(.LA18)
	mv	a0,s1
	call	strcmp@plt
	beqz	a0,.L18
	.LA20: auipc	a1,%pcrel_hi(.LC19)
	addi	a1,a1,%pcrel_lo(.LA20)
	mv	a0,s1
	call	strcmp@plt
	bnez	a0,.L9
	.LA21: auipc	a0,%pcrel_hi(.LC20)
	addi	a0,a0,%pcrel_lo(.LA21)
	call	printf@plt
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	li	a0,0
	addi	sp,sp,64
	jr	ra
.L18:
	.LA19: auipc	a0,%pcrel_hi(.LC18)
	addi	a0,a0,%pcrel_lo(.LA19)
	call	printf@plt
	lw	a4,0(s3)
	lhu	a5,8(a4)
	not	a5,a5
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,8(a4)
	j	.L9
.L16:
	.LA9: auipc	a0,%pcrel_hi(.LC9)
	addi	a0,a0,%pcrel_lo(.LA9)
	call	printf@plt
	j	.L3
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
