
user/_primes：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000000000 <findPrime>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void findPrime(int *p1){
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	1800                	addi	s0,sp,48
   c:	84aa                	mv	s1,a0
  int p2[2];
  int num;
  close(p1[1]);
   e:	4148                	lw	a0,4(a0)
  10:	00000097          	auipc	ra,0x0
  14:	436080e7          	jalr	1078(ra) # 446 <close>
  int numSize = read(p1[0], &num, sizeof(int));
  18:	4611                	li	a2,4
  1a:	fd440593          	addi	a1,s0,-44
  1e:	4088                	lw	a0,0(s1)
  20:	00000097          	auipc	ra,0x0
  24:	416080e7          	jalr	1046(ra) # 436 <read>
  if(numSize == 0){
  28:	c905                	beqz	a0,58 <findPrime+0x58>
    exit(0);
  }

  pipe(p2);
  2a:	fd840513          	addi	a0,s0,-40
  2e:	00000097          	auipc	ra,0x0
  32:	400080e7          	jalr	1024(ra) # 42e <pipe>
  int pid=fork();
  36:	00000097          	auipc	ra,0x0
  3a:	3e0080e7          	jalr	992(ra) # 416 <fork>
  if(pid == 0){
  3e:	e10d                	bnez	a0,60 <findPrime+0x60>
    findPrime(p2);
  40:	fd840513          	addi	a0,s0,-40
  44:	00000097          	auipc	ra,0x0
  48:	fbc080e7          	jalr	-68(ra) # 0 <findPrime>
    close(p1[0]);
    close(p2[1]);
    wait(0);
    exit(0);
  } 
}
  4c:	70a2                	ld	ra,40(sp)
  4e:	7402                	ld	s0,32(sp)
  50:	64e2                	ld	s1,24(sp)
  52:	6942                	ld	s2,16(sp)
  54:	6145                	addi	sp,sp,48
  56:	8082                	ret
    exit(0);
  58:	00000097          	auipc	ra,0x0
  5c:	3c6080e7          	jalr	966(ra) # 41e <exit>
    printf("prime %d\n", num);
  60:	fd442583          	lw	a1,-44(s0)
  64:	00001517          	auipc	a0,0x1
  68:	8dc50513          	addi	a0,a0,-1828 # 940 <malloc+0xec>
  6c:	00000097          	auipc	ra,0x0
  70:	72a080e7          	jalr	1834(ra) # 796 <printf>
    close(p2[0]);
  74:	fd842503          	lw	a0,-40(s0)
  78:	00000097          	auipc	ra,0x0
  7c:	3ce080e7          	jalr	974(ra) # 446 <close>
    int modNum = num;
  80:	fd442903          	lw	s2,-44(s0)
    while(read(p1[0], &num, sizeof(int)) != 0){
  84:	4611                	li	a2,4
  86:	fd440593          	addi	a1,s0,-44
  8a:	4088                	lw	a0,0(s1)
  8c:	00000097          	auipc	ra,0x0
  90:	3aa080e7          	jalr	938(ra) # 436 <read>
  94:	c105                	beqz	a0,b4 <findPrime+0xb4>
      if(num % modNum != 0){
  96:	fd442783          	lw	a5,-44(s0)
  9a:	0327e7bb          	remw	a5,a5,s2
  9e:	d3fd                	beqz	a5,84 <findPrime+0x84>
        write(p2[1], &num, sizeof(int));
  a0:	4611                	li	a2,4
  a2:	fd440593          	addi	a1,s0,-44
  a6:	fdc42503          	lw	a0,-36(s0)
  aa:	00000097          	auipc	ra,0x0
  ae:	394080e7          	jalr	916(ra) # 43e <write>
  b2:	bfc9                	j	84 <findPrime+0x84>
    close(p1[0]);
  b4:	4088                	lw	a0,0(s1)
  b6:	00000097          	auipc	ra,0x0
  ba:	390080e7          	jalr	912(ra) # 446 <close>
    close(p2[1]);
  be:	fdc42503          	lw	a0,-36(s0)
  c2:	00000097          	auipc	ra,0x0
  c6:	384080e7          	jalr	900(ra) # 446 <close>
    wait(0);
  ca:	4501                	li	a0,0
  cc:	00000097          	auipc	ra,0x0
  d0:	35a080e7          	jalr	858(ra) # 426 <wait>
    exit(0);
  d4:	4501                	li	a0,0
  d6:	00000097          	auipc	ra,0x0
  da:	348080e7          	jalr	840(ra) # 41e <exit>

00000000000000de <main>:

int main(int argc, char*argv[])
{
  de:	7179                	addi	sp,sp,-48
  e0:	f406                	sd	ra,40(sp)
  e2:	f022                	sd	s0,32(sp)
  e4:	ec26                	sd	s1,24(sp)
  e6:	1800                	addi	s0,sp,48
  int p[2];
  pipe(p);
  e8:	fd840513          	addi	a0,s0,-40
  ec:	00000097          	auipc	ra,0x0
  f0:	342080e7          	jalr	834(ra) # 42e <pipe>
  int pid=fork();
  f4:	00000097          	auipc	ra,0x0
  f8:	322080e7          	jalr	802(ra) # 416 <fork>
  if(pid == 0){
  fc:	cd2d                	beqz	a0,176 <main+0x98>
    findPrime(p);
  }
  else if(pid > 0){
  fe:	04a05f63          	blez	a0,15c <main+0x7e>
    close(p[0]);
 102:	fd842503          	lw	a0,-40(s0)
 106:	00000097          	auipc	ra,0x0
 10a:	340080e7          	jalr	832(ra) # 446 <close>
    for(int i = 2; i <= 35; i++){
 10e:	4789                	li	a5,2
 110:	fcf42a23          	sw	a5,-44(s0)
 114:	02300493          	li	s1,35
      write(p[1], &i, sizeof(int));
 118:	4611                	li	a2,4
 11a:	fd440593          	addi	a1,s0,-44
 11e:	fdc42503          	lw	a0,-36(s0)
 122:	00000097          	auipc	ra,0x0
 126:	31c080e7          	jalr	796(ra) # 43e <write>
    for(int i = 2; i <= 35; i++){
 12a:	fd442783          	lw	a5,-44(s0)
 12e:	2785                	addiw	a5,a5,1
 130:	0007871b          	sext.w	a4,a5
 134:	fcf42a23          	sw	a5,-44(s0)
 138:	fee4d0e3          	bge	s1,a4,118 <main+0x3a>
    }
    close(p[1]);
 13c:	fdc42503          	lw	a0,-36(s0)
 140:	00000097          	auipc	ra,0x0
 144:	306080e7          	jalr	774(ra) # 446 <close>
    wait(0);
 148:	4501                	li	a0,0
 14a:	00000097          	auipc	ra,0x0
 14e:	2dc080e7          	jalr	732(ra) # 426 <wait>
    exit(0);
 152:	4501                	li	a0,0
 154:	00000097          	auipc	ra,0x0
 158:	2ca080e7          	jalr	714(ra) # 41e <exit>
  }
  else{
    printf("fork error\n");
 15c:	00000517          	auipc	a0,0x0
 160:	7f450513          	addi	a0,a0,2036 # 950 <malloc+0xfc>
 164:	00000097          	auipc	ra,0x0
 168:	632080e7          	jalr	1586(ra) # 796 <printf>
    exit(-1);
 16c:	557d                	li	a0,-1
 16e:	00000097          	auipc	ra,0x0
 172:	2b0080e7          	jalr	688(ra) # 41e <exit>
    findPrime(p);
 176:	fd840513          	addi	a0,s0,-40
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <findPrime>
  }
  return 0;
}
 182:	4501                	li	a0,0
 184:	70a2                	ld	ra,40(sp)
 186:	7402                	ld	s0,32(sp)
 188:	64e2                	ld	s1,24(sp)
 18a:	6145                	addi	sp,sp,48
 18c:	8082                	ret

000000000000018e <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 18e:	1141                	addi	sp,sp,-16
 190:	e406                	sd	ra,8(sp)
 192:	e022                	sd	s0,0(sp)
 194:	0800                	addi	s0,sp,16
  extern int main();
  main();
 196:	00000097          	auipc	ra,0x0
 19a:	f48080e7          	jalr	-184(ra) # de <main>
  exit(0);
 19e:	4501                	li	a0,0
 1a0:	00000097          	auipc	ra,0x0
 1a4:	27e080e7          	jalr	638(ra) # 41e <exit>

00000000000001a8 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 1a8:	1141                	addi	sp,sp,-16
 1aa:	e422                	sd	s0,8(sp)
 1ac:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ae:	87aa                	mv	a5,a0
 1b0:	0585                	addi	a1,a1,1
 1b2:	0785                	addi	a5,a5,1
 1b4:	fff5c703          	lbu	a4,-1(a1)
 1b8:	fee78fa3          	sb	a4,-1(a5)
 1bc:	fb75                	bnez	a4,1b0 <strcpy+0x8>
    ;
  return os;
}
 1be:	6422                	ld	s0,8(sp)
 1c0:	0141                	addi	sp,sp,16
 1c2:	8082                	ret

00000000000001c4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c4:	1141                	addi	sp,sp,-16
 1c6:	e422                	sd	s0,8(sp)
 1c8:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	cb91                	beqz	a5,1e2 <strcmp+0x1e>
 1d0:	0005c703          	lbu	a4,0(a1)
 1d4:	00f71763          	bne	a4,a5,1e2 <strcmp+0x1e>
    p++, q++;
 1d8:	0505                	addi	a0,a0,1
 1da:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1dc:	00054783          	lbu	a5,0(a0)
 1e0:	fbe5                	bnez	a5,1d0 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1e2:	0005c503          	lbu	a0,0(a1)
}
 1e6:	40a7853b          	subw	a0,a5,a0
 1ea:	6422                	ld	s0,8(sp)
 1ec:	0141                	addi	sp,sp,16
 1ee:	8082                	ret

00000000000001f0 <strlen>:

uint
strlen(const char *s)
{
 1f0:	1141                	addi	sp,sp,-16
 1f2:	e422                	sd	s0,8(sp)
 1f4:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1f6:	00054783          	lbu	a5,0(a0)
 1fa:	cf91                	beqz	a5,216 <strlen+0x26>
 1fc:	0505                	addi	a0,a0,1
 1fe:	87aa                	mv	a5,a0
 200:	4685                	li	a3,1
 202:	9e89                	subw	a3,a3,a0
 204:	00f6853b          	addw	a0,a3,a5
 208:	0785                	addi	a5,a5,1
 20a:	fff7c703          	lbu	a4,-1(a5)
 20e:	fb7d                	bnez	a4,204 <strlen+0x14>
    ;
  return n;
}
 210:	6422                	ld	s0,8(sp)
 212:	0141                	addi	sp,sp,16
 214:	8082                	ret
  for(n = 0; s[n]; n++)
 216:	4501                	li	a0,0
 218:	bfe5                	j	210 <strlen+0x20>

000000000000021a <memset>:

void*
memset(void *dst, int c, uint n)
{
 21a:	1141                	addi	sp,sp,-16
 21c:	e422                	sd	s0,8(sp)
 21e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 220:	ce09                	beqz	a2,23a <memset+0x20>
 222:	87aa                	mv	a5,a0
 224:	fff6071b          	addiw	a4,a2,-1
 228:	1702                	slli	a4,a4,0x20
 22a:	9301                	srli	a4,a4,0x20
 22c:	0705                	addi	a4,a4,1
 22e:	972a                	add	a4,a4,a0
    cdst[i] = c;
 230:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 234:	0785                	addi	a5,a5,1
 236:	fee79de3          	bne	a5,a4,230 <memset+0x16>
  }
  return dst;
}
 23a:	6422                	ld	s0,8(sp)
 23c:	0141                	addi	sp,sp,16
 23e:	8082                	ret

0000000000000240 <strchr>:

char*
strchr(const char *s, char c)
{
 240:	1141                	addi	sp,sp,-16
 242:	e422                	sd	s0,8(sp)
 244:	0800                	addi	s0,sp,16
  for(; *s; s++)
 246:	00054783          	lbu	a5,0(a0)
 24a:	cb99                	beqz	a5,260 <strchr+0x20>
    if(*s == c)
 24c:	00f58763          	beq	a1,a5,25a <strchr+0x1a>
  for(; *s; s++)
 250:	0505                	addi	a0,a0,1
 252:	00054783          	lbu	a5,0(a0)
 256:	fbfd                	bnez	a5,24c <strchr+0xc>
      return (char*)s;
  return 0;
 258:	4501                	li	a0,0
}
 25a:	6422                	ld	s0,8(sp)
 25c:	0141                	addi	sp,sp,16
 25e:	8082                	ret
  return 0;
 260:	4501                	li	a0,0
 262:	bfe5                	j	25a <strchr+0x1a>

0000000000000264 <gets>:

char*
gets(char *buf, int max)
{
 264:	711d                	addi	sp,sp,-96
 266:	ec86                	sd	ra,88(sp)
 268:	e8a2                	sd	s0,80(sp)
 26a:	e4a6                	sd	s1,72(sp)
 26c:	e0ca                	sd	s2,64(sp)
 26e:	fc4e                	sd	s3,56(sp)
 270:	f852                	sd	s4,48(sp)
 272:	f456                	sd	s5,40(sp)
 274:	f05a                	sd	s6,32(sp)
 276:	ec5e                	sd	s7,24(sp)
 278:	1080                	addi	s0,sp,96
 27a:	8baa                	mv	s7,a0
 27c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 27e:	892a                	mv	s2,a0
 280:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 282:	4aa9                	li	s5,10
 284:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 286:	89a6                	mv	s3,s1
 288:	2485                	addiw	s1,s1,1
 28a:	0344d863          	bge	s1,s4,2ba <gets+0x56>
    cc = read(0, &c, 1);
 28e:	4605                	li	a2,1
 290:	faf40593          	addi	a1,s0,-81
 294:	4501                	li	a0,0
 296:	00000097          	auipc	ra,0x0
 29a:	1a0080e7          	jalr	416(ra) # 436 <read>
    if(cc < 1)
 29e:	00a05e63          	blez	a0,2ba <gets+0x56>
    buf[i++] = c;
 2a2:	faf44783          	lbu	a5,-81(s0)
 2a6:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2aa:	01578763          	beq	a5,s5,2b8 <gets+0x54>
 2ae:	0905                	addi	s2,s2,1
 2b0:	fd679be3          	bne	a5,s6,286 <gets+0x22>
  for(i=0; i+1 < max; ){
 2b4:	89a6                	mv	s3,s1
 2b6:	a011                	j	2ba <gets+0x56>
 2b8:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2ba:	99de                	add	s3,s3,s7
 2bc:	00098023          	sb	zero,0(s3)
  return buf;
}
 2c0:	855e                	mv	a0,s7
 2c2:	60e6                	ld	ra,88(sp)
 2c4:	6446                	ld	s0,80(sp)
 2c6:	64a6                	ld	s1,72(sp)
 2c8:	6906                	ld	s2,64(sp)
 2ca:	79e2                	ld	s3,56(sp)
 2cc:	7a42                	ld	s4,48(sp)
 2ce:	7aa2                	ld	s5,40(sp)
 2d0:	7b02                	ld	s6,32(sp)
 2d2:	6be2                	ld	s7,24(sp)
 2d4:	6125                	addi	sp,sp,96
 2d6:	8082                	ret

00000000000002d8 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d8:	1101                	addi	sp,sp,-32
 2da:	ec06                	sd	ra,24(sp)
 2dc:	e822                	sd	s0,16(sp)
 2de:	e426                	sd	s1,8(sp)
 2e0:	e04a                	sd	s2,0(sp)
 2e2:	1000                	addi	s0,sp,32
 2e4:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	4581                	li	a1,0
 2e8:	00000097          	auipc	ra,0x0
 2ec:	176080e7          	jalr	374(ra) # 45e <open>
  if(fd < 0)
 2f0:	02054563          	bltz	a0,31a <stat+0x42>
 2f4:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2f6:	85ca                	mv	a1,s2
 2f8:	00000097          	auipc	ra,0x0
 2fc:	17e080e7          	jalr	382(ra) # 476 <fstat>
 300:	892a                	mv	s2,a0
  close(fd);
 302:	8526                	mv	a0,s1
 304:	00000097          	auipc	ra,0x0
 308:	142080e7          	jalr	322(ra) # 446 <close>
  return r;
}
 30c:	854a                	mv	a0,s2
 30e:	60e2                	ld	ra,24(sp)
 310:	6442                	ld	s0,16(sp)
 312:	64a2                	ld	s1,8(sp)
 314:	6902                	ld	s2,0(sp)
 316:	6105                	addi	sp,sp,32
 318:	8082                	ret
    return -1;
 31a:	597d                	li	s2,-1
 31c:	bfc5                	j	30c <stat+0x34>

000000000000031e <atoi>:

int
atoi(const char *s)
{
 31e:	1141                	addi	sp,sp,-16
 320:	e422                	sd	s0,8(sp)
 322:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 324:	00054603          	lbu	a2,0(a0)
 328:	fd06079b          	addiw	a5,a2,-48
 32c:	0ff7f793          	andi	a5,a5,255
 330:	4725                	li	a4,9
 332:	02f76963          	bltu	a4,a5,364 <atoi+0x46>
 336:	86aa                	mv	a3,a0
  n = 0;
 338:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 33a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 33c:	0685                	addi	a3,a3,1
 33e:	0025179b          	slliw	a5,a0,0x2
 342:	9fa9                	addw	a5,a5,a0
 344:	0017979b          	slliw	a5,a5,0x1
 348:	9fb1                	addw	a5,a5,a2
 34a:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 34e:	0006c603          	lbu	a2,0(a3)
 352:	fd06071b          	addiw	a4,a2,-48
 356:	0ff77713          	andi	a4,a4,255
 35a:	fee5f1e3          	bgeu	a1,a4,33c <atoi+0x1e>
  return n;
}
 35e:	6422                	ld	s0,8(sp)
 360:	0141                	addi	sp,sp,16
 362:	8082                	ret
  n = 0;
 364:	4501                	li	a0,0
 366:	bfe5                	j	35e <atoi+0x40>

0000000000000368 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 368:	1141                	addi	sp,sp,-16
 36a:	e422                	sd	s0,8(sp)
 36c:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 36e:	02b57663          	bgeu	a0,a1,39a <memmove+0x32>
    while(n-- > 0)
 372:	02c05163          	blez	a2,394 <memmove+0x2c>
 376:	fff6079b          	addiw	a5,a2,-1
 37a:	1782                	slli	a5,a5,0x20
 37c:	9381                	srli	a5,a5,0x20
 37e:	0785                	addi	a5,a5,1
 380:	97aa                	add	a5,a5,a0
  dst = vdst;
 382:	872a                	mv	a4,a0
      *dst++ = *src++;
 384:	0585                	addi	a1,a1,1
 386:	0705                	addi	a4,a4,1
 388:	fff5c683          	lbu	a3,-1(a1)
 38c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 390:	fee79ae3          	bne	a5,a4,384 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 394:	6422                	ld	s0,8(sp)
 396:	0141                	addi	sp,sp,16
 398:	8082                	ret
    dst += n;
 39a:	00c50733          	add	a4,a0,a2
    src += n;
 39e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3a0:	fec05ae3          	blez	a2,394 <memmove+0x2c>
 3a4:	fff6079b          	addiw	a5,a2,-1
 3a8:	1782                	slli	a5,a5,0x20
 3aa:	9381                	srli	a5,a5,0x20
 3ac:	fff7c793          	not	a5,a5
 3b0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3b2:	15fd                	addi	a1,a1,-1
 3b4:	177d                	addi	a4,a4,-1
 3b6:	0005c683          	lbu	a3,0(a1)
 3ba:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3be:	fee79ae3          	bne	a5,a4,3b2 <memmove+0x4a>
 3c2:	bfc9                	j	394 <memmove+0x2c>

00000000000003c4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3c4:	1141                	addi	sp,sp,-16
 3c6:	e422                	sd	s0,8(sp)
 3c8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3ca:	ca05                	beqz	a2,3fa <memcmp+0x36>
 3cc:	fff6069b          	addiw	a3,a2,-1
 3d0:	1682                	slli	a3,a3,0x20
 3d2:	9281                	srli	a3,a3,0x20
 3d4:	0685                	addi	a3,a3,1
 3d6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3d8:	00054783          	lbu	a5,0(a0)
 3dc:	0005c703          	lbu	a4,0(a1)
 3e0:	00e79863          	bne	a5,a4,3f0 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3e4:	0505                	addi	a0,a0,1
    p2++;
 3e6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3e8:	fed518e3          	bne	a0,a3,3d8 <memcmp+0x14>
  }
  return 0;
 3ec:	4501                	li	a0,0
 3ee:	a019                	j	3f4 <memcmp+0x30>
      return *p1 - *p2;
 3f0:	40e7853b          	subw	a0,a5,a4
}
 3f4:	6422                	ld	s0,8(sp)
 3f6:	0141                	addi	sp,sp,16
 3f8:	8082                	ret
  return 0;
 3fa:	4501                	li	a0,0
 3fc:	bfe5                	j	3f4 <memcmp+0x30>

00000000000003fe <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3fe:	1141                	addi	sp,sp,-16
 400:	e406                	sd	ra,8(sp)
 402:	e022                	sd	s0,0(sp)
 404:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 406:	00000097          	auipc	ra,0x0
 40a:	f62080e7          	jalr	-158(ra) # 368 <memmove>
}
 40e:	60a2                	ld	ra,8(sp)
 410:	6402                	ld	s0,0(sp)
 412:	0141                	addi	sp,sp,16
 414:	8082                	ret

0000000000000416 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 416:	4885                	li	a7,1
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <exit>:
.global exit
exit:
 li a7, SYS_exit
 41e:	4889                	li	a7,2
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <wait>:
.global wait
wait:
 li a7, SYS_wait
 426:	488d                	li	a7,3
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 42e:	4891                	li	a7,4
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <read>:
.global read
read:
 li a7, SYS_read
 436:	4895                	li	a7,5
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <write>:
.global write
write:
 li a7, SYS_write
 43e:	48c1                	li	a7,16
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <close>:
.global close
close:
 li a7, SYS_close
 446:	48d5                	li	a7,21
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <kill>:
.global kill
kill:
 li a7, SYS_kill
 44e:	4899                	li	a7,6
 ecall
 450:	00000073          	ecall
 ret
 454:	8082                	ret

0000000000000456 <exec>:
.global exec
exec:
 li a7, SYS_exec
 456:	489d                	li	a7,7
 ecall
 458:	00000073          	ecall
 ret
 45c:	8082                	ret

000000000000045e <open>:
.global open
open:
 li a7, SYS_open
 45e:	48bd                	li	a7,15
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 466:	48c5                	li	a7,17
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 46e:	48c9                	li	a7,18
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 476:	48a1                	li	a7,8
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <link>:
.global link
link:
 li a7, SYS_link
 47e:	48cd                	li	a7,19
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 486:	48d1                	li	a7,20
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 48e:	48a5                	li	a7,9
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <dup>:
.global dup
dup:
 li a7, SYS_dup
 496:	48a9                	li	a7,10
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 49e:	48ad                	li	a7,11
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4a6:	48b1                	li	a7,12
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4ae:	48b5                	li	a7,13
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4b6:	48b9                	li	a7,14
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4be:	1101                	addi	sp,sp,-32
 4c0:	ec06                	sd	ra,24(sp)
 4c2:	e822                	sd	s0,16(sp)
 4c4:	1000                	addi	s0,sp,32
 4c6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4ca:	4605                	li	a2,1
 4cc:	fef40593          	addi	a1,s0,-17
 4d0:	00000097          	auipc	ra,0x0
 4d4:	f6e080e7          	jalr	-146(ra) # 43e <write>
}
 4d8:	60e2                	ld	ra,24(sp)
 4da:	6442                	ld	s0,16(sp)
 4dc:	6105                	addi	sp,sp,32
 4de:	8082                	ret

00000000000004e0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	7139                	addi	sp,sp,-64
 4e2:	fc06                	sd	ra,56(sp)
 4e4:	f822                	sd	s0,48(sp)
 4e6:	f426                	sd	s1,40(sp)
 4e8:	f04a                	sd	s2,32(sp)
 4ea:	ec4e                	sd	s3,24(sp)
 4ec:	0080                	addi	s0,sp,64
 4ee:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f0:	c299                	beqz	a3,4f6 <printint+0x16>
 4f2:	0805c863          	bltz	a1,582 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4f6:	2581                	sext.w	a1,a1
  neg = 0;
 4f8:	4881                	li	a7,0
 4fa:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4fe:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 500:	2601                	sext.w	a2,a2
 502:	00000517          	auipc	a0,0x0
 506:	46650513          	addi	a0,a0,1126 # 968 <digits>
 50a:	883a                	mv	a6,a4
 50c:	2705                	addiw	a4,a4,1
 50e:	02c5f7bb          	remuw	a5,a1,a2
 512:	1782                	slli	a5,a5,0x20
 514:	9381                	srli	a5,a5,0x20
 516:	97aa                	add	a5,a5,a0
 518:	0007c783          	lbu	a5,0(a5)
 51c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 520:	0005879b          	sext.w	a5,a1
 524:	02c5d5bb          	divuw	a1,a1,a2
 528:	0685                	addi	a3,a3,1
 52a:	fec7f0e3          	bgeu	a5,a2,50a <printint+0x2a>
  if(neg)
 52e:	00088b63          	beqz	a7,544 <printint+0x64>
    buf[i++] = '-';
 532:	fd040793          	addi	a5,s0,-48
 536:	973e                	add	a4,a4,a5
 538:	02d00793          	li	a5,45
 53c:	fef70823          	sb	a5,-16(a4)
 540:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 544:	02e05863          	blez	a4,574 <printint+0x94>
 548:	fc040793          	addi	a5,s0,-64
 54c:	00e78933          	add	s2,a5,a4
 550:	fff78993          	addi	s3,a5,-1
 554:	99ba                	add	s3,s3,a4
 556:	377d                	addiw	a4,a4,-1
 558:	1702                	slli	a4,a4,0x20
 55a:	9301                	srli	a4,a4,0x20
 55c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 560:	fff94583          	lbu	a1,-1(s2)
 564:	8526                	mv	a0,s1
 566:	00000097          	auipc	ra,0x0
 56a:	f58080e7          	jalr	-168(ra) # 4be <putc>
  while(--i >= 0)
 56e:	197d                	addi	s2,s2,-1
 570:	ff3918e3          	bne	s2,s3,560 <printint+0x80>
}
 574:	70e2                	ld	ra,56(sp)
 576:	7442                	ld	s0,48(sp)
 578:	74a2                	ld	s1,40(sp)
 57a:	7902                	ld	s2,32(sp)
 57c:	69e2                	ld	s3,24(sp)
 57e:	6121                	addi	sp,sp,64
 580:	8082                	ret
    x = -xx;
 582:	40b005bb          	negw	a1,a1
    neg = 1;
 586:	4885                	li	a7,1
    x = -xx;
 588:	bf8d                	j	4fa <printint+0x1a>

000000000000058a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 58a:	7119                	addi	sp,sp,-128
 58c:	fc86                	sd	ra,120(sp)
 58e:	f8a2                	sd	s0,112(sp)
 590:	f4a6                	sd	s1,104(sp)
 592:	f0ca                	sd	s2,96(sp)
 594:	ecce                	sd	s3,88(sp)
 596:	e8d2                	sd	s4,80(sp)
 598:	e4d6                	sd	s5,72(sp)
 59a:	e0da                	sd	s6,64(sp)
 59c:	fc5e                	sd	s7,56(sp)
 59e:	f862                	sd	s8,48(sp)
 5a0:	f466                	sd	s9,40(sp)
 5a2:	f06a                	sd	s10,32(sp)
 5a4:	ec6e                	sd	s11,24(sp)
 5a6:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5a8:	0005c903          	lbu	s2,0(a1)
 5ac:	18090f63          	beqz	s2,74a <vprintf+0x1c0>
 5b0:	8aaa                	mv	s5,a0
 5b2:	8b32                	mv	s6,a2
 5b4:	00158493          	addi	s1,a1,1
  state = 0;
 5b8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5ba:	02500a13          	li	s4,37
      if(c == 'd'){
 5be:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5c2:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5c6:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5ca:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5ce:	00000b97          	auipc	s7,0x0
 5d2:	39ab8b93          	addi	s7,s7,922 # 968 <digits>
 5d6:	a839                	j	5f4 <vprintf+0x6a>
        putc(fd, c);
 5d8:	85ca                	mv	a1,s2
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	ee2080e7          	jalr	-286(ra) # 4be <putc>
 5e4:	a019                	j	5ea <vprintf+0x60>
    } else if(state == '%'){
 5e6:	01498f63          	beq	s3,s4,604 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5ea:	0485                	addi	s1,s1,1
 5ec:	fff4c903          	lbu	s2,-1(s1)
 5f0:	14090d63          	beqz	s2,74a <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5f4:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5f8:	fe0997e3          	bnez	s3,5e6 <vprintf+0x5c>
      if(c == '%'){
 5fc:	fd479ee3          	bne	a5,s4,5d8 <vprintf+0x4e>
        state = '%';
 600:	89be                	mv	s3,a5
 602:	b7e5                	j	5ea <vprintf+0x60>
      if(c == 'd'){
 604:	05878063          	beq	a5,s8,644 <vprintf+0xba>
      } else if(c == 'l') {
 608:	05978c63          	beq	a5,s9,660 <vprintf+0xd6>
      } else if(c == 'x') {
 60c:	07a78863          	beq	a5,s10,67c <vprintf+0xf2>
      } else if(c == 'p') {
 610:	09b78463          	beq	a5,s11,698 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 614:	07300713          	li	a4,115
 618:	0ce78663          	beq	a5,a4,6e4 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61c:	06300713          	li	a4,99
 620:	0ee78e63          	beq	a5,a4,71c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 624:	11478863          	beq	a5,s4,734 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 628:	85d2                	mv	a1,s4
 62a:	8556                	mv	a0,s5
 62c:	00000097          	auipc	ra,0x0
 630:	e92080e7          	jalr	-366(ra) # 4be <putc>
        putc(fd, c);
 634:	85ca                	mv	a1,s2
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	e86080e7          	jalr	-378(ra) # 4be <putc>
      }
      state = 0;
 640:	4981                	li	s3,0
 642:	b765                	j	5ea <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 644:	008b0913          	addi	s2,s6,8
 648:	4685                	li	a3,1
 64a:	4629                	li	a2,10
 64c:	000b2583          	lw	a1,0(s6)
 650:	8556                	mv	a0,s5
 652:	00000097          	auipc	ra,0x0
 656:	e8e080e7          	jalr	-370(ra) # 4e0 <printint>
 65a:	8b4a                	mv	s6,s2
      state = 0;
 65c:	4981                	li	s3,0
 65e:	b771                	j	5ea <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 660:	008b0913          	addi	s2,s6,8
 664:	4681                	li	a3,0
 666:	4629                	li	a2,10
 668:	000b2583          	lw	a1,0(s6)
 66c:	8556                	mv	a0,s5
 66e:	00000097          	auipc	ra,0x0
 672:	e72080e7          	jalr	-398(ra) # 4e0 <printint>
 676:	8b4a                	mv	s6,s2
      state = 0;
 678:	4981                	li	s3,0
 67a:	bf85                	j	5ea <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 67c:	008b0913          	addi	s2,s6,8
 680:	4681                	li	a3,0
 682:	4641                	li	a2,16
 684:	000b2583          	lw	a1,0(s6)
 688:	8556                	mv	a0,s5
 68a:	00000097          	auipc	ra,0x0
 68e:	e56080e7          	jalr	-426(ra) # 4e0 <printint>
 692:	8b4a                	mv	s6,s2
      state = 0;
 694:	4981                	li	s3,0
 696:	bf91                	j	5ea <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 698:	008b0793          	addi	a5,s6,8
 69c:	f8f43423          	sd	a5,-120(s0)
 6a0:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6a4:	03000593          	li	a1,48
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	e14080e7          	jalr	-492(ra) # 4be <putc>
  putc(fd, 'x');
 6b2:	85ea                	mv	a1,s10
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	e08080e7          	jalr	-504(ra) # 4be <putc>
 6be:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6c0:	03c9d793          	srli	a5,s3,0x3c
 6c4:	97de                	add	a5,a5,s7
 6c6:	0007c583          	lbu	a1,0(a5)
 6ca:	8556                	mv	a0,s5
 6cc:	00000097          	auipc	ra,0x0
 6d0:	df2080e7          	jalr	-526(ra) # 4be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6d4:	0992                	slli	s3,s3,0x4
 6d6:	397d                	addiw	s2,s2,-1
 6d8:	fe0914e3          	bnez	s2,6c0 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6dc:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6e0:	4981                	li	s3,0
 6e2:	b721                	j	5ea <vprintf+0x60>
        s = va_arg(ap, char*);
 6e4:	008b0993          	addi	s3,s6,8
 6e8:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6ec:	02090163          	beqz	s2,70e <vprintf+0x184>
        while(*s != 0){
 6f0:	00094583          	lbu	a1,0(s2)
 6f4:	c9a1                	beqz	a1,744 <vprintf+0x1ba>
          putc(fd, *s);
 6f6:	8556                	mv	a0,s5
 6f8:	00000097          	auipc	ra,0x0
 6fc:	dc6080e7          	jalr	-570(ra) # 4be <putc>
          s++;
 700:	0905                	addi	s2,s2,1
        while(*s != 0){
 702:	00094583          	lbu	a1,0(s2)
 706:	f9e5                	bnez	a1,6f6 <vprintf+0x16c>
        s = va_arg(ap, char*);
 708:	8b4e                	mv	s6,s3
      state = 0;
 70a:	4981                	li	s3,0
 70c:	bdf9                	j	5ea <vprintf+0x60>
          s = "(null)";
 70e:	00000917          	auipc	s2,0x0
 712:	25290913          	addi	s2,s2,594 # 960 <malloc+0x10c>
        while(*s != 0){
 716:	02800593          	li	a1,40
 71a:	bff1                	j	6f6 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 71c:	008b0913          	addi	s2,s6,8
 720:	000b4583          	lbu	a1,0(s6)
 724:	8556                	mv	a0,s5
 726:	00000097          	auipc	ra,0x0
 72a:	d98080e7          	jalr	-616(ra) # 4be <putc>
 72e:	8b4a                	mv	s6,s2
      state = 0;
 730:	4981                	li	s3,0
 732:	bd65                	j	5ea <vprintf+0x60>
        putc(fd, c);
 734:	85d2                	mv	a1,s4
 736:	8556                	mv	a0,s5
 738:	00000097          	auipc	ra,0x0
 73c:	d86080e7          	jalr	-634(ra) # 4be <putc>
      state = 0;
 740:	4981                	li	s3,0
 742:	b565                	j	5ea <vprintf+0x60>
        s = va_arg(ap, char*);
 744:	8b4e                	mv	s6,s3
      state = 0;
 746:	4981                	li	s3,0
 748:	b54d                	j	5ea <vprintf+0x60>
    }
  }
}
 74a:	70e6                	ld	ra,120(sp)
 74c:	7446                	ld	s0,112(sp)
 74e:	74a6                	ld	s1,104(sp)
 750:	7906                	ld	s2,96(sp)
 752:	69e6                	ld	s3,88(sp)
 754:	6a46                	ld	s4,80(sp)
 756:	6aa6                	ld	s5,72(sp)
 758:	6b06                	ld	s6,64(sp)
 75a:	7be2                	ld	s7,56(sp)
 75c:	7c42                	ld	s8,48(sp)
 75e:	7ca2                	ld	s9,40(sp)
 760:	7d02                	ld	s10,32(sp)
 762:	6de2                	ld	s11,24(sp)
 764:	6109                	addi	sp,sp,128
 766:	8082                	ret

0000000000000768 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 768:	715d                	addi	sp,sp,-80
 76a:	ec06                	sd	ra,24(sp)
 76c:	e822                	sd	s0,16(sp)
 76e:	1000                	addi	s0,sp,32
 770:	e010                	sd	a2,0(s0)
 772:	e414                	sd	a3,8(s0)
 774:	e818                	sd	a4,16(s0)
 776:	ec1c                	sd	a5,24(s0)
 778:	03043023          	sd	a6,32(s0)
 77c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 780:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 784:	8622                	mv	a2,s0
 786:	00000097          	auipc	ra,0x0
 78a:	e04080e7          	jalr	-508(ra) # 58a <vprintf>
}
 78e:	60e2                	ld	ra,24(sp)
 790:	6442                	ld	s0,16(sp)
 792:	6161                	addi	sp,sp,80
 794:	8082                	ret

0000000000000796 <printf>:

void
printf(const char *fmt, ...)
{
 796:	711d                	addi	sp,sp,-96
 798:	ec06                	sd	ra,24(sp)
 79a:	e822                	sd	s0,16(sp)
 79c:	1000                	addi	s0,sp,32
 79e:	e40c                	sd	a1,8(s0)
 7a0:	e810                	sd	a2,16(s0)
 7a2:	ec14                	sd	a3,24(s0)
 7a4:	f018                	sd	a4,32(s0)
 7a6:	f41c                	sd	a5,40(s0)
 7a8:	03043823          	sd	a6,48(s0)
 7ac:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7b0:	00840613          	addi	a2,s0,8
 7b4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7b8:	85aa                	mv	a1,a0
 7ba:	4505                	li	a0,1
 7bc:	00000097          	auipc	ra,0x0
 7c0:	dce080e7          	jalr	-562(ra) # 58a <vprintf>
}
 7c4:	60e2                	ld	ra,24(sp)
 7c6:	6442                	ld	s0,16(sp)
 7c8:	6125                	addi	sp,sp,96
 7ca:	8082                	ret

00000000000007cc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7cc:	1141                	addi	sp,sp,-16
 7ce:	e422                	sd	s0,8(sp)
 7d0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d6:	00001797          	auipc	a5,0x1
 7da:	82a7b783          	ld	a5,-2006(a5) # 1000 <freep>
 7de:	a805                	j	80e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7e0:	4618                	lw	a4,8(a2)
 7e2:	9db9                	addw	a1,a1,a4
 7e4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	6398                	ld	a4,0(a5)
 7ea:	6318                	ld	a4,0(a4)
 7ec:	fee53823          	sd	a4,-16(a0)
 7f0:	a091                	j	834 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7f2:	ff852703          	lw	a4,-8(a0)
 7f6:	9e39                	addw	a2,a2,a4
 7f8:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7fa:	ff053703          	ld	a4,-16(a0)
 7fe:	e398                	sd	a4,0(a5)
 800:	a099                	j	846 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 802:	6398                	ld	a4,0(a5)
 804:	00e7e463          	bltu	a5,a4,80c <free+0x40>
 808:	00e6ea63          	bltu	a3,a4,81c <free+0x50>
{
 80c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80e:	fed7fae3          	bgeu	a5,a3,802 <free+0x36>
 812:	6398                	ld	a4,0(a5)
 814:	00e6e463          	bltu	a3,a4,81c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 818:	fee7eae3          	bltu	a5,a4,80c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 81c:	ff852583          	lw	a1,-8(a0)
 820:	6390                	ld	a2,0(a5)
 822:	02059713          	slli	a4,a1,0x20
 826:	9301                	srli	a4,a4,0x20
 828:	0712                	slli	a4,a4,0x4
 82a:	9736                	add	a4,a4,a3
 82c:	fae60ae3          	beq	a2,a4,7e0 <free+0x14>
    bp->s.ptr = p->s.ptr;
 830:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 834:	4790                	lw	a2,8(a5)
 836:	02061713          	slli	a4,a2,0x20
 83a:	9301                	srli	a4,a4,0x20
 83c:	0712                	slli	a4,a4,0x4
 83e:	973e                	add	a4,a4,a5
 840:	fae689e3          	beq	a3,a4,7f2 <free+0x26>
  } else
    p->s.ptr = bp;
 844:	e394                	sd	a3,0(a5)
  freep = p;
 846:	00000717          	auipc	a4,0x0
 84a:	7af73d23          	sd	a5,1978(a4) # 1000 <freep>
}
 84e:	6422                	ld	s0,8(sp)
 850:	0141                	addi	sp,sp,16
 852:	8082                	ret

0000000000000854 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 854:	7139                	addi	sp,sp,-64
 856:	fc06                	sd	ra,56(sp)
 858:	f822                	sd	s0,48(sp)
 85a:	f426                	sd	s1,40(sp)
 85c:	f04a                	sd	s2,32(sp)
 85e:	ec4e                	sd	s3,24(sp)
 860:	e852                	sd	s4,16(sp)
 862:	e456                	sd	s5,8(sp)
 864:	e05a                	sd	s6,0(sp)
 866:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 868:	02051493          	slli	s1,a0,0x20
 86c:	9081                	srli	s1,s1,0x20
 86e:	04bd                	addi	s1,s1,15
 870:	8091                	srli	s1,s1,0x4
 872:	0014899b          	addiw	s3,s1,1
 876:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 878:	00000517          	auipc	a0,0x0
 87c:	78853503          	ld	a0,1928(a0) # 1000 <freep>
 880:	c515                	beqz	a0,8ac <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 882:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 884:	4798                	lw	a4,8(a5)
 886:	02977f63          	bgeu	a4,s1,8c4 <malloc+0x70>
 88a:	8a4e                	mv	s4,s3
 88c:	0009871b          	sext.w	a4,s3
 890:	6685                	lui	a3,0x1
 892:	00d77363          	bgeu	a4,a3,898 <malloc+0x44>
 896:	6a05                	lui	s4,0x1
 898:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 89c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a0:	00000917          	auipc	s2,0x0
 8a4:	76090913          	addi	s2,s2,1888 # 1000 <freep>
  if(p == (char*)-1)
 8a8:	5afd                	li	s5,-1
 8aa:	a88d                	j	91c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8ac:	00000797          	auipc	a5,0x0
 8b0:	76478793          	addi	a5,a5,1892 # 1010 <base>
 8b4:	00000717          	auipc	a4,0x0
 8b8:	74f73623          	sd	a5,1868(a4) # 1000 <freep>
 8bc:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8be:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8c2:	b7e1                	j	88a <malloc+0x36>
      if(p->s.size == nunits)
 8c4:	02e48b63          	beq	s1,a4,8fa <malloc+0xa6>
        p->s.size -= nunits;
 8c8:	4137073b          	subw	a4,a4,s3
 8cc:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8ce:	1702                	slli	a4,a4,0x20
 8d0:	9301                	srli	a4,a4,0x20
 8d2:	0712                	slli	a4,a4,0x4
 8d4:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8d6:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8da:	00000717          	auipc	a4,0x0
 8de:	72a73323          	sd	a0,1830(a4) # 1000 <freep>
      return (void*)(p + 1);
 8e2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e6:	70e2                	ld	ra,56(sp)
 8e8:	7442                	ld	s0,48(sp)
 8ea:	74a2                	ld	s1,40(sp)
 8ec:	7902                	ld	s2,32(sp)
 8ee:	69e2                	ld	s3,24(sp)
 8f0:	6a42                	ld	s4,16(sp)
 8f2:	6aa2                	ld	s5,8(sp)
 8f4:	6b02                	ld	s6,0(sp)
 8f6:	6121                	addi	sp,sp,64
 8f8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8fa:	6398                	ld	a4,0(a5)
 8fc:	e118                	sd	a4,0(a0)
 8fe:	bff1                	j	8da <malloc+0x86>
  hp->s.size = nu;
 900:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 904:	0541                	addi	a0,a0,16
 906:	00000097          	auipc	ra,0x0
 90a:	ec6080e7          	jalr	-314(ra) # 7cc <free>
  return freep;
 90e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 912:	d971                	beqz	a0,8e6 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 914:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 916:	4798                	lw	a4,8(a5)
 918:	fa9776e3          	bgeu	a4,s1,8c4 <malloc+0x70>
    if(p == freep)
 91c:	00093703          	ld	a4,0(s2)
 920:	853e                	mv	a0,a5
 922:	fef719e3          	bne	a4,a5,914 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 926:	8552                	mv	a0,s4
 928:	00000097          	auipc	ra,0x0
 92c:	b7e080e7          	jalr	-1154(ra) # 4a6 <sbrk>
  if(p == (char*)-1)
 930:	fd5518e3          	bne	a0,s5,900 <malloc+0xac>
        return 0;
 934:	4501                	li	a0,0
 936:	bf45                	j	8e6 <malloc+0x92>
