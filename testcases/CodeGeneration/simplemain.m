%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: y := t5
% processing literal: t1 := 1
          addi	r1,r0,1
          sw	-24(r14),r1
          sw	offset(r0),r0
% processing literal: t2 := 2
          addi	r1,r0,2
          sw	-28(r14),r1
          sw	offset(r0),r0
% processing literal: t3 := 3
          addi	r1,r0,3
          sw	-32(r14),r1
          sw	offset(r0),r0
% processing temporal(mul): t4 := t2 * t3
          lw	r1,-28(r14)
          lw	r2,-32(r14)
          mul	r3,r1,r2
          sw	-36(r14),r3
% processing temporal(add): t5 := t1 + t4
          lw	r3,-24(r14)
          lw	r2,-36(r14)
          add	r1,r3,r2
          sw	-40(r14),r1
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-40(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-16(r14),r2
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing: read(x)
     % ask for x
          addi	r2,r0,entx
          addi	r14,r14,-88
          sw	-8(r14),r2
          jl	r15, putstr
          subi	r14,r14,-88
     % link buffer to stack
          addi	r14,r14,-88
          addi	r2,r0, buf
          sw	-8(r14),r2
     % read a string from stdin
          jl	r15, getstr
     % convert string to integer
          jl	r15, strint
     % store x
          subi	r14,r14,-88
          sw	-12(r14),r13
% processing temporal(rel): t8 := (x > t7)
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-12(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing literal: t6 := 10
          addi	r4,r0,10
          sw	-44(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t7 := y + t6
          lw	r4,-16(r14)
          lw	r5,-44(r14)
          add	r6,r4,r5
          sw	-48(r14),r6
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r3,-48(r14)
          sub	r14,r14,r2
          cgt	r2,r1,r3
          sw	-52(r14),r2
% processing: "if(x>y+10)then { write(x+10);} else write(x+1);;"
          lw	r3,-52(r14)
          bz	r3,else32
          sw	offset(r0),r0
% processing literal: t9 := 10
          addi	r1,r0,10
          sw	-56(r14),r1
          sw	offset(r0),r0
% processing temporal(add): t10 := x + t9
          lw	r1,-12(r14)
          lw	r2,-56(r14)
          add	r6,r1,r2
          sw	-60(r14),r6
% processing: write(t10)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r6,-60(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-88
          sw	-8(r14),r6
     % link buffer to stack
          addi	 r6,r0, buf
          sw	-12(r14),r6
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-88
          addi	 r6,r0, 13
          putc	 r6
          addi	 r6,r0, 10
          putc	 r6
          j		endif32
else32    
          sw	offset(r0),r0
% processing literal: t11 := 1
          addi	r2,r0,1
          sw	-64(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t12 := x + t11
          lw	r2,-12(r14)
          lw	r6,-64(r14)
          add	r1,r2,r6
          sw	-68(r14),r1
% processing: write(t12)
          lw	r6,offset(r0)
          add	r14,r14,r6
          lw	r1,-68(r14)
          sub	r14,r14,r6
     % put value on stack
          addi	r14,r14,-88
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-88
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
endif32   
% processing assignment: z := t13
% processing literal: t13 := 0
          addi	r3,r0,0
          sw	-72(r14),r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r6,-72(r14)
          sub	r14,r14,r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-20(r14),r6
          sub	r14,r14,r3
% processing: "while(z<=10){ write(z); z=z+1;};"
gowhile39 
% processing temporal(rel): t15 := (z <= t14)
          sw	offset(r0),r0
          lw	r6,offset(r0)
          add	r14,r14,r6
          lw	r3,-20(r14)
          sub	r14,r14,r6
% processing literal: t14 := 10
          addi	r2,r0,10
          sw	-76(r14),r2
          sw	offset(r0),r0
          lw	r6,offset(r0)
          add	r14,r14,r6
          lw	r1,-76(r14)
          sub	r14,r14,r6
          cle	r6,r3,r1
          sw	-80(r14),r6
          lw	r1,-80(r14)
          bz	r1,endwhile39
          sw	offset(r0),r0
% processing: write(z)
          lw	r6,offset(r0)
          add	r14,r14,r6
          lw	r3,-20(r14)
          sub	r14,r14,r6
     % put value on stack
          addi	r14,r14,-88
          sw	-8(r14),r3
     % link buffer to stack
          addi	 r3,r0, buf
          sw	-12(r14),r3
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-88
          addi	 r3,r0, 13
          putc	 r3
          addi	 r3,r0, 10
          putc	 r3
% processing assignment: z := t17
          sw	offset(r0),r0
% processing literal: t16 := 1
          addi	r6,r0,1
          sw	-84(r14),r6
          sw	offset(r0),r0
% processing temporal(add): t17 := z + t16
          lw	r6,-20(r14)
          lw	r3,-84(r14)
          add	r2,r6,r3
          sw	-88(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r3,-88(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-20(r14),r3
          sub	r14,r14,r2
          j		gowhile39
endwhile39
          hlt

% -----------------------------------------------------------------------

offset    res 4
entx      db	"Enter x: ", 0
% buffer space used for console output
buf       res 20

