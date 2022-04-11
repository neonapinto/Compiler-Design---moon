% processing function definition: 
          
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function  definition
% processing function definition: 
          
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function  definition
% processing function definition: 
          
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function  definition
% processing function definition: 
          
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function  definition
% processing function definition: 
          
          sw	-8(r14),r15
% processing assignment: f1 := t4
          sw	offset(r0),r0
% processing dot: f1.build
          addi	r1,r0,0
% processing literal: t2 := 2
          addi	r3,r0,2
          sw	-24(r14),r3
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r3,-24(r14)
          sw	-220(r14),r3
          lw	r3,-32(r14)
          sw	-224(r14),r3
          addi	r2,r0,200
          sw	-232(r14),r2
          addi	r14,r14,-200
          jl	r15,
          subi	r14,r14,-200
          lw	r3,-204(r14)
          sw	-48(r14),r3
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r3,-48(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
% processing assignment: f2 := t8
          sw	offset(r0),r0
% processing dot: f2.build
          addi	r3,r0,0
% processing: function call to f2 
          lw	r1,0(r14)
          sw	-220(r14),r1
          lw	r1,-64(r14)
          sw	-224(r14),r1
          lw	r1,-72(r14)
          sw	-232(r14),r1
          addi	r2,r0,200
          sw	-248(r14),r2
          addi	r14,r14,-200
          jl	r15,
          subi	r14,r14,-200
          lw	r1,-204(r14)
          sw	-80(r14),r1
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-80(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
% processing assignment: c.b := t9
% processing literal: t9 := 1
          addi	r1,r0,1
          sw	-84(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-84(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: c.b
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r1,offset(r0)
% processing assignment: r := t10
% processing literal: t10 := 5
          addi	r2,r0,5
          sw	-88(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-88(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
% processing assignment: counter := 
          sw	offset(r0),r0
% processing dot: c.f
          addi	r1,r0,0
% processing: function call to c 
          addi	r2,r0,200
          sw	-220(r14),r2
          addi	r14,r14,-200
          jl	r15,
          subi	r14,r14,-200
          lw	r5,-204(r14)
          sw	0(r14),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,0(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
% processing: function call to undefined 
          addi	r14,r14,-200
          jl	r15,undefined
          subi	r14,r14,-200
          lw	r5,-204(r14)
          sw	0(r14),r5
% processing assignment: counter := r
          sw	offset(r0),r0
          lw	r2,offset(r0)
          sw	offset(r0),r0
          lw	r2,offset(r0)
% processing literal: t11 := 1
          addi	r5,r0,1
          sw	-92(r14),r5
          sw	offset(r0),r0
% processing literal: t12 := 1
          addi	r5,r0,1
          sw	-96(r14),r5
          sw	offset(r0),r0
% processing literal: t13 := 1
          addi	r5,r0,1
          sw	-100(r14),r5
          sw	offset(r0),r0
% processing: function call to f 
          lw	r5,-92(r14)
          lw	r5,-96(r14)
          lw	r5,-100(r14)
          addi	r14,r14,-200
          jl	r15,f
          subi	r14,r14,-200
          lw	r5,-204(r14)
          sw	-104(r14),r5
% processing literal: t16 := 1
          addi	r2,r0,1
          sw	-116(r14),r2
          sw	offset(r0),r0
% processing: function call to f 
          lw	r2,-112(r14)
          lw	r2,-116(r14)
          addi	r14,r14,-200
          jl	r15,f
          subi	r14,r14,-200
          lw	r2,-204(r14)
          sw	-120(r14),r2
% processing assignment: i[2] := t20
% processing literal: t20 := 1
          addi	r5,r0,1
          sw	-132(r14),r5
          sw	offset(r0),r0
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r2,-132(r14)
          sub	r14,r14,r5
% processing literal: t18 := 2
          addi	r1,r0,2
          sw	-124(r14),r1
          sw	offset(r0),r0
          addi	r6,r0,0
% processing offsets(mul): i := t18 * 1
          lw	r1,-124(r14)
          muli	r4,r1,1
          sw	-128(r14),r4
% processing offsets(mul size): i := i * 4
          lw	r1,-128(r14)
          muli	r4,r1,4
          add	r1,r6,r4
          sw	offset(r0),r1
          lw	r5,offset(r0)
% processing assignment: i[2][1.3] := t24
% processing literal: t24 := 2
          addi	r2,r0,2
          sw	-152(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-152(r14)
          sub	r14,r14,r2
% processing literal: t21 := 2
          addi	r6,r0,2
          sw	-136(r14),r6
          sw	offset(r0),r0
          addi	r1,r0,0
% processing offsets(mul size): i := i * 4
          lw	r6,-148(r14)
          muli	r3,r6,4
          add	r6,r1,r3
          sw	offset(r0),r6
          lw	r2,offset(r0)
          sw	offset(r0),r0
% processing: function call to f3 
          lw	r5,0(r14)
          addi	r14,r14,-200
          jl	r15,f3
          subi	r14,r14,-200
          lw	r5,-204(r14)
          sw	-156(r14),r5
% processing assignment: counter.x := t26
% processing literal: t26 := 1
          addi	r2,r0,1
          sw	-160(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-160(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: counter.x
          addi	r1,r0,0
          sw	offset(r0),r0
          add	r3,r0,r1
          sw	offset(r0),r3
          lw	r2,offset(r0)
% processing: "while(counter<=10){ write(counter); write(f1.evaluate(counter)); write(f2.evaluate(counter));};"
gowhile125
% processing temporal(rel): t28 := (counter <= t27)
          sw	offset(r0),r0
          lw	r5,offset(r0)
% processing literal: t27 := 10
          addi	r4,r0,10
          sw	-164(r14),r4
          sw	offset(r0),r0
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r3,-164(r14)
          sub	r14,r14,r5
          cle	r5,r2,r3
          sw	-168(r14),r5
          lw	r3,-168(r14)
          bz	r3,endwhile125
          sw	offset(r0),r0
% processing: write(counter)
          lw	r5,offset(r0)
     % put value on stack
          addi	r14,r14,-200
          sw	-8(r14),r2
     % link buffer to stack
          addi	 r2,r0, buf
          sw	-12(r14),r2
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-200
          addi	 r2,r0, 13
          putc	 r2
          addi	 r2,r0, 10
          putc	 r2
          sw	offset(r0),r0
% processing dot: f1.evaluate
          addi	r5,r0,0
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r4,0(r14)
          sw	-220(r14),r4
          addi	r2,r0,200
          sw	-224(r14),r2
          addi	r14,r14,-200
          jl	r15,
          subi	r14,r14,-200
          lw	r4,-204(r14)
          sw	-184(r14),r4
% processing: write(t30)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r2,-184(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-200
          sw	-8(r14),r2
     % link buffer to stack
          addi	 r2,r0, buf
          sw	-12(r14),r2
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-200
          addi	 r2,r0, 13
          putc	 r2
          addi	 r2,r0, 10
          putc	 r2
          sw	offset(r0),r0
% processing dot: f2.evaluate
          addi	r4,r0,0
          sw	offset(r0),r0
% processing: function call to f2 
          lw	r5,0(r14)
          sw	-220(r14),r5
          addi	r2,r0,200
          sw	-224(r14),r2
          addi	r14,r14,-200
          jl	r15,
          subi	r14,r14,-200
          lw	r5,-204(r14)
          sw	-200(r14),r5
% processing: write(t32)
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r2,-200(r14)
          sub	r14,r14,r5
     % put value on stack
          addi	r14,r14,-200
          sw	-8(r14),r2
     % link buffer to stack
          addi	 r2,r0, buf
          sw	-12(r14),r2
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-200
          addi	 r2,r0, 13
          putc	 r2
          addi	 r2,r0, 10
          putc	 r2
          j		gowhile125
endwhile125
          lw	r15,-8(r14)
          jr	r15
% end function  definition

offset    res 4

