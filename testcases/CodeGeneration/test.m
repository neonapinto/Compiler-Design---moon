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
          sw	-28(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-28(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-12(r14),r1
          sub	r14,r14,r2
% processing assignment: b := t2
% processing literal: t2 := 6
          addi	r1,r0,6
          sw	-32(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-32(r14)
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
          sw	-36(r14),r3
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-36(r14)
          sub	r14,r14,r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-24(r14),r1
          sub	r14,r14,r3
          sw	offset(r0),r0
% processing: function call to printArray 
          lw	r1,-24(r14)
          sw	-288(r14),r1
          addi	r14,r14,-276
          jl	r15,printArray
          subi	r14,r14,-276
          lw	r1,-280(r14)
          sw	0(r14),r1
% processing assignment: float_arr[0] := t6
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-88(r14)
          sub	r14,r14,r3
% processing literal: t4 := 0
          addi	r2,r0,0
          sw	-72(r14),r2
          sw	offset(r0),r0
          addi	r6,r0,0
% processing offsets(mul): float_arr := t4 * 1
          lw	r2,-72(r14)
          muli	r4,r2,1
          sw	-80(r14),r4
% processing offsets(mul size): float_arr := float_arr * 8
          lw	r2,-80(r14)
          muli	r4,r2,8
          add	r2,r6,r4
          sw	offset(r0),r2
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-68(r14),r1
          sub	r14,r14,r3
% processing assignment: float_arr[1] := t9
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-108(r14)
          sub	r14,r14,r1
% processing literal: t7 := 1
          addi	r6,r0,1
          sw	-92(r14),r6
          sw	offset(r0),r0
          addi	r2,r0,0
% processing offsets(mul): float_arr := t7 * 1
          lw	r6,-92(r14)
          muli	r5,r6,1
          sw	-100(r14),r5
% processing offsets(mul size): float_arr := float_arr * 8
          lw	r6,-100(r14)
          muli	r5,r6,8
          add	r6,r2,r5
          sw	offset(r0),r6
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-68(r14),r3
          sub	r14,r14,r1
% processing assignment: float_arr[2] := t12
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-128(r14)
          sub	r14,r14,r3
% processing literal: t10 := 2
          addi	r2,r0,2
          sw	-112(r14),r2
          sw	offset(r0),r0
          addi	r6,r0,0
% processing offsets(mul): float_arr := t10 * 1
          lw	r2,-112(r14)
          muli	r4,r2,1
          sw	-120(r14),r4
% processing offsets(mul size): float_arr := float_arr * 8
          lw	r2,-120(r14)
          muli	r4,r2,8
          add	r2,r6,r4
          sw	offset(r0),r2
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-68(r14),r1
          sub	r14,r14,r3
% processing assignment: i := t13
% processing literal: t13 := 0
          addi	r1,r0,0
          sw	-152(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-152(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-148(r14),r3
          sub	r14,r14,r1
% processing assignment: arr[i+1] := t17
% processing literal: t17 := 3
          addi	r3,r0,3
          sw	-168(r14),r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-168(r14)
          sub	r14,r14,r3
          sw	offset(r0),r0
% processing literal: t14 := 1
          addi	r6,r0,1
          sw	-156(r14),r6
          sw	offset(r0),r0
% processing temporal(add): t15 := i + t14
          lw	r6,-148(r14)
          lw	r5,-156(r14)
          add	r4,r6,r5
          sw	-160(r14),r4
          addi	r2,r0,0
% processing offsets(mul): arr := t15 * 1
          lw	r4,-160(r14)
          muli	r5,r4,1
          sw	-164(r14),r5
% processing offsets(mul size): arr := arr * 4
          lw	r4,-164(r14)
          muli	r5,r4,4
          add	r4,r2,r5
          sw	offset(r0),r4
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-144(r14),r1
          sub	r14,r14,r3
% processing assignment: arr[i+2] := t21
% processing literal: t21 := 4
          addi	r1,r0,4
          sw	-184(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-184(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing literal: t18 := 2
          addi	r2,r0,2
          sw	-172(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t19 := i + t18
          lw	r2,-148(r14)
          lw	r6,-172(r14)
          add	r5,r2,r6
          sw	-176(r14),r5
          addi	r4,r0,0
% processing offsets(mul): arr := t19 * 1
          lw	r5,-176(r14)
          muli	r6,r5,1
          sw	-180(r14),r6
% processing offsets(mul size): arr := arr * 4
          lw	r5,-180(r14)
          muli	r6,r5,4
          add	r5,r4,r6
          sw	offset(r0),r5
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-144(r14),r3
          sub	r14,r14,r1
% processing assignment: arr[i+3] := t25
% processing literal: t25 := 5
          addi	r3,r0,5
          sw	-200(r14),r3
          sw	offset(r0),r0
          lw	r3,offset(r0)
          add	r14,r14,r3
          lw	r1,-200(r14)
          sub	r14,r14,r3
          sw	offset(r0),r0
% processing literal: t22 := 3
          addi	r4,r0,3
          sw	-188(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t23 := i + t22
          lw	r4,-148(r14)
          lw	r2,-188(r14)
          add	r6,r4,r2
          sw	-192(r14),r6
          addi	r5,r0,0
% processing offsets(mul): arr := t23 * 1
          lw	r6,-192(r14)
          muli	r2,r6,1
          sw	-196(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r6,-196(r14)
          muli	r2,r6,4
          add	r6,r5,r2
          sw	offset(r0),r6
          lw	r3,offset(r0)
          add	r14,r14,r3
          sw	-144(r14),r1
          sub	r14,r14,r3
% processing: "while(i<4){ write(arr[i]); i=i+1;};"
gowhile53 
% processing temporal(rel): t27 := (i < t26)
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-148(r14)
          sub	r14,r14,r1
% processing literal: t26 := 4
          addi	r4,r0,4
          sw	-204(r14),r4
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r5,-204(r14)
          sub	r14,r14,r1
          clt	r1,r3,r5
          sw	-208(r14),r1
          lw	r5,-208(r14)
          bz	r5,endwhile53
          sw	offset(r0),r0
          addi	r2,r0,0
% processing offsets(mul): arr := i * 1
          lw	r3,-148(r14)
          muli	r1,r3,1
          sw	-212(r14),r1
% processing offsets(mul size): arr := arr * 4
          lw	r3,-212(r14)
          muli	r1,r3,4
          add	r3,r2,r1
          sw	offset(r0),r3
% processing: write(arr)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r2,-144(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-276
          sw	-8(r14),r2
     % link buffer to stack
          addi	 r2,r0, buf
          sw	-12(r14),r2
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-276
          addi	 r2,r0, 13
          putc	 r2
          addi	 r2,r0, 10
          putc	 r2
% processing assignment: i := t30
          sw	offset(r0),r0
% processing literal: t29 := 1
          addi	r4,r0,1
          sw	-216(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t30 := i + t29
          lw	r4,-148(r14)
          lw	r2,-216(r14)
          add	r1,r4,r2
          sw	-220(r14),r1
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-220(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-148(r14),r2
          sub	r14,r14,r1
          j		gowhile53
endwhile53
% processing assignment: result := t31
% processing literal: t31 := 2
          addi	r2,r0,2
          sw	-228(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-228(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-224(r14),r1
          sub	r14,r14,r2
% processing assignment: c := t32
% processing literal: t32 := 1
          addi	r1,r0,1
          sw	-232(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-232(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-20(r14),r2
          sub	r14,r14,r1
% processing temporal(rel): t37 := (t35 < t36)
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t33 := a * b
          lw	r2,-12(r14)
          lw	r1,-16(r14)
          mul	r4,r2,r1
          sw	-236(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t34 := t33 - a
          lw	r4,-236(r14)
          lw	r1,-12(r14)
          sub	r2,r4,r1
          sw	-240(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t35 := t34 + c
          lw	r2,-240(r14)
          lw	r1,-20(r14)
          add	r4,r2,r1
          sw	-244(r14),r4
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-244(r14)
          sub	r14,r14,r4
% processing literal: t36 := 5
          addi	r3,r0,5
          sw	-248(r14),r3
          sw	offset(r0),r0
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r2,-248(r14)
          sub	r14,r14,r4
          clt	r4,r1,r2
          sw	-252(r14),r4
% processing: "if(a*b-a+!c<5)then { write(a*b+10);} else write(a*b-a+!c);;"
          lw	r2,-252(r14)
          bz	r2,else61
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t38 := a * b
          lw	r1,-12(r14)
          lw	r4,-16(r14)
          mul	r3,r1,r4
          sw	-256(r14),r3
% processing literal: t39 := 10
          addi	r3,r0,10
          sw	-260(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t40 := t38 + t39
          lw	r3,-256(r14)
          lw	r4,-260(r14)
          add	r1,r3,r4
          sw	-264(r14),r1
% processing: write(t40)
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r1,-264(r14)
          sub	r14,r14,r4
     % put value on stack
          addi	r14,r14,-276
          sw	-8(r14),r1
     % link buffer to stack
          addi	 r1,r0, buf
          sw	-12(r14),r1
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-276
          addi	 r1,r0, 13
          putc	 r1
          addi	 r1,r0, 10
          putc	 r1
          j		endif61
else61    
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(mul): t41 := a * b
          lw	r4,-12(r14)
          lw	r1,-16(r14)
          mul	r3,r4,r1
          sw	-268(r14),r3
          sw	offset(r0),r0
% processing temporal(add): t42 := t41 - a
          lw	r3,-268(r14)
          lw	r1,-12(r14)
          sub	r4,r3,r1
          sw	-272(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t43 := t42 + c
          lw	r4,-272(r14)
          lw	r1,-20(r14)
          add	r3,r4,r1
          sw	-276(r14),r3
% processing: write(t43)
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-276(r14)
          sub	r14,r14,r1
     % put value on stack
          addi	r14,r14,-276
          sw	-8(r14),r3
     % link buffer to stack
          addi	 r3,r0, buf
          sw	-12(r14),r3
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-276
          addi	 r3,r0, 13
          putc	 r3
          addi	 r3,r0, 10
          putc	 r3
endif61   
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

