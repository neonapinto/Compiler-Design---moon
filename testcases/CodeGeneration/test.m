% processing function definition: printArray
printArray
          sw	-8(r14),r15
          sw	offset(r0),r0
% processing: write(res)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-12(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-12
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-12
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          lw	r15,-8(r14)
          jr	r15
% end function printArray definition
%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: a := t1
% processing literal: t1 := 4
          addi	r2,r0,4
          sw	-24(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-24(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-12(r14),r1
          sub	r14,r14,r2
% processing assignment: b := t2
% processing literal: t2 := 6
          addi	r1,r0,6
          sw	-28(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-28(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-16(r14),r2
          sub	r14,r14,r1
% processing assignment: res := t3
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(add): t3 := a + b
          lw	r2,-12(r14)
          lw	r1,-16(r14)
          add	r3,r2,r1
          sw	-32(r14),r3
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-32(r14)
          sub	r14,r14,r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-20(r14),r1
          sub	r14,r14,r3
          sw	offset(r0),r0
% processing: function call to printArray 
          lw	r1,-20(r14)
          sw	-44(r14),r1
          addi	r14,r14,-32
          jl	r15,printArray
          subi	r14,r14,-32
          lw	r1,-36(r14)
          sw	0(r14),r1
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

