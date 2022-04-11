% processing function definition: evaluate
POLYNOMIAL_evaluate
          sw	-8(r14),r15
% processing: return(t1)
          lw	r1,-32(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function evaluate definition
% processing function definition: evaluate
LINEAR_evaluate
          sw	-8(r14),r15
% processing assignment: result := t2
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-40(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
% processing assignment: result := t4
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t3 := a * x
          lw	r2,-8(r14)
          lw	r1,-20(r14)
          mul	r3,r2,r1
          sw	-48(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t4 := t3 + b
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
% processing function definition: build
QUADRATIC_build
          sw	-8(r14),r15
% processing assignment: new_function.a := A
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-36(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: new_function.a
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-80(r14),r2
          sub	r14,r14,r1
% processing assignment: new_function.b := B
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-44(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
% processing dot: new_function.b
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-80(r14),r1
          sub	r14,r14,r2
% processing assignment: new_function.c := C
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-52(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing dot: new_function.c
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-80(r14),r2
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing: return(new_function)
          lw	r2,-80(r14)
          sw	-4(r14),r2
          lw	r15,-8(r14)
          jr	r15
% end function build definition
% processing function definition: evaluate
QUADRATIC_evaluate
          sw	-8(r14),r15
% processing assignment: result := a
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-8(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-32(r14),r1
          sub	r14,r14,r2
% processing assignment: result := t11
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t10 := result * x
          lw	r1,-32(r14)
          lw	r2,-20(r14)
          mul	r5,r1,r2
          sw	-40(r14),r5
          sw	offset(r0),r0
% processing temporal(add): t11 := t10 + b
          lw	r5,-40(r14)
          lw	r2,-16(r14)
          add	r1,r5,r2
          sw	-48(r14),r1
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-48(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
% processing assignment: result := t13
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t12 := result * x
          lw	r2,-32(r14)
          lw	r1,-20(r14)
          mul	r5,r2,r1
          sw	-56(r14),r5
          sw	offset(r0),r0
% processing temporal(add): t13 := t12 + c
          lw	r5,-56(r14)
          lw	r1,-24(r14)
          add	r2,r5,r1
          sw	-64(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-64(r14)
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
%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: f1 := t17
          sw	offset(r0),r0
% processing dot: f1.build
          addi	r1,r0,0
% processing: function call to f1 
          lw	r5,-76(r14)
          sw	-244(r14),r5
          lw	r5,-84(r14)
          sw	-252(r14),r5
          addi	r2,r0,192
          sw	-256(r14),r2
          addi	r14,r14,-216
          jl	r15,LINEAR_build
          subi	r14,r14,-216
          lw	r5,-220(r14)
          sw	-100(r14),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-100(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-24(r14),r5
          sub	r14,r14,r2
% processing assignment: f2 := t21
          sw	offset(r0),r0
% processing dot: f2.build
          addi	r5,r0,0
% processing: function call to f2 
          lw	r1,0(r14)
          sw	-252(r14),r1
          lw	r1,-132(r14)
          sw	-260(r14),r1
          lw	r1,-140(r14)
          sw	-268(r14),r1
          addi	r2,r0,168
          sw	-272(r14),r2
          addi	r14,r14,-216
          jl	r15,QUADRATIC_build
          subi	r14,r14,-216
          lw	r1,-220(r14)
          sw	-164(r14),r1
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-164(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-48(r14),r1
          sub	r14,r14,r2
% processing assignment: counter := t22
% processing literal: t22 := 1
          addi	r1,r0,1
          sw	-168(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-168(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-52(r14),r2
          sub	r14,r14,r1
% processing: "while(counter<=10){ write(counter); write(f1.evaluate(counter)); write(f2.evaluate(counter)); counter=counter+1;};"
gowhile79 
% processing temporal(rel): t24 := (counter <= t23)
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-52(r14)
          sub	r14,r14,r2
% processing literal: t23 := 10
          addi	r4,r0,10
          sw	-172(r14),r4
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-172(r14)
          sub	r14,r14,r2
          cle	r2,r1,r5
          sw	-176(r14),r2
          lw	r5,-176(r14)
          bz	r5,endwhile79
          sw	offset(r0),r0
% processing: write(counter)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-52(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-216
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-216
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          sw	offset(r0),r0
% processing dot: f1.evaluate
          addi	r2,r0,0
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r4,-52(r14)
          sw	-236(r14),r4
          addi	r1,r0,192
          sw	-240(r14),r1
          addi	r14,r14,-216
          jl	r15,LINEAR_evaluate
          subi	r14,r14,-216
          lw	r4,-220(r14)
          sw	-192(r14),r4
% processing: write(t26)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-192(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-216
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-216
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          sw	offset(r0),r0
% processing dot: f2.evaluate
          addi	r4,r0,0
          sw	offset(r0),r0
% processing: function call to f2 
          lw	r2,-52(r14)
          sw	-236(r14),r2
          addi	r1,r0,168
          sw	-240(r14),r1
          addi	r14,r14,-216
          jl	r15,QUADRATIC_evaluate
          subi	r14,r14,-216
          lw	r2,-220(r14)
          sw	-208(r14),r2
% processing: write(t28)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-208(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-216
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-216
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
% processing assignment: counter := t30
          sw	offset(r0),r0
% processing literal: t29 := 1
          addi	r2,r0,1
          sw	-212(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t30 := counter + t29
          lw	r2,-52(r14)
          lw	r1,-212(r14)
          add	r4,r2,r1
          sw	-216(r14),r4
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-216(r14)
          sub	r14,r14,r4
          sw	offset(r0),r0
          lw	r4,offset(r0)
          add	r14,r14,r4
          sw	-52(r14),r1
          sub	r14,r14,r4
          j		gowhile79
endwhile79
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

