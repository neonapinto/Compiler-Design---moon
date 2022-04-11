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
% processing assignment: result := t3
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t2 := result * x
          lw	r2,-32(r14)
          lw	r1,-20(r14)
          mul	r3,r2,r1
          sw	-40(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t3 := t2 + b
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
% processing assignment: result := t5
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t4 := result * x
          lw	r1,-32(r14)
          lw	r2,-20(r14)
          mul	r3,r1,r2
          sw	-56(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t5 := t4 + c
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
% processing assignment: new_function.a := A
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-36(r14)
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
% processing assignment: new_function.c := C
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-52(r14)
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
          sw	offset(r0),r0
% processing: return(new_function)
          lw	r1,-80(r14)
          sw	-4(r14),r1
          lw	r15,-8(r14)
          jr	r15
% end function build definition
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
          addi	r5,r0,0
          sw	offset(r0),r0
          add	r3,r0,r5
          sw	offset(r0),r3
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
          addi	r3,r0,0
          sw	offset(r0),r0
          add	r5,r0,r3
          sw	offset(r0),r5
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
% processing assignment: result := t11
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-40(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r2
          sub	r14,r14,r1
% processing assignment: result := t13
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t12 := a * x
          lw	r2,-8(r14)
          lw	r1,-20(r14)
          mul	r5,r2,r1
          sw	-48(r14),r5
          sw	offset(r0),r0
% processing temporal(add): t13 := t12 + b
          lw	r5,-48(r14)
          lw	r1,-16(r14)
          add	r2,r5,r1
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
%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: f1 := t17
          sw	offset(r0),r0
% processing dot: f1.build
          addi	r1,r0,0
% processing literal: t15 := 2
          addi	r5,r0,2
          sw	-72(r14),r5
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r5,-72(r14)
          sw	-364(r14),r5
          lw	r5,-80(r14)
          sw	-372(r14),r5
          addi	r2,r0,312
          sw	-376(r14),r2
          addi	r14,r14,-336
          jl	r15,LINEAR_build
          subi	r14,r14,-336
          lw	r5,-340(r14)
          sw	-96(r14),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-96(r14)
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
          sw	-372(r14),r1
          lw	r1,-128(r14)
          sw	-380(r14),r1
          lw	r1,-136(r14)
          sw	-388(r14),r1
          addi	r2,r0,288
          sw	-392(r14),r2
          addi	r14,r14,-336
          jl	r15,QUADRATIC_build
          subi	r14,r14,-336
          lw	r1,-340(r14)
          sw	-160(r14),r1
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-160(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-48(r14),r1
          sub	r14,r14,r2
% processing assignment: counter := t22
% processing literal: t22 := 1
          addi	r1,r0,1
          sw	-164(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-164(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-52(r14),r2
          sub	r14,r14,r1
% processing: "while(counter<=10){ write(counter); write(f1.evaluate(counter)); write(f2.evaluate(counter)); counter=counter+1;};"
gowhile102
% processing temporal(rel): t24 := (counter <= t23)
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-52(r14)
          sub	r14,r14,r2
% processing literal: t23 := 10
          addi	r4,r0,10
          sw	-168(r14),r4
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r5,-168(r14)
          sub	r14,r14,r2
          cle	r2,r1,r5
          sw	-172(r14),r2
          lw	r5,-172(r14)
          bz	r5,endwhile102
          sw	offset(r0),r0
% processing: write(counter)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-52(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-336
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-336
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
          sw	-356(r14),r4
          addi	r1,r0,312
          sw	-360(r14),r1
          addi	r14,r14,-336
          jl	r15,LINEAR_evaluate
          subi	r14,r14,-336
          lw	r4,-340(r14)
          sw	-188(r14),r4
% processing: write(t26)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-188(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-336
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-336
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
          sw	-356(r14),r2
          addi	r1,r0,288
          sw	-360(r14),r1
          addi	r14,r14,-336
          jl	r15,QUADRATIC_evaluate
          subi	r14,r14,-336
          lw	r2,-340(r14)
          sw	-204(r14),r2
% processing: write(t28)
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-204(r14)
          sub	r14,r14,r2
     % put value on stack
          addi	r14,r14,-336
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-336
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
% processing assignment: counter := t30
          sw	offset(r0),r0
% processing literal: t29 := 1
          addi	r2,r0,1
          sw	-208(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t30 := counter + t29
          lw	r2,-52(r14)
          lw	r1,-208(r14)
          add	r4,r2,r1
          sw	-212(r14),r4
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-212(r14)
          sub	r14,r14,r4
          sw	offset(r0),r0
          lw	r4,offset(r0)
          add	r14,r14,r4
          sw	-52(r14),r1
          sub	r14,r14,r4
          j		gowhile102
endwhile102
% processing assignment: arr[0] := t35
          sw	offset(r0),r0
% processing dot: f1.evaluate
          addi	r1,r0,0
% processing literal: t34 := 1
          addi	r2,r0,1
          sw	-308(r14),r2
          sw	offset(r0),r0
% processing: function call to f1 
          lw	r2,-308(r14)
          sw	-356(r14),r2
          addi	r4,r0,312
          sw	-360(r14),r4
          addi	r14,r14,-336
          jl	r15,LINEAR_evaluate
          subi	r14,r14,-336
          lw	r2,-340(r14)
          sw	-316(r14),r2
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r2,-316(r14)
          sub	r14,r14,r4
% processing literal: t31 := 0
          addi	r1,r0,0
          sw	-280(r14),r1
          sw	offset(r0),r0
          addi	r7,r0,0
% processing offsets(mul): arr := t31 * 1
          lw	r1,-280(r14)
          muli	r3,r1,1
          sw	-296(r14),r3
% processing offsets(mul size): arr := arr * 172
          lw	r1,-296(r14)
          muli	r3,r1,172
          add	r1,r7,r3
          sw	offset(r0),r1
          lw	r4,offset(r0)
          add	r14,r14,r4
          sw	-276(r14),r2
          sub	r14,r14,r4
% processing literal: t36 := 0
          addi	r2,r0,0
          sw	-320(r14),r2
          sw	offset(r0),r0
          addi	r6,r0,0
% processing offsets(mul): arr := t36 * 1
          lw	r2,-320(r14)
          muli	r4,r2,1
          sw	-336(r14),r4
% processing offsets(mul size): arr := arr * 172
          lw	r2,-336(r14)
          muli	r4,r2,172
          add	r2,r6,r4
          sw	offset(r0),r2
% processing: write(arr)
          lw	r7,offset(r0)
          add	r14,r14,r7
          lw	r6,-276(r14)
          sub	r14,r14,r7
     % put value on stack
          addi	r14,r14,-336
          sw	-8(r14),r6
     % link buffer to stack
          addi	 r6,r0, buf
          sw	-12(r14),r6
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-336
          addi	 r6,r0, 13
          putc	 r6
          addi	 r6,r0, 10
          putc	 r6
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

