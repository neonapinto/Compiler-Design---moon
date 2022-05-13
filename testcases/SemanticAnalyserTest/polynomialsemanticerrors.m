% processing function definition: evaluate
POLYNOMIAL_evaluate
          sw	-8(r14),r15
% processing literal: t1 := 0
          addi	r2,r0,0
          sw	-28(r14),r2
          sw	offset(r0),r0
% processing: return(t1)
          lw	r1,-28(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function evaluate definition
% processing function definition: build
LINEAR_build
          sw	-8(r14),r15
% processing assignment: new_function.a := A
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-28(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: new_function.a
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-56(r14),r2
          sub	r14,r14,r1
% processing assignment: new_function.b := B
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-36(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: new_function.b
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-56(r14),r1
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing: return(new_function)
          lw	r1,-56(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function build definition
% processing function definition: evaluate
LINEAR_evaluate
          sw	-8(r14),r15
% processing assignment: result := t4
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-40(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
% processing assignment: result := t6
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t5 := a * x
          lw	r2,-8(r14)
          lw	r1,-20(r14)
          mul	r3,r2,r1
          sw	-48(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t6 := t5 + b
          lw	r3,-48(r14)
          lw	r1,-16(r14)
          add	r2,r3,r1
          sw	-56(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-56(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-32(r14),r1
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing: return(result)
          lw	r1,-32(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function evaluate definition
% processing function definition: evaluate
QUADRATIC_evaluate
          sw	-8(r14),r15
% processing assignment: result := a
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-8(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
% processing assignment: result := t8
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t7 := result * x
          lw	r2,-32(r14)
          lw	r1,-20(r14)
          mul	r3,r2,r1
          sw	-40(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t8 := t7 + b
          lw	r3,-40(r14)
          lw	r1,-16(r14)
          add	r2,r3,r1
          sw	-48(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-48(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-32(r14),r1
          sub	r14,r14,r2
% processing assignment: result := t10
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t9 := result * x
          lw	r1,-32(r14)
          lw	r2,-20(r14)
          mul	r3,r1,r2
          sw	-56(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t10 := t9 + c
          lw	r3,-56(r14)
          lw	r2,-24(r14)
          add	r1,r3,r2
          sw	-64(r14),r1
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-64(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing: return(result)
          lw	r2,-32(r14)
          sw	-4(r14),r2
          lw	r15,-8(r14)
          jr	r15
% end function evaluate definition
% processing function definition: build
QUADRATIC_build
          sw	-8(r14),r15
% processing assignment: new_function.a := t14
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing literal: t12 := 3
          addi	r2,r0,3
          sw	-92(r14),r2
          sw	offset(r0),r0
% processing temporal(mul): t13 := B * t12
          lw	r2,-44(r14)
          lw	r1,-92(r14)
          mul	r3,r2,r1
          sw	-92(r14),r3
% processing temporal(add): t14 := A + t13
          lw	r3,-36(r14)
          lw	r1,-92(r14)
          add	r2,r3,r1
          sw	-92(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-92(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: new_function.a
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-80(r14),r1
          sub	r14,r14,r2
% processing assignment: new_function.b := B
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-44(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: new_function.b
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-80(r14),r2
          sub	r14,r14,r1
% processing assignment: new_function.c := t17
% processing literal: t17 := 1
          addi	r2,r0,1
          sw	-112(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-112(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: new_function.c
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-80(r14),r1
          sub	r14,r14,r2
% processing literal: t18 := 1
          addi	r2,r0,1
          sw	-116(r14),r2
          sw	offset(r0),r0
% processing: return(t18)
          lw	r1,-116(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function build definition
% processing function definition: build2
global    
          sw	-8(r14),r15
% processing assignment: new_function.a := A
          sw	offset(r0),r0
          lw	r1,offset(r0)
          sw	offset(r0),r0
% processing dot: new_function.a
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-100(r14),r2
          sub	r14,r14,r1
% processing assignment: new_function.b := B
          sw	offset(r0),r0
          lw	r2,offset(r0)
          sw	offset(r0),r0
% processing dot: new_function.b
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-100(r14),r1
          sub	r14,r14,r2
% processing assignment: new_function.c := C
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-76(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: new_function.c
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-100(r14),r2
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing: return(new_function)
          lw	r2,-100(r14)
          sw	-4(r14),r2
          lw	r15,-8(r14)
          jr	r15
% end function build2 definition
% processing function definition: f
f         
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function f definition
% processing function definition: f
f         
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function f definition
% processing function definition: f
f         
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function f definition
% processing function definition: f3
f3        
          sw	-8(r14),r15
          lw	r15,-8(r14)
          jr	r15
% end function f3 definition
%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: f1 := t25
          sw	offset(r0),r0
% processing dot: f1.build
          addi	r2,r0,0
% processing literal: t23 := 2
          addi	r3,r0,2
          sw	-124(r14),r3
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r3,-124(r14)
          sw	-360(r14),r3
          lw	r3,-132(r14)
          sw	-368(r14),r3
          addi	r1,r0,304
          sw	-372(r14),r1
          addi	r14,r14,-332
          jl	r15,LINEAR_build
          subi	r14,r14,-332
          lw	r3,-336(r14)
          sw	-148(r14),r3
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-148(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-28(r14),r3
          sub	r14,r14,r1
% processing assignment: f2 := t29
          sw	offset(r0),r0
% processing dot: f2.build
          addi	r3,r0,0
% processing: function call to f2 
          lw	r2,0(r14)
          sw	-368(r14),r2
          lw	r2,-180(r14)
          sw	-376(r14),r2
          lw	r2,-188(r14)
          sw	-384(r14),r2
          addi	r1,r0,280
          sw	-388(r14),r1
          addi	r14,r14,-332
          jl	r15,QUADRATIC_build
          subi	r14,r14,-332
          lw	r2,-336(r14)
          sw	-212(r14),r2
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-212(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-52(r14),r2
          sub	r14,r14,r1
% processing assignment: c.b := t30
% processing literal: t30 := 1
          addi	r2,r0,1
          sw	-216(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-216(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: c.b
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-12(r14),r1
          sub	r14,r14,r2
% processing assignment: r := t31
% processing literal: t31 := 5
          addi	r1,r0,5
          sw	-220(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-220(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
% processing assignment: counter := 
          sw	offset(r0),r0
% processing dot: c.f
          addi	r2,r0,0
% processing: function call to c 
          addi	r1,r0,320
          addi	r14,r14,-332
          jl	r15,
          subi	r14,r14,-332
          lw	r5,-336(r14)
          sw	0(r14),r5
          lw	r1,offset(r0)
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-56(r14),r5
          sub	r14,r14,r1
% processing: function call to undefined 
          addi	r14,r14,-332
          jl	r15,undefined
          subi	r14,r14,-332
          lw	r5,-336(r14)
          sw	0(r14),r5
% processing assignment: counter := r
          sw	offset(r0),r0
          lw	r1,offset(r0)
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-56(r14),r5
          sub	r14,r14,r1
% processing literal: t32 := 1
          addi	r5,r0,1
          sw	-224(r14),r5
          sw	offset(r0),r0
% processing literal: t33 := 1
          addi	r5,r0,1
          sw	-228(r14),r5
          sw	offset(r0),r0
% processing literal: t34 := 1
          addi	r5,r0,1
          sw	-232(r14),r5
          sw	offset(r0),r0
% processing: function call to f 
          lw	r5,-224(r14)
          sw	-344(r14),r5
          lw	r5,-228(r14)
          sw	-348(r14),r5
          lw	r5,-232(r14)
          addi	r14,r14,-332
          jl	r15,f
          subi	r14,r14,-332
          lw	r5,-336(r14)
          sw	-236(r14),r5
% processing literal: t37 := 1
          addi	r1,r0,1
          sw	-248(r14),r1
          sw	offset(r0),r0
% processing: function call to f 
          lw	r1,-244(r14)
          sw	-344(r14),r1
          lw	r1,-248(r14)
          sw	-348(r14),r1
          addi	r14,r14,-332
          jl	r15,f
          subi	r14,r14,-332
          lw	r1,-336(r14)
          sw	-252(r14),r1
% processing assignment: i[2] := t41
% processing literal: t41 := 1
          addi	r5,r0,1
          sw	-264(r14),r5
          sw	offset(r0),r0
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r1,-264(r14)
          sub	r14,r14,r5
% processing literal: t39 := 2
          addi	r2,r0,2
          sw	-256(r14),r2
          sw	offset(r0),r0
          addi	r6,r0,0
% processing offsets(mul size): i := i * 4
          lw	r2,-260(r14)
          muli	r4,r2,4
          add	r2,r6,r4
          sw	offset(r0),r2
          lw	r5,offset(r0)
          add	r14,r14,r5
          sw	-80(r14),r1
          sub	r14,r14,r5
% processing assignment: i[2][1.3] := t45
% processing literal: t45 := 2
          addi	r1,r0,2
          sw	-284(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r5,-284(r14)
          sub	r14,r14,r1
% processing literal: t42 := 2
          addi	r6,r0,2
          sw	-268(r14),r6
          sw	offset(r0),r0
          addi	r2,r0,0
% processing offsets(mul): i := t42 * 3
          lw	r6,-268(r14)
          muli	r3,r6,3
          sw	-280(r14),r3
% processing offsets(mul): i := t43 * 1
          lw	r6,-276(r14)
          muli	r3,r6,1
% processing offsets(add): i := t43 * 1
          lw	r6,-280(r14)
          add	r4,r3,r6
          sw	-280(r14),r4
% processing offsets(mul size): i := i * 4
          lw	r6,-280(r14)
          muli	r3,r6,4
          add	r6,r2,r3
          sw	offset(r0),r6
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-80(r14),r5
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing: function call to f3 
          addi	r5,r0,228
          sw	-344(r14),r5
          addi	r14,r14,-332
          jl	r15,f3
          subi	r14,r14,-332
          lw	r5,-336(r14)
          sw	-288(r14),r5
% processing assignment: counter.x := t47
% processing literal: t47 := 1
          addi	r1,r0,1
          sw	-292(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r5,-292(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: counter.x
          addi	r2,r0,0
          sw	offset(r0),r0
          add	r3,r0,r2
          sw	offset(r0),r3
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-56(r14),r5
          sub	r14,r14,r1
% processing: "while(counter<=10){ write(counter); write(f1.evaluate(counter)); write(f2.evaluate(counter));};"
gowhile125
% processing temporal(rel): t49 := (counter <= t48)
          sw	offset(r0),r0
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r1,-56(r14)
          sub	r14,r14,r5
% processing literal: t48 := 10
          addi	r4,r0,10
          sw	-296(r14),r4
          sw	offset(r0),r0
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r3,-296(r14)
          sub	r14,r14,r5
          cle	r5,r1,r3
          sw	-300(r14),r5
          lw	r3,-300(r14)
          bz	r3,endwhile125
          sw	offset(r0),r0
% processing: write(counter)
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r1,-56(r14)
          sub	r14,r14,r5
     % put value on stack
          addi	r14,r14,-332
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-332
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          sw	offset(r0),r0
% processing dot: f1.evaluate
          addi	r5,r0,0
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r4,-56(r14)
          sw	-352(r14),r4
          addi	r1,r0,304
          sw	-356(r14),r1
          addi	r14,r14,-332
          jl	r15,LINEAR_evaluate
          subi	r14,r14,-332
          lw	r4,-336(r14)
          sw	-316(r14),r4
% processing: write(t51)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-316(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-332
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-332
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          sw	offset(r0),r0
% processing dot: f2.evaluate
          addi	r4,r0,0
          sw	offset(r0),r0
% processing: function call to f2 
          lw	r5,-56(r14)
          sw	-352(r14),r5
          addi	r1,r0,280
          sw	-356(r14),r1
          addi	r14,r14,-332
          jl	r15,QUADRATIC_evaluate
          subi	r14,r14,-332
          lw	r5,-336(r14)
          sw	-332(r14),r5
% processing: write(t53)
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r1,-332(r14)
          sub	r14,r14,r5
     % put value on stack
          addi	r14,r14,-332
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-332
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          j		gowhile125
endwhile125
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

