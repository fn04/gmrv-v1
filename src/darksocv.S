
darksocv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	800005b7          	lui	a1,0x80000
   4:	0025c603          	lbu	a2,2(a1) # 80000002 <_global+0x7fffe906>

00000008 <_thread_lock>:
   8:	00061063          	bnez	a2,8 <_thread_lock>
   c:	800005b7          	lui	a1,0x80000
  10:	00058503          	lb	a0,0(a1) # 80000000 <_global+0x7fffe904>
  14:	04050663          	beqz	a0,60 <_normal_boot>
  18:	07500513          	li	a0,117
  1c:	0c4000ef          	jal	ra,e0 <_uart_putchar>
  20:	00001697          	auipc	a3,0x1
  24:	ef86a683          	lw	a3,-264(a3) # f18 <_GLOBAL_OFFSET_TABLE_+0x18>
  28:	00500713          	li	a4,5
  2c:	007d07b7          	lui	a5,0x7d0

00000030 <_uart_boot_loop1>:
  30:	00078513          	mv	a0,a5
  34:	0d8000ef          	jal	ra,10c <_uart_getchar>
  38:	00054863          	bltz	a0,48 <_uart_boot_exit>
  3c:	00a68023          	sb	a0,0(a3)
  40:	00168693          	addi	a3,a3,1
  44:	fedff06f          	j	30 <_uart_boot_loop1>

00000048 <_uart_boot_exit>:
  48:	02e00513          	li	a0,46
  4c:	094000ef          	jal	ra,e0 <_uart_putchar>
  50:	fff70713          	addi	a4,a4,-1
  54:	fce04ee3          	bgtz	a4,30 <_uart_boot_loop1>
  58:	06200513          	li	a0,98
  5c:	084000ef          	jal	ra,e0 <_uart_putchar>

00000060 <_normal_boot>:
  60:	00a00513          	li	a0,10
  64:	07c000ef          	jal	ra,e0 <_uart_putchar>
  68:	00000697          	auipc	a3,0x0
  6c:	0cc68693          	addi	a3,a3,204 # 134 <_rle_banner>
  70:	00000797          	auipc	a5,0x0
  74:	12b78793          	addi	a5,a5,299 # 19b <_rle_dict>
  78:	0006c703          	lbu	a4,0(a3)

0000007c <_rle_banner_loop1>:
  7c:	00675513          	srli	a0,a4,0x6
  80:	00f50533          	add	a0,a0,a5
  84:	00054503          	lbu	a0,0(a0)
  88:	03f77713          	andi	a4,a4,63
  8c:	00168693          	addi	a3,a3,1

00000090 <_rle_banner_loop2>:
  90:	050000ef          	jal	ra,e0 <_uart_putchar>
  94:	fff70713          	addi	a4,a4,-1
  98:	fee04ce3          	bgtz	a4,90 <_rle_banner_loop2>
  9c:	0006c703          	lbu	a4,0(a3)
  a0:	fc071ee3          	bnez	a4,7c <_rle_banner_loop1>
  a4:	00000697          	auipc	a3,0x0
  a8:	0fb68693          	addi	a3,a3,251 # 19f <_str_banner>

000000ac <_str_banner_loop3>:
  ac:	0006c503          	lbu	a0,0(a3)
  b0:	030000ef          	jal	ra,e0 <_uart_putchar>
  b4:	00168693          	addi	a3,a3,1
  b8:	fe051ae3          	bnez	a0,ac <_str_banner_loop3>
  bc:	00001117          	auipc	sp,0x1
  c0:	e6812103          	lw	sp,-408(sp) # f24 <_GLOBAL_OFFSET_TABLE_+0x24>
  c4:	00001197          	auipc	gp,0x1
  c8:	e481a183          	lw	gp,-440(gp) # f0c <_GLOBAL_OFFSET_TABLE_+0xc>
  cc:	00a54533          	xor	a0,a0,a0
  d0:	00b5c5b3          	xor	a1,a1,a1
  d4:	00c64633          	xor	a2,a2,a2
  d8:	128000ef          	jal	ra,200 <main>
  dc:	f25ff06f          	j	0 <_start>

000000e0 <_uart_putchar>:
  e0:	800005b7          	lui	a1,0x80000

000000e4 <_uart_putchar_busy>:
  e4:	00458603          	lb	a2,4(a1) # 80000004 <_global+0x7fffe908>
  e8:	fff64613          	not	a2,a2
  ec:	00167613          	andi	a2,a2,1
  f0:	fe060ae3          	beqz	a2,e4 <_uart_putchar_busy>
  f4:	00a582a3          	sb	a0,5(a1)
  f8:	00a00593          	li	a1,10
  fc:	00b51663          	bne	a0,a1,108 <_uart_putchar_exit>
 100:	00d00513          	li	a0,13
 104:	fddff06f          	j	e0 <_uart_putchar>

00000108 <_uart_putchar_exit>:
 108:	00008067          	ret

0000010c <_uart_getchar>:
 10c:	800005b7          	lui	a1,0x80000

00000110 <_uart_getchar_busy>:
 110:	00050e63          	beqz	a0,12c <_uart_getchar_tout>
 114:	fff50513          	addi	a0,a0,-1
 118:	00458603          	lb	a2,4(a1) # 80000004 <_global+0x7fffe908>
 11c:	00267613          	andi	a2,a2,2
 120:	fe0608e3          	beqz	a2,110 <_uart_getchar_busy>
 124:	0055c503          	lbu	a0,5(a1)
 128:	00008067          	ret

0000012c <_uart_getchar_tout>:
 12c:	fff00513          	li	a0,-1
 130:	00008067          	ret

00000134 <_rle_banner>:
 134:	12c19797          	auipc	a5,0x12c19
 138:	c19c                	sw	a5,0(a1)
 13a:	074d                	addi	a4,a4,19
 13c:	c19a                	sw	t1,192(sp)
 13e:	0650                	addi	a2,sp,772
 140:	c198                	sw	a4,0(a1)
 142:	0452                	slli	s0,s0,0x14
 144:	c198                	sw	a4,0(a1)
 146:	0452                	slli	s0,s0,0x14
 148:	c198                	sw	a4,0(a1)
 14a:	0452                	slli	s0,s0,0x14
 14c:	c198                	sw	a4,0(a1)
 14e:	0650                	addi	a2,sp,772
 150:	0296                	slli	t0,t0,0x5
 152:	4dc1                	li	s11,16
 154:	c1049607          	0xc1049607
 158:	1042                	c.slli	zero,0x30
 15a:	0696                	slli	a3,a3,0x5
 15c:	42c1                	li	t0,16
 15e:	980c                	0x980c
 160:	4206                	lw	tp,64(sp)
 162:	44c1                	li	s1,16
 164:	9a06                	add	s4,s4,ra
 166:	4406                	lw	s0,64(sp)
 168:	46c1                	li	a3,16
 16a:	9606                	add	a2,a2,ra
 16c:	4606                	lw	a2,64(sp)
 16e:	48c1                	li	a7,16
 170:	9206                	add	tp,tp,ra
 172:	4806                	lw	a6,64(sp)
 174:	4ac1                	li	s5,16
 176:	8e06                	mv	t3,ra
 178:	4a06                	lw	s4,64(sp)
 17a:	4cc1                	li	s9,16
 17c:	8a06                	mv	s4,ra
 17e:	4c06                	lw	s8,64(sp)
 180:	4ec1                	li	t4,16
 182:	8606                	mv	a2,ra
 184:	4e06                	lw	t3,64(sp)
 186:	50c1                	li	ra,-16
 188:	8206                	mv	tp,ra
 18a:	5006                	0x5006
 18c:	52c1                	li	t0,-16
 18e:	520a                	lw	tp,160(sp)
 190:	54c1                	li	s1,-16
 192:	5406                	lw	s0,96(sp)
 194:	56c1                	li	a3,-16
 196:	5602                	lw	a2,32(sp)
 198:	07c2                	slli	a5,a5,0x10
	...

0000019b <_rle_dict>:
 19b:	7220                	flw	fs0,96(a2)
 19d:	0a76                	slli	s4,s4,0x1d

0000019f <_str_banner>:
 19f:	4e49                	li	t3,18
 1a1:	55525453          	0x55525453
 1a5:	4f495443          	fmadd.q	fs0,fs2,fs4,fs1,unknown
 1a9:	204e                	fld	ft0,208(sp)
 1ab:	53544553          	0x53544553
 1af:	5720                	lw	s0,104(a4)
 1b1:	4e41                	li	t3,16
 1b3:	2054                	fld	fa3,128(s0)
 1b5:	4f54                	lw	a3,28(a4)
 1b7:	4220                	lw	s0,64(a2)
 1b9:	2045                	jal	259 <main+0x59>
 1bb:	5246                	lw	tp,112(sp)
 1bd:	4545                	li	a0,17
 1bf:	0a0a                	slli	s4,s4,0x2
	...

00000200 <main>:
 200:	fc010113          	addi	sp,sp,-64
 204:	03312623          	sw	s3,44(sp)
 208:	00001997          	auipc	s3,0x1
 20c:	d089a983          	lw	s3,-760(s3) # f10 <_GLOBAL_OFFSET_TABLE_+0x10>
 210:	0009a783          	lw	a5,0(s3)
 214:	02112e23          	sw	ra,60(sp)
 218:	02812c23          	sw	s0,56(sp)
 21c:	02912a23          	sw	s1,52(sp)
 220:	03212823          	sw	s2,48(sp)
 224:	03412423          	sw	s4,40(sp)
 228:	0007c503          	lbu	a0,0(a5) # 12c19134 <_global+0x12c17a38>
 22c:	0ff57513          	andi	a0,a0,255
 230:	7f0000ef          	jal	ra,a20 <board_name>
 234:	0009a783          	lw	a5,0(s3)
 238:	00050593          	mv	a1,a0
 23c:	00001517          	auipc	a0,0x1
 240:	0007c603          	lbu	a2,0(a5)
 244:	99450513          	addi	a0,a0,-1644 # bd0 <_etext+0x4>
 248:	0ff67613          	andi	a2,a2,255
 24c:	5c0000ef          	jal	ra,80c <printf>
 250:	00001617          	auipc	a2,0x1
 254:	00001597          	auipc	a1,0x1
 258:	00001517          	auipc	a0,0x1
 25c:	99460613          	addi	a2,a2,-1644 # be4 <_etext+0x18>
 260:	99858593          	addi	a1,a1,-1640 # bec <_etext+0x20>
 264:	9b450513          	addi	a0,a0,-1612 # c0c <_etext+0x40>
 268:	5a4000ef          	jal	ra,80c <printf>
 26c:	0009a783          	lw	a5,0(s3)
 270:	00001517          	auipc	a0,0x1
 274:	9b050513          	addi	a0,a0,-1616 # c20 <_etext+0x54>
 278:	0027c583          	lbu	a1,2(a5)
 27c:	0ff5f593          	andi	a1,a1,255
 280:	58c000ef          	jal	ra,80c <printf>
 284:	0009a783          	lw	a5,0(s3)
 288:	00001517          	auipc	a0,0x1
 28c:	9a450513          	addi	a0,a0,-1628 # c2c <_etext+0x60>
 290:	0017c583          	lbu	a1,1(a5)
 294:	0ff5f593          	andi	a1,a1,255
 298:	00159593          	slli	a1,a1,0x1
 29c:	570000ef          	jal	ra,80c <printf>
 2a0:	0d5000ef          	jal	ra,b74 <check4rv32i>
 2a4:	00001597          	auipc	a1,0x1
 2a8:	92858593          	addi	a1,a1,-1752 # bcc <_etext>
 2ac:	00050663          	beqz	a0,2b8 <main+0xb8>
 2b0:	00001597          	auipc	a1,0x1
 2b4:	93858593          	addi	a1,a1,-1736 # be8 <_etext+0x1c>
 2b8:	00001517          	auipc	a0,0x1
 2bc:	98850513          	addi	a0,a0,-1656 # c40 <_etext+0x74>
 2c0:	54c000ef          	jal	ra,80c <printf>
 2c4:	01000613          	li	a2,16
 2c8:	01000593          	li	a1,16
 2cc:	3e800513          	li	a0,1000
 2d0:	09d000ef          	jal	ra,b6c <mac>
 2d4:	4e800793          	li	a5,1256
 2d8:	20f50c63          	beq	a0,a5,4f0 <main+0x2f0>
 2dc:	00001517          	auipc	a0,0x1
 2e0:	9e450513          	addi	a0,a0,-1564 # cc0 <_etext+0xf4>
 2e4:	528000ef          	jal	ra,80c <printf>
 2e8:	00001697          	auipc	a3,0x1
 2ec:	c346a683          	lw	a3,-972(a3) # f1c <_GLOBAL_OFFSET_TABLE_+0x1c>
 2f0:	00001417          	auipc	s0,0x1
 2f4:	c3042403          	lw	s0,-976(s0) # f20 <_GLOBAL_OFFSET_TABLE_+0x20>
 2f8:	00001597          	auipc	a1,0x1
 2fc:	c1c5a583          	lw	a1,-996(a1) # f14 <_GLOBAL_OFFSET_TABLE_+0x14>
 300:	00001497          	auipc	s1,0x1
 304:	c244a483          	lw	s1,-988(s1) # f24 <_GLOBAL_OFFSET_TABLE_+0x24>
 308:	00001517          	auipc	a0,0x1
 30c:	00001617          	auipc	a2,0x1
 310:	bfc62603          	lw	a2,-1028(a2) # f08 <_GLOBAL_OFFSET_TABLE_+0x8>
 314:	40d40733          	sub	a4,s0,a3
 318:	40b60633          	sub	a2,a2,a1
 31c:	00048793          	mv	a5,s1
 320:	94850513          	addi	a0,a0,-1720 # c50 <_etext+0x84>
 324:	4e8000ef          	jal	ra,80c <printf>
 328:	00001517          	auipc	a0,0x1
 32c:	408485b3          	sub	a1,s1,s0
 330:	95050513          	addi	a0,a0,-1712 # c78 <_etext+0xac>
 334:	4d8000ef          	jal	ra,80c <printf>
 338:	0009a783          	lw	a5,0(s3)
 33c:	00001517          	auipc	a0,0x1
 340:	95450513          	addi	a0,a0,-1708 # c90 <_etext+0xc4>
 344:	0067d583          	lhu	a1,6(a5)
 348:	deadc7b7          	lui	a5,0xdeadc
 34c:	eef78793          	addi	a5,a5,-273 # deadbeef <_global+0xdeada7f3>
 350:	01059593          	slli	a1,a1,0x10
 354:	0105d593          	srli	a1,a1,0x10
 358:	00f42023          	sw	a5,0(s0)
 35c:	4b0000ef          	jal	ra,80c <printf>
 360:	0009a703          	lw	a4,0(s3)
 364:	00001a17          	auipc	s4,0x1
 368:	ba0a2a03          	lw	s4,-1120(s4) # f04 <_GLOBAL_OFFSET_TABLE_+0x4>
 36c:	000f4937          	lui	s2,0xf4
 370:	00174783          	lbu	a5,1(a4)
 374:	00c72583          	lw	a1,12(a4)
 378:	00c72403          	lw	s0,12(a4)
 37c:	0ff7f793          	andi	a5,a5,255
 380:	00579713          	slli	a4,a5,0x5
 384:	40f70733          	sub	a4,a4,a5
 388:	00671513          	slli	a0,a4,0x6
 38c:	40e50533          	sub	a0,a0,a4
 390:	00351513          	slli	a0,a0,0x3
 394:	00f50533          	add	a0,a0,a5
 398:	00158593          	addi	a1,a1,1
 39c:	00751513          	slli	a0,a0,0x7
 3a0:	658000ef          	jal	ra,9f8 <__udivsi3>
 3a4:	00050593          	mv	a1,a0
 3a8:	00001517          	auipc	a0,0x1
 3ac:	00040613          	mv	a2,s0
 3b0:	90450513          	addi	a0,a0,-1788 # cac <_etext+0xe0>
 3b4:	458000ef          	jal	ra,80c <printf>
 3b8:	0009a783          	lw	a5,0(s3)
 3bc:	f8000713          	li	a4,-128
 3c0:	00001517          	auipc	a0,0x1
 3c4:	00e781a3          	sb	a4,3(a5)
 3c8:	90050513          	addi	a0,a0,-1792 # cc0 <_etext+0xf4>
 3cc:	000a2023          	sw	zero,0(s4)
 3d0:	43c000ef          	jal	ra,80c <printf>
 3d4:	00001517          	auipc	a0,0x1
 3d8:	8f050513          	addi	a0,a0,-1808 # cc4 <_etext+0xf8>
 3dc:	00010493          	mv	s1,sp
 3e0:	42c000ef          	jal	ra,80c <printf>
 3e4:	f8000413          	li	s0,-128
 3e8:	23f90913          	addi	s2,s2,575 # f423f <_global+0xf2b43>
 3ec:	00001517          	auipc	a0,0x1
 3f0:	8f050513          	addi	a0,a0,-1808 # cdc <_etext+0x110>
 3f4:	418000ef          	jal	ra,80c <printf>
 3f8:	02000613          	li	a2,32
 3fc:	00000593          	li	a1,0
 400:	00048513          	mv	a0,s1
 404:	5d4000ef          	jal	ra,9d8 <memset>
 408:	0009a703          	lw	a4,0(s3)
 40c:	0100006f          	j	41c <main+0x21c>
 410:	00474783          	lbu	a5,4(a4)
 414:	0027f793          	andi	a5,a5,2
 418:	04079663          	bnez	a5,464 <main+0x264>
 41c:	00374783          	lbu	a5,3(a4)
 420:	01879793          	slli	a5,a5,0x18
 424:	4187d793          	srai	a5,a5,0x18
 428:	fe07d4e3          	bgez	a5,410 <main+0x210>
 42c:	000a2783          	lw	a5,0(s4)
 430:	fff78693          	addi	a3,a5,-1
 434:	00da2023          	sw	a3,0(s4)
 438:	00079e63          	bnez	a5,454 <main+0x254>
 43c:	00875783          	lhu	a5,8(a4)
 440:	00178793          	addi	a5,a5,1
 444:	01079793          	slli	a5,a5,0x10
 448:	0107d793          	srli	a5,a5,0x10
 44c:	00f71423          	sh	a5,8(a4)
 450:	012a2023          	sw	s2,0(s4)
 454:	008701a3          	sb	s0,3(a4)
 458:	00474783          	lbu	a5,4(a4)
 45c:	0027f793          	andi	a5,a5,2
 460:	fa078ee3          	beqz	a5,41c <main+0x21c>
 464:	02000593          	li	a1,32
 468:	00048513          	mv	a0,s1
 46c:	0f8000ef          	jal	ra,564 <gets>
 470:	00001597          	auipc	a1,0x1
 474:	87058593          	addi	a1,a1,-1936 # ce0 <_etext+0x114>
 478:	00048513          	mv	a0,s1
 47c:	51c000ef          	jal	ra,998 <strcmp>
 480:	04050463          	beqz	a0,4c8 <main+0x2c8>
 484:	00001597          	auipc	a1,0x1
 488:	86c58593          	addi	a1,a1,-1940 # cf0 <_etext+0x124>
 48c:	00048513          	mv	a0,s1
 490:	508000ef          	jal	ra,998 <strcmp>
 494:	f4051ce3          	bnez	a0,3ec <main+0x1ec>
 498:	00001517          	auipc	a0,0x1
 49c:	86050513          	addi	a0,a0,-1952 # cf8 <_etext+0x12c>
 4a0:	36c000ef          	jal	ra,80c <printf>
 4a4:	03c12083          	lw	ra,60(sp)
 4a8:	03812403          	lw	s0,56(sp)
 4ac:	03412483          	lw	s1,52(sp)
 4b0:	03012903          	lw	s2,48(sp)
 4b4:	02c12983          	lw	s3,44(sp)
 4b8:	02812a03          	lw	s4,40(sp)
 4bc:	00000513          	li	a0,0
 4c0:	04010113          	addi	sp,sp,64
 4c4:	00008067          	ret
 4c8:	00001517          	auipc	a0,0x1
 4cc:	81c50513          	addi	a0,a0,-2020 # ce4 <_etext+0x118>
 4d0:	33c000ef          	jal	ra,80c <printf>
 4d4:	0009a703          	lw	a4,0(s3)
 4d8:	00875783          	lhu	a5,8(a4)
 4dc:	fff7c793          	not	a5,a5
 4e0:	01079793          	slli	a5,a5,0x10
 4e4:	0107d793          	srli	a5,a5,0x10
 4e8:	00f71423          	sh	a5,8(a4)
 4ec:	f01ff06f          	j	3ec <main+0x1ec>
 4f0:	00000517          	auipc	a0,0x0
 4f4:	75850513          	addi	a0,a0,1880 # c48 <_etext+0x7c>
 4f8:	314000ef          	jal	ra,80c <printf>
 4fc:	de1ff06f          	j	2dc <main+0xdc>

00000500 <__udiv_umod_si3.part.0>:
 500:	00050713          	mv	a4,a0
 504:	00100793          	li	a5,1
 508:	04a5f863          	bgeu	a1,a0,558 <__udiv_umod_si3.part.0+0x58>
 50c:	0005d663          	bgez	a1,518 <__udiv_umod_si3.part.0+0x18>
 510:	0480006f          	j	558 <__udiv_umod_si3.part.0+0x58>
 514:	0005c863          	bltz	a1,524 <__udiv_umod_si3.part.0+0x24>
 518:	00159593          	slli	a1,a1,0x1
 51c:	00179793          	slli	a5,a5,0x1
 520:	fee5eae3          	bltu	a1,a4,514 <__udiv_umod_si3.part.0+0x14>
 524:	02070c63          	beqz	a4,55c <__udiv_umod_si3.part.0+0x5c>
 528:	02078a63          	beqz	a5,55c <__udiv_umod_si3.part.0+0x5c>
 52c:	00000513          	li	a0,0
 530:	00b76663          	bltu	a4,a1,53c <__udiv_umod_si3.part.0+0x3c>
 534:	40b70733          	sub	a4,a4,a1
 538:	00f50533          	add	a0,a0,a5
 53c:	0017d793          	srli	a5,a5,0x1
 540:	0015d593          	srli	a1,a1,0x1
 544:	00070463          	beqz	a4,54c <__udiv_umod_si3.part.0+0x4c>
 548:	fe0794e3          	bnez	a5,530 <__udiv_umod_si3.part.0+0x30>
 54c:	00061463          	bnez	a2,554 <__udiv_umod_si3.part.0+0x54>
 550:	00070513          	mv	a0,a4
 554:	00008067          	ret
 558:	fc071ae3          	bnez	a4,52c <__udiv_umod_si3.part.0+0x2c>
 55c:	00000513          	li	a0,0
 560:	fedff06f          	j	54c <__udiv_umod_si3.part.0+0x4c>

00000564 <gets>:
 564:	00001317          	auipc	t1,0x1
 568:	9ac32303          	lw	t1,-1620(t1) # f10 <_GLOBAL_OFFSET_TABLE_+0x10>
 56c:	fff58593          	addi	a1,a1,-1
 570:	00032703          	lw	a4,0(t1)
 574:	00050613          	mv	a2,a0
 578:	04058a63          	beqz	a1,5cc <gets+0x68>
 57c:	00a00813          	li	a6,10
 580:	00d00893          	li	a7,13
 584:	00800e13          	li	t3,8
 588:	00474783          	lbu	a5,4(a4)
 58c:	0027f793          	andi	a5,a5,2
 590:	fe078ce3          	beqz	a5,588 <gets+0x24>
 594:	00574683          	lbu	a3,5(a4)
 598:	0ff6f693          	andi	a3,a3,255
 59c:	03068863          	beq	a3,a6,5cc <gets+0x68>
 5a0:	03168663          	beq	a3,a7,5cc <gets+0x68>
 5a4:	00474783          	lbu	a5,4(a4)
 5a8:	0017f793          	andi	a5,a5,1
 5ac:	fe079ce3          	bnez	a5,5a4 <gets+0x40>
 5b0:	00d702a3          	sb	a3,5(a4)
 5b4:	05c68c63          	beq	a3,t3,60c <gets+0xa8>
 5b8:	00d60023          	sb	a3,0(a2)
 5bc:	fff58593          	addi	a1,a1,-1
 5c0:	00032703          	lw	a4,0(t1)
 5c4:	00160613          	addi	a2,a2,1
 5c8:	fc0590e3          	bnez	a1,588 <gets+0x24>
 5cc:	00474783          	lbu	a5,4(a4)
 5d0:	0017f793          	andi	a5,a5,1
 5d4:	fe079ce3          	bnez	a5,5cc <gets+0x68>
 5d8:	00d00793          	li	a5,13
 5dc:	00f702a3          	sb	a5,5(a4)
 5e0:	00474783          	lbu	a5,4(a4)
 5e4:	0017f793          	andi	a5,a5,1
 5e8:	fe079ce3          	bnez	a5,5e0 <gets+0x7c>
 5ec:	40c507b3          	sub	a5,a0,a2
 5f0:	00a00693          	li	a3,10
 5f4:	00f037b3          	snez	a5,a5
 5f8:	00d702a3          	sb	a3,5(a4)
 5fc:	40f007b3          	neg	a5,a5
 600:	00060023          	sb	zero,0(a2)
 604:	00f57533          	and	a0,a0,a5
 608:	00008067          	ret
 60c:	00c50c63          	beq	a0,a2,624 <gets+0xc0>
 610:	fe060fa3          	sb	zero,-1(a2)
 614:	00032703          	lw	a4,0(t1)
 618:	fff60613          	addi	a2,a2,-1
 61c:	f60596e3          	bnez	a1,588 <gets+0x24>
 620:	fadff06f          	j	5cc <gets+0x68>
 624:	fff58593          	addi	a1,a1,-1
 628:	f60590e3          	bnez	a1,588 <gets+0x24>
 62c:	fa1ff06f          	j	5cc <gets+0x68>

00000630 <putstr>:
 630:	00000797          	auipc	a5,0x0
 634:	6d878793          	addi	a5,a5,1752 # d08 <_etext+0x13c>
 638:	00051463          	bnez	a0,640 <putstr+0x10>
 63c:	00078513          	mv	a0,a5
 640:	00054683          	lbu	a3,0(a0)
 644:	02068c63          	beqz	a3,67c <putstr+0x4c>
 648:	00001797          	auipc	a5,0x1
 64c:	8c87a783          	lw	a5,-1848(a5) # f10 <_GLOBAL_OFFSET_TABLE_+0x10>
 650:	0007a703          	lw	a4,0(a5)
 654:	00a00613          	li	a2,10
 658:	00d00593          	li	a1,13
 65c:	00150513          	addi	a0,a0,1
 660:	02c68063          	beq	a3,a2,680 <putstr+0x50>
 664:	00474783          	lbu	a5,4(a4)
 668:	0017f793          	andi	a5,a5,1
 66c:	fe079ce3          	bnez	a5,664 <putstr+0x34>
 670:	00d702a3          	sb	a3,5(a4)
 674:	00054683          	lbu	a3,0(a0)
 678:	fe0692e3          	bnez	a3,65c <putstr+0x2c>
 67c:	00008067          	ret
 680:	00474783          	lbu	a5,4(a4)
 684:	0017f793          	andi	a5,a5,1
 688:	fe079ce3          	bnez	a5,680 <putstr+0x50>
 68c:	00b702a3          	sb	a1,5(a4)
 690:	fd5ff06f          	j	664 <putstr+0x34>

00000694 <putnum>:
 694:	00000797          	auipc	a5,0x0
 698:	67c78793          	addi	a5,a5,1660 # d10 <_etext+0x144>
 69c:	00c7a703          	lw	a4,12(a5)
 6a0:	0007a803          	lw	a6,0(a5)
 6a4:	0047a603          	lw	a2,4(a5)
 6a8:	0087a683          	lw	a3,8(a5)
 6ac:	0107c783          	lbu	a5,16(a5)
 6b0:	fa010113          	addi	sp,sp,-96
 6b4:	04812c23          	sw	s0,88(sp)
 6b8:	04912a23          	sw	s1,84(sp)
 6bc:	05312623          	sw	s3,76(sp)
 6c0:	00e12c23          	sw	a4,24(sp)
 6c4:	00f10e23          	sb	a5,28(sp)
 6c8:	00001717          	auipc	a4,0x1
 6cc:	84872703          	lw	a4,-1976(a4) # f10 <_GLOBAL_OFFSET_TABLE_+0x10>
 6d0:	04112e23          	sw	ra,92(sp)
 6d4:	05212823          	sw	s2,80(sp)
 6d8:	05412423          	sw	s4,72(sp)
 6dc:	05512223          	sw	s5,68(sp)
 6e0:	01012623          	sw	a6,12(sp)
 6e4:	00c12823          	sw	a2,16(sp)
 6e8:	00d12a23          	sw	a3,20(sp)
 6ec:	00a00793          	li	a5,10
 6f0:	00072403          	lw	s0,0(a4)
 6f4:	00058993          	mv	s3,a1
 6f8:	00050493          	mv	s1,a0
 6fc:	0ef58863          	beq	a1,a5,7ec <putnum+0x158>
 700:	00000913          	li	s2,0
 704:	00a00a13          	li	s4,10
 708:	00098593          	mv	a1,s3
 70c:	00048513          	mv	a0,s1
 710:	2fc000ef          	jal	ra,a0c <__umodsi3>
 714:	04010793          	addi	a5,sp,64
 718:	00a78533          	add	a0,a5,a0
 71c:	fcc54703          	lbu	a4,-52(a0)
 720:	012787b3          	add	a5,a5,s2
 724:	00098593          	mv	a1,s3
 728:	fee78023          	sb	a4,-32(a5)
 72c:	00048513          	mv	a0,s1
 730:	2c8000ef          	jal	ra,9f8 <__udivsi3>
 734:	00190793          	addi	a5,s2,1
 738:	04010713          	addi	a4,sp,64
 73c:	00098593          	mv	a1,s3
 740:	00050493          	mv	s1,a0
 744:	00f70ab3          	add	s5,a4,a5
 748:	09498c63          	beq	s3,s4,7e0 <putnum+0x14c>
 74c:	2c0000ef          	jal	ra,a0c <__umodsi3>
 750:	04010793          	addi	a5,sp,64
 754:	00a78533          	add	a0,a5,a0
 758:	fcc54783          	lbu	a5,-52(a0)
 75c:	00098593          	mv	a1,s3
 760:	00048513          	mv	a0,s1
 764:	fefa8023          	sb	a5,-32(s5)
 768:	290000ef          	jal	ra,9f8 <__udivsi3>
 76c:	00050493          	mv	s1,a0
 770:	00290913          	addi	s2,s2,2
 774:	f8049ae3          	bnez	s1,708 <putnum+0x74>
 778:	02010693          	addi	a3,sp,32
 77c:	01268933          	add	s2,a3,s2
 780:	00a00613          	li	a2,10
 784:	00d00593          	li	a1,13
 788:	fff94703          	lbu	a4,-1(s2)
 78c:	04c70063          	beq	a4,a2,7cc <putnum+0x138>
 790:	00444783          	lbu	a5,4(s0)
 794:	0017f793          	andi	a5,a5,1
 798:	fe079ce3          	bnez	a5,790 <putnum+0xfc>
 79c:	00e402a3          	sb	a4,5(s0)
 7a0:	fff90913          	addi	s2,s2,-1
 7a4:	ff2692e3          	bne	a3,s2,788 <putnum+0xf4>
 7a8:	05c12083          	lw	ra,92(sp)
 7ac:	05812403          	lw	s0,88(sp)
 7b0:	05412483          	lw	s1,84(sp)
 7b4:	05012903          	lw	s2,80(sp)
 7b8:	04c12983          	lw	s3,76(sp)
 7bc:	04812a03          	lw	s4,72(sp)
 7c0:	04412a83          	lw	s5,68(sp)
 7c4:	06010113          	addi	sp,sp,96
 7c8:	00008067          	ret
 7cc:	00444783          	lbu	a5,4(s0)
 7d0:	0017f793          	andi	a5,a5,1
 7d4:	fe079ce3          	bnez	a5,7cc <putnum+0x138>
 7d8:	00b402a3          	sb	a1,5(s0)
 7dc:	fb5ff06f          	j	790 <putnum+0xfc>
 7e0:	00078913          	mv	s2,a5
 7e4:	f20492e3          	bnez	s1,708 <putnum+0x74>
 7e8:	f91ff06f          	j	778 <putnum+0xe4>
 7ec:	f0055ae3          	bgez	a0,700 <putnum+0x6c>
 7f0:	00444783          	lbu	a5,4(s0)
 7f4:	0017f793          	andi	a5,a5,1
 7f8:	fe079ce3          	bnez	a5,7f0 <putnum+0x15c>
 7fc:	02d00793          	li	a5,45
 800:	00f402a3          	sb	a5,5(s0)
 804:	409004b3          	neg	s1,s1
 808:	ef9ff06f          	j	700 <putnum+0x6c>

0000080c <printf>:
 80c:	fa010113          	addi	sp,sp,-96
 810:	04f12a23          	sw	a5,84(sp)
 814:	02112e23          	sw	ra,60(sp)
 818:	02812c23          	sw	s0,56(sp)
 81c:	02912a23          	sw	s1,52(sp)
 820:	03212823          	sw	s2,48(sp)
 824:	03312623          	sw	s3,44(sp)
 828:	03412423          	sw	s4,40(sp)
 82c:	03512223          	sw	s5,36(sp)
 830:	03612023          	sw	s6,32(sp)
 834:	01712e23          	sw	s7,28(sp)
 838:	01812c23          	sw	s8,24(sp)
 83c:	04b12223          	sw	a1,68(sp)
 840:	04c12423          	sw	a2,72(sp)
 844:	04d12623          	sw	a3,76(sp)
 848:	04e12823          	sw	a4,80(sp)
 84c:	05012c23          	sw	a6,88(sp)
 850:	05112e23          	sw	a7,92(sp)
 854:	00054683          	lbu	a3,0(a0)
 858:	04410793          	addi	a5,sp,68
 85c:	00f12623          	sw	a5,12(sp)
 860:	06068263          	beqz	a3,8c4 <printf+0xb8>
 864:	00050a13          	mv	s4,a0
 868:	02500b13          	li	s6,37
 86c:	00000c17          	auipc	s8,0x0
 870:	6a4c2c03          	lw	s8,1700(s8) # f10 <_GLOBAL_OFFSET_TABLE_+0x10>
 874:	00a00b93          	li	s7,10
 878:	00d00993          	li	s3,13
 87c:	07300413          	li	s0,115
 880:	07800493          	li	s1,120
 884:	06400913          	li	s2,100
 888:	001a0a93          	addi	s5,s4,1
 88c:	09669063          	bne	a3,s6,90c <printf+0x100>
 890:	001a4683          	lbu	a3,1(s4)
 894:	002a0a13          	addi	s4,s4,2
 898:	0c868663          	beq	a3,s0,964 <printf+0x158>
 89c:	0e968063          	beq	a3,s1,97c <printf+0x170>
 8a0:	0b268463          	beq	a3,s2,948 <printf+0x13c>
 8a4:	000c2703          	lw	a4,0(s8)
 8a8:	05768863          	beq	a3,s7,8f8 <printf+0xec>
 8ac:	00474783          	lbu	a5,4(a4)
 8b0:	0017f793          	andi	a5,a5,1
 8b4:	fe079ce3          	bnez	a5,8ac <printf+0xa0>
 8b8:	00d702a3          	sb	a3,5(a4)
 8bc:	001ac683          	lbu	a3,1(s5)
 8c0:	fc0694e3          	bnez	a3,888 <printf+0x7c>
 8c4:	03c12083          	lw	ra,60(sp)
 8c8:	03812403          	lw	s0,56(sp)
 8cc:	03412483          	lw	s1,52(sp)
 8d0:	03012903          	lw	s2,48(sp)
 8d4:	02c12983          	lw	s3,44(sp)
 8d8:	02812a03          	lw	s4,40(sp)
 8dc:	02412a83          	lw	s5,36(sp)
 8e0:	02012b03          	lw	s6,32(sp)
 8e4:	01c12b83          	lw	s7,28(sp)
 8e8:	01812c03          	lw	s8,24(sp)
 8ec:	00000513          	li	a0,0
 8f0:	06010113          	addi	sp,sp,96
 8f4:	00008067          	ret
 8f8:	00474783          	lbu	a5,4(a4)
 8fc:	0017f793          	andi	a5,a5,1
 900:	fe079ce3          	bnez	a5,8f8 <printf+0xec>
 904:	013702a3          	sb	s3,5(a4)
 908:	fa5ff06f          	j	8ac <printf+0xa0>
 90c:	000c2703          	lw	a4,0(s8)
 910:	03768263          	beq	a3,s7,934 <printf+0x128>
 914:	00474783          	lbu	a5,4(a4)
 918:	0017f793          	andi	a5,a5,1
 91c:	fe079ce3          	bnez	a5,914 <printf+0x108>
 920:	000a8793          	mv	a5,s5
 924:	00d702a3          	sb	a3,5(a4)
 928:	000a0a93          	mv	s5,s4
 92c:	00078a13          	mv	s4,a5
 930:	f8dff06f          	j	8bc <printf+0xb0>
 934:	00474783          	lbu	a5,4(a4)
 938:	0017f793          	andi	a5,a5,1
 93c:	fe079ce3          	bnez	a5,934 <printf+0x128>
 940:	013702a3          	sb	s3,5(a4)
 944:	fd1ff06f          	j	914 <printf+0x108>
 948:	00c12783          	lw	a5,12(sp)
 94c:	00a00593          	li	a1,10
 950:	0007a503          	lw	a0,0(a5)
 954:	00478793          	addi	a5,a5,4
 958:	00f12623          	sw	a5,12(sp)
 95c:	d39ff0ef          	jal	ra,694 <putnum>
 960:	f5dff06f          	j	8bc <printf+0xb0>
 964:	00c12783          	lw	a5,12(sp)
 968:	0007a503          	lw	a0,0(a5)
 96c:	00478793          	addi	a5,a5,4
 970:	00f12623          	sw	a5,12(sp)
 974:	cbdff0ef          	jal	ra,630 <putstr>
 978:	f45ff06f          	j	8bc <printf+0xb0>
 97c:	00c12783          	lw	a5,12(sp)
 980:	01000593          	li	a1,16
 984:	0007a503          	lw	a0,0(a5)
 988:	00478793          	addi	a5,a5,4
 98c:	00f12623          	sw	a5,12(sp)
 990:	d05ff0ef          	jal	ra,694 <putnum>
 994:	f29ff06f          	j	8bc <printf+0xb0>

00000998 <strcmp>:
 998:	00054783          	lbu	a5,0(a0)
 99c:	0005c703          	lbu	a4,0(a1)
 9a0:	00079c63          	bnez	a5,9b8 <strcmp+0x20>
 9a4:	0200006f          	j	9c4 <strcmp+0x2c>
 9a8:	00e79e63          	bne	a5,a4,9c4 <strcmp+0x2c>
 9ac:	00054783          	lbu	a5,0(a0)
 9b0:	0005c703          	lbu	a4,0(a1)
 9b4:	00078c63          	beqz	a5,9cc <strcmp+0x34>
 9b8:	00150513          	addi	a0,a0,1
 9bc:	00158593          	addi	a1,a1,1
 9c0:	fe0714e3          	bnez	a4,9a8 <strcmp+0x10>
 9c4:	40e78533          	sub	a0,a5,a4
 9c8:	00008067          	ret
 9cc:	00000793          	li	a5,0
 9d0:	40e78533          	sub	a0,a5,a4
 9d4:	00008067          	ret

000009d8 <memset>:
 9d8:	0ff5f593          	andi	a1,a1,255
 9dc:	00c50733          	add	a4,a0,a2
 9e0:	00050793          	mv	a5,a0
 9e4:	00060863          	beqz	a2,9f4 <memset+0x1c>
 9e8:	00178793          	addi	a5,a5,1
 9ec:	feb78fa3          	sb	a1,-1(a5)
 9f0:	fef71ce3          	bne	a4,a5,9e8 <memset+0x10>
 9f4:	00008067          	ret

000009f8 <__udivsi3>:
 9f8:	00058663          	beqz	a1,a04 <__udivsi3+0xc>
 9fc:	00100613          	li	a2,1
 a00:	b01ff06f          	j	500 <__udiv_umod_si3.part.0>
 a04:	00000513          	li	a0,0
 a08:	00008067          	ret

00000a0c <__umodsi3>:
 a0c:	00058663          	beqz	a1,a18 <__umodsi3+0xc>
 a10:	00000613          	li	a2,0
 a14:	aedff06f          	j	500 <__udiv_umod_si3.part.0>
 a18:	00000513          	li	a0,0
 a1c:	00008067          	ret

00000a20 <board_name>:
 a20:	00050793          	mv	a5,a0
 a24:	12050263          	beqz	a0,b48 <board_name+0x128>
 a28:	00000517          	auipc	a0,0x0
 a2c:	00100713          	li	a4,1
 a30:	33850513          	addi	a0,a0,824 # d60 <_etext+0x194>
 a34:	10e78863          	beq	a5,a4,b44 <board_name+0x124>
 a38:	00000517          	auipc	a0,0x0
 a3c:	00200713          	li	a4,2
 a40:	34050513          	addi	a0,a0,832 # d78 <_etext+0x1ac>
 a44:	10e78063          	beq	a5,a4,b44 <board_name+0x124>
 a48:	00000517          	auipc	a0,0x0
 a4c:	00300713          	li	a4,3
 a50:	34450513          	addi	a0,a0,836 # d8c <_etext+0x1c0>
 a54:	0ee78863          	beq	a5,a4,b44 <board_name+0x124>
 a58:	00000517          	auipc	a0,0x0
 a5c:	00400713          	li	a4,4
 a60:	34850513          	addi	a0,a0,840 # da0 <_etext+0x1d4>
 a64:	0ee78063          	beq	a5,a4,b44 <board_name+0x124>
 a68:	00000517          	auipc	a0,0x0
 a6c:	00500713          	li	a4,5
 a70:	34c50513          	addi	a0,a0,844 # db4 <_etext+0x1e8>
 a74:	0ce78863          	beq	a5,a4,b44 <board_name+0x124>
 a78:	00000517          	auipc	a0,0x0
 a7c:	00600713          	li	a4,6
 a80:	35450513          	addi	a0,a0,852 # dcc <_etext+0x200>
 a84:	0ce78063          	beq	a5,a4,b44 <board_name+0x124>
 a88:	00000517          	auipc	a0,0x0
 a8c:	00700713          	li	a4,7
 a90:	35850513          	addi	a0,a0,856 # de0 <_etext+0x214>
 a94:	0ae78863          	beq	a5,a4,b44 <board_name+0x124>
 a98:	00000517          	auipc	a0,0x0
 a9c:	00800713          	li	a4,8
 aa0:	36050513          	addi	a0,a0,864 # df8 <_etext+0x22c>
 aa4:	0ae78063          	beq	a5,a4,b44 <board_name+0x124>
 aa8:	00000517          	auipc	a0,0x0
 aac:	00900713          	li	a4,9
 ab0:	36c50513          	addi	a0,a0,876 # e14 <_etext+0x248>
 ab4:	08e78863          	beq	a5,a4,b44 <board_name+0x124>
 ab8:	00000517          	auipc	a0,0x0
 abc:	00a00713          	li	a4,10
 ac0:	37050513          	addi	a0,a0,880 # e28 <_etext+0x25c>
 ac4:	08e78063          	beq	a5,a4,b44 <board_name+0x124>
 ac8:	00000517          	auipc	a0,0x0
 acc:	00b00713          	li	a4,11
 ad0:	37c50513          	addi	a0,a0,892 # e44 <_etext+0x278>
 ad4:	06e78863          	beq	a5,a4,b44 <board_name+0x124>
 ad8:	00000517          	auipc	a0,0x0
 adc:	00c00713          	li	a4,12
 ae0:	38450513          	addi	a0,a0,900 # e5c <_etext+0x290>
 ae4:	06e78063          	beq	a5,a4,b44 <board_name+0x124>
 ae8:	00000517          	auipc	a0,0x0
 aec:	00d00713          	li	a4,13
 af0:	38c50513          	addi	a0,a0,908 # e74 <_etext+0x2a8>
 af4:	04e78863          	beq	a5,a4,b44 <board_name+0x124>
 af8:	00000517          	auipc	a0,0x0
 afc:	00e00713          	li	a4,14
 b00:	39c50513          	addi	a0,a0,924 # e94 <_etext+0x2c8>
 b04:	04e78063          	beq	a5,a4,b44 <board_name+0x124>
 b08:	00000517          	auipc	a0,0x0
 b0c:	00f00713          	li	a4,15
 b10:	3ac50513          	addi	a0,a0,940 # eb4 <_etext+0x2e8>
 b14:	02e78863          	beq	a5,a4,b44 <board_name+0x124>
 b18:	01000713          	li	a4,16
 b1c:	02e78c63          	beq	a5,a4,b54 <board_name+0x134>
 b20:	01100713          	li	a4,17
 b24:	02e78e63          	beq	a5,a4,b60 <board_name+0x140>
 b28:	01200713          	li	a4,18
 b2c:	00e78863          	beq	a5,a4,b3c <board_name+0x11c>
 b30:	00000517          	auipc	a0,0x0
 b34:	3c050513          	addi	a0,a0,960 # ef0 <_etext+0x324>
 b38:	00008067          	ret
 b3c:	00000517          	auipc	a0,0x0
 b40:	1e850513          	addi	a0,a0,488 # d24 <_etext+0x158>
 b44:	00008067          	ret
 b48:	00000517          	auipc	a0,0x0
 b4c:	20850513          	addi	a0,a0,520 # d50 <_etext+0x184>
 b50:	00008067          	ret
 b54:	00000517          	auipc	a0,0x0
 b58:	1e450513          	addi	a0,a0,484 # d38 <_etext+0x16c>
 b5c:	00008067          	ret
 b60:	00000517          	auipc	a0,0x0
 b64:	37450513          	addi	a0,a0,884 # ed4 <_etext+0x308>
 b68:	00008067          	ret

00000b6c <mac>:
 b6c:	00c5850b          	0xc5850b
 b70:	00008067          	ret

00000b74 <check4rv32i>:
 b74:	00000793          	li	a5,0
 b78:	00100f93          	li	t6,1
 b7c:	40ff8533          	sub	a0,t6,a5
 b80:	00008067          	ret

00000b84 <get_mtvec>:
 b84:	00000513          	li	a0,0
 b88:	30502573          	csrr	a0,mtvec
 b8c:	00008067          	ret

00000b90 <get_mepc>:
 b90:	00000513          	li	a0,0
 b94:	34102573          	csrr	a0,mepc
 b98:	00008067          	ret

00000b9c <get_mie>:
 b9c:	00000513          	li	a0,0
 ba0:	30402573          	csrr	a0,mie
 ba4:	00008067          	ret

00000ba8 <get_mip>:
 ba8:	00000513          	li	a0,0
 bac:	34402573          	csrr	a0,mip
 bb0:	00008067          	ret

00000bb4 <set_mtvec>:
 bb4:	30551073          	csrw	mtvec,a0
 bb8:	00008067          	ret

00000bbc <set_mepc>:
 bbc:	34151073          	csrw	mepc,a0
 bc0:	00008067          	ret

00000bc4 <set_mie>:
 bc4:	30451073          	csrw	mie,a0
 bc8:	00008067          	ret

Disassembly of section .data:

00000bcc <_data>:
 bcc:	0065                	c.nop	25
 bce:	0000                	unimp
 bd0:	6f62                	flw	ft10,24(sp)
 bd2:	7261                	lui	tp,0xffff8
 bd4:	3a64                	fld	fs1,240(a2)
 bd6:	2520                	fld	fs0,72(a0)
 bd8:	69282073          	csrs	0x692,a6
 bdc:	3d64                	fld	fs1,248(a0)
 bde:	6425                	lui	s0,0x9
 be0:	0a29                	addi	s4,s4,10
 be2:	0000                	unimp
 be4:	7672                	flw	fa2,60(sp)
 be6:	00693233          	sltu	tp,s2,t1
 bea:	0000                	unimp
 bec:	2c746153          	0x2c746153
 bf0:	3220                	fld	fs0,96(a2)
 bf2:	2038                	fld	fa4,64(s0)
 bf4:	20706553          	0x20706553
 bf8:	3032                	fld	ft0,296(sp)
 bfa:	3432                	fld	fs0,296(sp)
 bfc:	3220                	fld	fs0,96(a2)
 bfe:	3a31                	jal	51a <__udiv_umod_si3.part.0+0x1a>
 c00:	3235                	jal	52c <__udiv_umod_si3.part.0+0x2c>
 c02:	343a                	fld	fs0,424(sp)
 c04:	2030                	fld	fa2,64(s0)
 c06:	3037302b          	0x3037302b
 c0a:	0030                	addi	a2,sp,8
 c0c:	7562                	flw	fa0,56(sp)
 c0e:	6c69                	lui	s8,0x1a
 c10:	3a64                	fld	fs1,240(a2)
 c12:	2520                	fld	fs0,72(a0)
 c14:	6f662073          	csrs	0x6f6,a2
 c18:	2072                	fld	ft0,280(sp)
 c1a:	7325                	lui	t1,0xfffe9
 c1c:	000a                	c.slli	zero,0x2
 c1e:	0000                	unimp
 c20:	65726f63          	bltu	tp,s7,127e <_stack+0x27e>
 c24:	6425                	lui	s0,0x9
 c26:	203a                	fld	ft0,392(sp)
 c28:	0000                	unimp
 c2a:	0000                	unimp
 c2c:	6164                	flw	fs1,68(a0)
 c2e:	6b72                	flw	fs6,28(sp)
 c30:	6972                	flw	fs2,28(sp)
 c32:	40766373          	csrrsi	t1,0x407,12
 c36:	6425                	lui	s0,0x9
 c38:	484d                	li	a6,19
 c3a:	207a                	fld	ft0,408(sp)
 c3c:	00202f77          	0x202f77
 c40:	7672                	flw	fa2,60(sp)
 c42:	73253233          	0x73253233
 c46:	0020                	addi	s0,sp,8
 c48:	414d                	li	sp,19
 c4a:	00002043          	fmadd.s	ft0,ft0,ft0,ft0,rdn
 c4e:	0000                	unimp
 c50:	7262                	flw	ft4,56(sp)
 c52:	6d61                	lui	s10,0x18
 c54:	3a30                	fld	fa2,112(a2)
 c56:	7420                	flw	fs0,104(s0)
 c58:	7865                	lui	a6,0xffff9
 c5a:	4074                	lw	a3,68(s0)
 c5c:	6425                	lui	s0,0x9
 c5e:	2064252b          	0x2064252b
 c62:	6164                	flw	fs1,68(a0)
 c64:	6174                	flw	fa3,68(a0)
 c66:	2540                	fld	fs0,136(a0)
 c68:	2b64                	fld	fs1,208(a4)
 c6a:	6425                	lui	s0,0x9
 c6c:	7320                	flw	fs0,96(a4)
 c6e:	6174                	flw	fa3,68(a0)
 c70:	25406b63          	bltu	zero,s4,ec6 <_data+0x2fa>
 c74:	0a64                	addi	s1,sp,284
 c76:	0000                	unimp
 c78:	7262                	flw	ft4,56(sp)
 c7a:	6d61                	lui	s10,0x18
 c7c:	3a30                	fld	fa2,112(a2)
 c7e:	2520                	fld	fs0,72(a0)
 c80:	2064                	fld	fs1,192(s0)
 c82:	7962                	flw	fs2,56(sp)
 c84:	6574                	flw	fa3,76(a0)
 c86:	72662073          	csrs	0x726,a2
 c8a:	6565                	lui	a0,0x19
 c8c:	000a                	c.slli	zero,0x2
 c8e:	0000                	unimp
 c90:	6175                	addi	sp,sp,368
 c92:	7472                	flw	fs0,60(sp)
 c94:	3a30                	fld	fa2,112(a2)
 c96:	3120                	fld	fs0,96(a0)
 c98:	3531                	jal	aa4 <board_name+0x84>
 c9a:	322e                	fld	ft4,232(sp)
 c9c:	7370626b          	0x7370626b
 ca0:	2820                	fld	fs0,80(s0)
 ca2:	6964                	flw	fs1,84(a0)
 ca4:	3d76                	fld	fs10,376(sp)
 ca6:	6425                	lui	s0,0x9
 ca8:	0a29                	addi	s4,s4,10
 caa:	0000                	unimp
 cac:	6974                	flw	fa3,84(a0)
 cae:	726d                	lui	tp,0xffffb
 cb0:	3a30                	fld	fa2,112(a2)
 cb2:	2520                	fld	fs0,72(a0)
 cb4:	4864                	lw	s1,84(s0)
 cb6:	207a                	fld	ft0,408(sp)
 cb8:	6428                	flw	fa0,72(s0)
 cba:	7669                	lui	a2,0xffffa
 cbc:	253d                	jal	12ea <_stack+0x2ea>
 cbe:	2964                	fld	fs1,208(a0)
 cc0:	000a                	c.slli	zero,0x2
 cc2:	0000                	unimp
 cc4:	636c6557          	0x636c6557
 cc8:	20656d6f          	jal	s10,56ece <_global+0x557d2>
 ccc:	6f74                	flw	fa3,92(a4)
 cce:	4420                	lw	s0,72(s0)
 cd0:	7261                	lui	tp,0xffff8
 cd2:	5349526b          	0x5349526b
 cd6:	0a215643          	fmadd.d	fa2,ft2,ft2,ft1,unknown
 cda:	0000                	unimp
 cdc:	203e                	fld	ft0,456(sp)
 cde:	0000                	unimp
 ce0:	656c                	flw	fa1,76(a0)
 ce2:	0064                	addi	s1,sp,12
 ce4:	656c                	flw	fa1,76(a0)
 ce6:	2064                	fld	fs1,192(s0)
 ce8:	6c66                	flw	fs8,88(sp)
 cea:	7069                	c.lui	zero,0xffffa
 cec:	0a21                	addi	s4,s4,8
 cee:	0000                	unimp
 cf0:	6572                	flw	fa0,28(sp)
 cf2:	6f62                	flw	ft10,24(sp)
 cf4:	0000746f          	jal	s0,7cf4 <_global+0x65f8>
 cf8:	6572                	flw	fa0,28(sp)
 cfa:	6f62                	flw	ft10,24(sp)
 cfc:	6e69746f          	jal	s0,983e2 <_global+0x96ce6>
 d00:	2e2e2e67          	0x2e2e2e67
 d04:	000a                	c.slli	zero,0x2
 d06:	0000                	unimp
 d08:	4e28                	lw	a0,88(a2)
 d0a:	4c55                	li	s8,21
 d0c:	294c                	fld	fa1,144(a0)
 d0e:	0000                	unimp
 d10:	3130                	fld	fa2,96(a0)
 d12:	3332                	fld	ft6,296(sp)
 d14:	3534                	fld	fa3,104(a0)
 d16:	3736                	fld	fa4,360(sp)
 d18:	3938                	fld	fa4,112(a0)
 d1a:	6261                	lui	tp,0x18
 d1c:	66656463          	bltu	a0,t1,1384 <_stack+0x384>
 d20:	0000                	unimp
 d22:	0000                	unimp
 d24:	6970                	flw	fa2,84(a0)
 d26:	726f7773          	csrrci	a4,0x726,30
 d2a:	7364                	flw	fs1,100(a4)
 d2c:	6320                	flw	fs0,64(a4)
 d2e:	3368                	fld	fa0,224(a4)
 d30:	7834                	flw	fa3,112(s0)
 d32:	6c20                	flw	fs0,88(s0)
 d34:	3178                	fld	fa4,224(a0)
 d36:	0036                	c.slli	zero,0xd
 d38:	616c                	flw	fa1,68(a0)
 d3a:	7474                	flw	fa3,108(s0)
 d3c:	6369                	lui	t1,0x1a
 d3e:	2065                	jal	de6 <_data+0x21a>
 d40:	6365                	lui	t1,0x19
 d42:	3570                	fld	fa2,232(a0)
 d44:	382d                	jal	57e <gets+0x1a>
 d46:	4635                	li	a2,13
 d48:	7520                	flw	fs0,104(a0)
 d4a:	786c                	flw	fa1,116(s0)
 d4c:	00007333          	and	t1,zero,zero
 d50:	756d6973          	csrrsi	s2,0x756,26
 d54:	616c                	flw	fa1,68(a0)
 d56:	6974                	flw	fa3,84(a0)
 d58:	6f206e6f          	jal	t3,744a <_global+0x5d4e>
 d5c:	6c6e                	flw	fs8,216(sp)
 d5e:	0079                	c.nop	30
 d60:	7661                	lui	a2,0xffff8
 d62:	656e                	flw	fa0,216(sp)
 d64:	2074                	fld	fa3,192(s0)
 d66:	696d                	lui	s2,0x1b
 d68:	626f7263          	bgeu	t5,t1,138c <_stack+0x38c>
 d6c:	6472616f          	jal	sp,27bb2 <_global+0x264b6>
 d70:	6c20                	flw	fs0,88(s0)
 d72:	3978                	fld	fa4,240(a0)
 d74:	0000                	unimp
 d76:	0000                	unimp
 d78:	6978                	flw	fa4,84(a0)
 d7a:	696c                	flw	fa1,84(a0)
 d7c:	786e                	flw	fa6,248(sp)
 d7e:	6120                	flw	fs0,64(a0)
 d80:	31303763          	0x31303763
 d84:	6120                	flw	fs0,64(a0)
 d86:	3032                	fld	ft0,296(sp)
 d88:	0030                	addi	a2,sp,8
 d8a:	0000                	unimp
 d8c:	6d71                	lui	s10,0x1c
 d8e:	6574                	flw	fa3,76(a0)
 d90:	73206863          	bltu	zero,s2,14c0 <_stack+0x4c0>
 d94:	7264                	flw	fs1,100(a2)
 d96:	6d61                	lui	s10,0x18
 d98:	6c20                	flw	fs0,88(s0)
 d9a:	3178                	fld	fa4,224(a0)
 d9c:	0036                	c.slli	zero,0xd
 d9e:	0000                	unimp
 da0:	6d71                	lui	s10,0x1c
 da2:	6574                	flw	fa3,76(a0)
 da4:	73206863          	bltu	zero,s2,14d4 <_stack+0x4d4>
 da8:	6170                	flw	fa2,68(a0)
 daa:	7472                	flw	fs0,60(sp)
 dac:	6e61                	lui	t3,0x18
 dae:	31732037          	lui	zero,0x31732
 db2:	0035                	c.nop	13
 db4:	616c                	flw	fa1,68(a0)
 db6:	7474                	flw	fa3,108(s0)
 db8:	6369                	lui	t1,0x1a
 dba:	2065                	jal	e62 <_data+0x296>
 dbc:	7262                	flw	ft4,56(sp)
 dbe:	7665                	lui	a2,0xffff9
 dc0:	6169                	addi	sp,sp,208
 dc2:	2032                	fld	ft0,264(sp)
 dc4:	786c                	flw	fa1,116(s0)
 dc6:	3270                	fld	fa2,224(a2)
 dc8:	0000                	unimp
 dca:	0000                	unimp
 dcc:	6970                	flw	fa2,84(a0)
 dce:	726f7773          	csrrci	a4,0x726,30
 dd2:	7364                	flw	fs1,100(a4)
 dd4:	7220                	flw	fs0,96(a2)
 dd6:	35383473          	csrrc	s0,0x353,a6
 dda:	6c20                	flw	fs0,88(s0)
 ddc:	3978                	fld	fa4,240(a0)
 dde:	0000                	unimp
 de0:	6964                	flw	fs1,84(a0)
 de2:	656c6967          	0x656c6967
 de6:	746e                	flw	fs0,248(sp)
 de8:	7320                	flw	fs0,96(a4)
 dea:	6170                	flw	fa2,68(a0)
 dec:	7472                	flw	fs0,60(sp)
 dee:	6e61                	lui	t3,0x18
 df0:	32732033          	0x32732033
 df4:	3030                	fld	fa2,96(s0)
 df6:	0000                	unimp
 df8:	6c61                	lui	s8,0x18
 dfa:	6569                	lui	a0,0x1a
 dfc:	7078                	flw	fa4,100(s0)
 dfe:	6572                	flw	fa0,28(sp)
 e00:	68207373          	csrrci	t1,0x682,0
 e04:	6370                	flw	fa2,68(a4)
 e06:	6730342f          	0x6730342f
 e0a:	6562                	flw	fa0,24(sp)
 e0c:	6b20                	flw	fs0,80(a4)
 e0e:	3234                	fld	fa3,96(a2)
 e10:	0030                	addi	a2,sp,8
 e12:	0000                	unimp
 e14:	6d71                	lui	s10,0x1c
 e16:	6574                	flw	fa3,76(a0)
 e18:	61206863          	bltu	zero,s2,1428 <_stack+0x428>
 e1c:	7472                	flw	fs0,60(sp)
 e1e:	7869                	lui	a6,0xffffa
 e20:	33612037          	lui	zero,0x33612
 e24:	0035                	c.nop	13
 e26:	0000                	unimp
 e28:	6c61                	lui	s8,0x18
 e2a:	6569                	lui	a0,0x1a
 e2c:	7078                	flw	fa4,100(s0)
 e2e:	6572                	flw	fa0,28(sp)
 e30:	68207373          	csrrci	t1,0x682,0
 e34:	6370                	flw	fa2,68(a4)
 e36:	6730342f          	0x6730342f
 e3a:	6562                	flw	fa0,24(sp)
 e3c:	6b20                	flw	fs0,80(a4)
 e3e:	3075                	jal	6ea <putnum+0x56>
 e40:	3034                	fld	fa3,96(s0)
 e42:	0000                	unimp
 e44:	6170                	flw	fa2,68(a0)
 e46:	6970                	flw	fa2,84(a0)
 e48:	696c                	flw	fa1,84(a0)
 e4a:	7564206f          	j	435a0 <_global+0x41ea4>
 e4e:	6f6c206f          	j	c3544 <_global+0xc1e48>
 e52:	73636967          	0x73636967
 e56:	6174                	flw	fa3,68(a0)
 e58:	7472                	flw	fs0,60(sp)
 e5a:	0000                	unimp
 e5c:	6d71                	lui	s10,0x1c
 e5e:	6574                	flw	fa3,76(a0)
 e60:	6b206863          	bltu	zero,s2,1510 <_stack+0x510>
 e64:	6e69                	lui	t3,0x1a
 e66:	6574                	flw	fa3,76(a0)
 e68:	2d78                	fld	fa4,216(a0)
 e6a:	336b2037          	lui	zero,0x336b2
 e6e:	3532                	fld	fa0,296(sp)
 e70:	0000                	unimp
 e72:	0000                	unimp
 e74:	72616373          	csrrsi	t1,0x726,2
 e78:	6261                	lui	tp,0x18
 e7a:	6d20                	flw	fs0,88(a0)
 e7c:	6e69                	lui	t3,0x1a
 e7e:	7369                	lui	t1,0xffffa
 e80:	6170                	flw	fa2,68(a0)
 e82:	7472                	flw	fs0,60(sp)
 e84:	6e61                	lui	t3,0x18
 e86:	2d36                	fld	fs10,328(sp)
 e88:	6c70                	flw	fa2,92(s0)
 e8a:	7375                	lui	t1,0xffffd
 e8c:	6c20                	flw	fs0,88(s0)
 e8e:	3978                	fld	fa4,240(a0)
 e90:	0000                	unimp
 e92:	0000                	unimp
 e94:	616c                	flw	fa1,68(a0)
 e96:	7474                	flw	fa3,108(s0)
 e98:	6369                	lui	t1,0x1a
 e9a:	2065                	jal	f42 <_GLOBAL_OFFSET_TABLE_+0x42>
 e9c:	6365                	lui	t1,0x19
 e9e:	3570                	fld	fa2,232(a0)
 ea0:	342d                	jal	8ca <printf+0xbe>
 ea2:	4635                	li	a2,13
 ea4:	6320                	flw	fs0,64(a4)
 ea6:	726f6c6f          	jal	s8,f75cc <_global+0xf5ed0>
 eaa:	696c                	flw	fa1,84(a0)
 eac:	69746867          	0x69746867
 eb0:	0039                	c.nop	14
 eb2:	0000                	unimp
 eb4:	616c                	flw	fa1,68(a0)
 eb6:	7474                	flw	fa3,108(s0)
 eb8:	6369                	lui	t1,0x1a
 eba:	2065                	jal	f62 <_edata+0x9>
 ebc:	6365                	lui	t1,0x19
 ebe:	3570                	fld	fa2,232(a0)
 ec0:	322d                	jal	7ea <putnum+0x156>
 ec2:	4635                	li	a2,13
 ec4:	6320                	flw	fs0,64(a4)
 ec6:	726f6c6f          	jal	s8,f75ec <_global+0xf5ef0>
 eca:	696c                	flw	fa1,84(a0)
 ecc:	69746867          	0x69746867
 ed0:	0035                	c.nop	13
 ed2:	0000                	unimp
 ed4:	6d71                	lui	s10,0x1c
 ed6:	6574                	flw	fa3,76(a0)
 ed8:	63206863          	bltu	zero,s2,1508 <_stack+0x508>
 edc:	6379                	lui	t1,0x1e
 ede:	6f6c                	flw	fa1,92(a4)
 ee0:	656e                	flw	fa0,216(sp)
 ee2:	3120                	fld	fs0,96(a0)
 ee4:	6c30                	flw	fa2,88(s0)
 ee6:	2070                	fld	fa2,192(s0)
 ee8:	36313063          	0x36313063
 eec:	0000                	unimp
 eee:	0000                	unimp
 ef0:	6e75                	lui	t3,0x1d
 ef2:	776f6e6b          	0x776f6e6b
 ef6:	006e                	c.slli	zero,0x1b

00000ef8 <io>:
 ef8:	0000                	unimp
 efa:	8000                	0x8000

00000efc <utimers>:
 efc:	0000                	unimp
	...

00000f00 <_GLOBAL_OFFSET_TABLE_>:
 f00:	0000                	unimp
 f02:	0000                	unimp
 f04:	0efc                	addi	a5,sp,860
 f06:	0000                	unimp
 f08:	0bcc                	addi	a1,sp,468
 f0a:	0000                	unimp
 f0c:	16fc                	addi	a5,sp,876
 f0e:	0000                	unimp
 f10:	0ef8                	addi	a4,sp,860
 f12:	0000                	unimp
 f14:	0200                	addi	s0,sp,256
 f16:	0000                	unimp
 f18:	0200                	addi	s0,sp,256
 f1a:	0000                	unimp
 f1c:	0bcc                	addi	a1,sp,468
 f1e:	0000                	unimp
 f20:	0f59                	addi	t5,t5,22
 f22:	0000                	unimp
 f24:	1000                	addi	s0,sp,32
 f26:	0000                	unimp
 f28:	ffff                	0xffff
 f2a:	ffff                	0xffff
 f2c:	0000                	unimp
 f2e:	0000                	unimp
 f30:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
 f34:	2820                	fld	fs0,80(s0)
 f36:	6255                	lui	tp,0x15
 f38:	6e75                	lui	t3,0x1d
 f3a:	7574                	flw	fa3,108(a0)
 f3c:	3920                	fld	fs0,112(a0)
 f3e:	342e                	fld	fs0,232(sp)
 f40:	302e                	fld	ft0,232(sp)
 f42:	312d                	jal	b6c <mac>
 f44:	6275                	lui	tp,0x1d
 f46:	6e75                	lui	t3,0x1d
 f48:	7574                	flw	fa3,108(a0)
 f4a:	7e31                	lui	t3,0xfffec
 f4c:	3032                	fld	ft0,296(sp)
 f4e:	302e                	fld	ft0,232(sp)
 f50:	2934                	fld	fa3,80(a0)
 f52:	3920                	fld	fs0,112(a0)
 f54:	342e                	fld	fs0,232(sp)
 f56:	302e                	fld	ft0,232(sp)
	...
