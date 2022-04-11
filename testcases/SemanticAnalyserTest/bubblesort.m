% processing function definition: bubbleSort
bubbleSort
          sw	-8(r14),r15
% processing assignment: n := size
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-16(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-20(r14),r2
          sub	r14,r14,r1
% processing assignment: i := t1
% processing literal: t1 := 0
          addi	r2,r0,0
          sw	-36(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-36(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-24(r14),r1
          sub	r14,r14,r2
% processing assignment: j := t2
% processing literal: t2 := 0
          addi	r1,r0,0
          sw	-40(r14),r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-40(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-28(r14),r2
          sub	r14,r14,r1
% processing assignment: temp := t3
% processing literal: t3 := 0
          addi	r2,r0,0
          sw	-44(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-44(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-32(r14),r1
          sub	r14,r14,r2
% processing: "while(i<n-1){ while(j<n-i-1){ if(arr[j]>arr[j+1])then { temp=arr[j]; arr[j]=arr[j+1]; arr[j+1]=temp;} else; j=j+1;}; i=i+1;};"
gowhile12 
% processing temporal(rel): t6 := (i < t5)
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r2,-24(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
% processing literal: t4 := 1
          addi	r4,r0,1
          sw	-48(r14),r4
          sw	offset(r0),r0
% processing temporal(add): t5 := n - t4
          lw	r4,-20(r14)
          lw	r5,-48(r14)
          sub	r6,r4,r5
          sw	-52(r14),r6
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r3,-52(r14)
          sub	r14,r14,r1
          clt	r1,r2,r3
          sw	-56(r14),r1
          lw	r3,-56(r14)
          bz	r3,endwhile12
% processing: "while(j<n-i-1){ if(arr[j]>arr[j+1])then { temp=arr[j]; arr[j]=arr[j+1]; arr[j+1]=temp;} else; j=j+1;};"
gowhile13 
% processing temporal(rel): t10 := (j < t9)
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r1,-28(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          sw	offset(r0),r0
% processing temporal(add): t7 := n - i
          lw	r5,-20(r14)
          lw	r4,-24(r14)
          sub	r7,r5,r4
          sw	-60(r14),r7
% processing literal: t8 := 1
          addi	r7,r0,1
          sw	-64(r14),r7
          sw	offset(r0),r0
% processing temporal(add): t9 := t7 - t8
          lw	r7,-60(r14)
          lw	r4,-64(r14)
          sub	r5,r7,r4
          sw	-68(r14),r5
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r6,-68(r14)
          sub	r14,r14,r2
          clt	r2,r1,r6
          sw	-72(r14),r2
          lw	r6,-72(r14)
          bz	r6,endwhile13
% processing temporal(rel): t15 := (arr > arr)
          sw	offset(r0),r0
          lw	r4,-12(r14)
% processing offsets(mul): arr := j * 1
          lw	r1,-28(r14)
          muli	r2,r1,1
          sw	-76(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r1,-76(r14)
          muli	r2,r1,4
          add	r1,r4,r2
          sw	offset(r0),r1
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r5,0(r14)
          sub	r14,r14,r4
          sw	offset(r0),r0
% processing literal: t12 := 1
          addi	r1,r0,1
          sw	-80(r14),r1
          sw	offset(r0),r0
% processing temporal(add): t13 := j + t12
          lw	r1,-28(r14)
          lw	r7,-80(r14)
          add	r8,r1,r7
          sw	-84(r14),r8
          lw	r9,-12(r14)
% processing offsets(mul): arr := t13 * 1
          lw	r8,-84(r14)
          muli	r7,r8,1
          sw	-88(r14),r7
% processing offsets(mul size): arr := arr * 4
          lw	r8,-88(r14)
          muli	r7,r8,4
          add	r8,r9,r7
          sw	offset(r0),r8
          lw	r4,offset(r0)
          add	r14,r14,r4
          lw	r2,0(r14)
          sub	r14,r14,r4
          cgt	r4,r5,r2
          sw	-92(r14),r4
% processing: "if(arr[j]>arr[j+1])then { temp=arr[j]; arr[j]=arr[j+1]; arr[j+1]=temp;} else;"
          lw	r2,-92(r14)
          bz	r2,else14
% processing assignment: temp := arr
          sw	offset(r0),r0
          lw	r1,-12(r14)
% processing offsets(mul): arr := j * 1
          lw	r5,-28(r14)
          muli	r4,r5,1
          sw	-96(r14),r4
% processing offsets(mul size): arr := arr * 4
          lw	r5,-96(r14)
          muli	r4,r5,4
          add	r5,r1,r4
          sw	offset(r0),r5
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r9,0(r14)
          sub	r14,r14,r1
          sw	offset(r0),r0
          lw	r1,offset(r0)
          add	r14,r14,r1
          sw	-32(r14),r9
          sub	r14,r14,r1
% processing assignment: arr[j] := arr
          sw	offset(r0),r0
% processing literal: t18 := 1
          addi	r9,r0,1
          sw	-104(r14),r9
          sw	offset(r0),r0
% processing temporal(add): t19 := j + t18
          lw	r9,-28(r14)
          lw	r1,-104(r14)
          add	r4,r9,r1
          sw	-108(r14),r4
          lw	r5,-12(r14)
% processing offsets(mul): arr := t19 * 1
          lw	r4,-108(r14)
          muli	r1,r4,1
          sw	-112(r14),r1
% processing offsets(mul size): arr := arr * 4
          lw	r4,-112(r14)
          muli	r1,r4,4
          add	r4,r5,r1
          sw	offset(r0),r4
          lw	r5,offset(r0)
          add	r14,r14,r5
          lw	r9,0(r14)
          sub	r14,r14,r5
          sw	offset(r0),r0
          lw	r8,-12(r14)
% processing offsets(mul): arr := j * 1
          lw	r1,-28(r14)
          muli	r4,r1,1
          sw	-100(r14),r4
% processing offsets(mul size): arr := arr * 4
          lw	r1,-100(r14)
          muli	r4,r1,4
          add	r1,r8,r4
          sw	offset(r0),r1
          lw	r5,offset(r0)
          add	r14,r14,r5
          sw	0(r14),r9
          sub	r14,r14,r5
% processing assignment: arr[j+1] := temp
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r5,-32(r14)
          sub	r14,r14,r9
          sw	offset(r0),r0
% processing literal: t21 := 1
          addi	r8,r0,1
          sw	-116(r14),r8
          sw	offset(r0),r0
% processing temporal(add): t22 := j + t21
          lw	r8,-28(r14)
          lw	r7,-116(r14)
          add	r4,r8,r7
          sw	-120(r14),r4
          lw	r1,-12(r14)
% processing offsets(mul): arr := t22 * 1
          lw	r4,-120(r14)
          muli	r7,r4,1
          sw	-124(r14),r7
% processing offsets(mul size): arr := arr * 4
          lw	r4,-124(r14)
          muli	r7,r4,4
          add	r4,r1,r7
          sw	offset(r0),r4
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	0(r14),r5
          sub	r14,r14,r9
          j		endif14
else14    
endif14   
% processing assignment: j := t25
          sw	offset(r0),r0
% processing literal: t24 := 1
          addi	r2,r0,1
          sw	-128(r14),r2
          sw	offset(r0),r0
% processing temporal(add): t25 := j + t24
          lw	r2,-28(r14)
          lw	r5,-128(r14)
          add	r9,r2,r5
          sw	-132(r14),r9
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r5,-132(r14)
          sub	r14,r14,r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-28(r14),r5
          sub	r14,r14,r9
          j		gowhile13
endwhile13
% processing assignment: i := t27
          sw	offset(r0),r0
% processing literal: t26 := 1
          addi	r5,r0,1
          sw	-136(r14),r5
          sw	offset(r0),r0
% processing temporal(add): t27 := i + t26
          lw	r5,-24(r14)
          lw	r9,-136(r14)
          add	r2,r5,r9
          sw	-140(r14),r2
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r9,-140(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-24(r14),r9
          sub	r14,r14,r2
          j		gowhile12
endwhile12
          lw	r15,-8(r14)
          jr	r15
% end function bubbleSort definition
% processing function definition: printArray
printArray
          sw	-8(r14),r15
% processing assignment: n := size
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r2,-16(r14)
          sub	r14,r14,r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-20(r14),r2
          sub	r14,r14,r9
% processing assignment: i := t28
% processing literal: t28 := 0
          addi	r2,r0,0
          sw	-28(r14),r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          lw	r9,-28(r14)
          sub	r14,r14,r2
          sw	offset(r0),r0
          lw	r2,offset(r0)
          add	r14,r14,r2
          sw	-24(r14),r9
          sub	r14,r14,r2
% processing: "while(i<n){ write(arr[i]); i=i+1;};"
gowhile34 
% processing temporal(rel): t29 := (i < n)
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r2,-24(r14)
          sub	r14,r14,r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r5,-20(r14)
          sub	r14,r14,r9
          clt	r9,r2,r5
          sw	-32(r14),r9
          lw	r5,-32(r14)
          bz	r5,endwhile34
          sw	offset(r0),r0
          lw	r8,-12(r14)
% processing offsets(mul): arr := i * 1
          lw	r2,-24(r14)
          muli	r9,r2,1
          sw	-36(r14),r9
% processing offsets(mul size): arr := arr * 4
          lw	r2,-36(r14)
          muli	r9,r2,4
          add	r2,r8,r9
          sw	offset(r0),r2
% processing: write(arr)
          lw	r1,offset(r0)
          add	r14,r14,r1
          lw	r8,0(r14)
          sub	r14,r14,r1
     % put value on stack
          addi	r14,r14,-44
          sw	-8(r14),r8
     % link buffer to stack
          addi	 r8,r0, buf
          sw	-12(r14),r8
     % convert int to string for output
          jl	r15, intstr
          sw	-8(r14),r13
     % output to console
          jl	r15, putstr
          subi	r14,r14,-44
          addi	 r8,r0, 13
          putc	 r8
          addi	 r8,r0, 10
          putc	 r8
% processing assignment: i := t32
          sw	offset(r0),r0
% processing literal: t31 := 1
          addi	r1,r0,1
          sw	-40(r14),r1
          sw	offset(r0),r0
% processing temporal(add): t32 := i + t31
          lw	r1,-24(r14)
          lw	r8,-40(r14)
          add	r9,r1,r8
          sw	-44(r14),r9
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r8,-44(r14)
          sub	r14,r14,r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-24(r14),r8
          sub	r14,r14,r9
          j		gowhile34
endwhile34
          lw	r15,-8(r14)
          jr	r15
% end function printArray definition
%------------------------------------------------------
          entry
% set stack pointer
          addi	r14,r0,topaddr
% processing function definition: main
% processing assignment: arr[0] := t35
% processing literal: t35 := 64
          addi	r8,r0,64
          sw	-48(r14),r8
          sw	offset(r0),r0
          lw	r8,offset(r0)
          add	r14,r14,r8
          lw	r9,-48(r14)
          sub	r14,r14,r8
% processing literal: t33 := 0
          addi	r1,r0,0
          sw	-40(r14),r1
          sw	offset(r0),r0
          addi	r4,r0,0
% processing offsets(mul): arr := t33 * 1
          lw	r1,-40(r14)
          muli	r2,r1,1
          sw	-44(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r1,-44(r14)
          muli	r2,r1,4
          add	r1,r4,r2
          sw	offset(r0),r1
          lw	r8,offset(r0)
          add	r14,r14,r8
          sw	-36(r14),r9
          sub	r14,r14,r8
% processing assignment: arr[1] := t38
% processing literal: t38 := 34
          addi	r9,r0,34
          sw	-60(r14),r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r8,-60(r14)
          sub	r14,r14,r9
% processing literal: t36 := 1
          addi	r4,r0,1
          sw	-52(r14),r4
          sw	offset(r0),r0
          addi	r1,r0,0
% processing offsets(mul): arr := t36 * 1
          lw	r4,-52(r14)
          muli	r7,r4,1
          sw	-56(r14),r7
% processing offsets(mul size): arr := arr * 4
          lw	r4,-56(r14)
          muli	r7,r4,4
          add	r4,r1,r7
          sw	offset(r0),r4
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-36(r14),r8
          sub	r14,r14,r9
% processing assignment: arr[2] := t41
% processing literal: t41 := 25
          addi	r8,r0,25
          sw	-72(r14),r8
          sw	offset(r0),r0
          lw	r8,offset(r0)
          add	r14,r14,r8
          lw	r9,-72(r14)
          sub	r14,r14,r8
% processing literal: t39 := 2
          addi	r1,r0,2
          sw	-64(r14),r1
          sw	offset(r0),r0
          addi	r4,r0,0
% processing offsets(mul): arr := t39 * 1
          lw	r1,-64(r14)
          muli	r2,r1,1
          sw	-68(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r1,-68(r14)
          muli	r2,r1,4
          add	r1,r4,r2
          sw	offset(r0),r1
          lw	r8,offset(r0)
          add	r14,r14,r8
          sw	-36(r14),r9
          sub	r14,r14,r8
% processing assignment: arr[3] := t44
% processing literal: t44 := 12
          addi	r9,r0,12
          sw	-84(r14),r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r8,-84(r14)
          sub	r14,r14,r9
% processing literal: t42 := 3
          addi	r4,r0,3
          sw	-76(r14),r4
          sw	offset(r0),r0
          addi	r1,r0,0
% processing offsets(mul): arr := t42 * 1
          lw	r4,-76(r14)
          muli	r7,r4,1
          sw	-80(r14),r7
% processing offsets(mul size): arr := arr * 4
          lw	r4,-80(r14)
          muli	r7,r4,4
          add	r4,r1,r7
          sw	offset(r0),r4
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-36(r14),r8
          sub	r14,r14,r9
% processing assignment: arr[4] := t47
% processing literal: t47 := 22
          addi	r8,r0,22
          sw	-96(r14),r8
          sw	offset(r0),r0
          lw	r8,offset(r0)
          add	r14,r14,r8
          lw	r9,-96(r14)
          sub	r14,r14,r8
% processing literal: t45 := 4
          addi	r1,r0,4
          sw	-88(r14),r1
          sw	offset(r0),r0
          addi	r4,r0,0
% processing offsets(mul): arr := t45 * 1
          lw	r1,-88(r14)
          muli	r2,r1,1
          sw	-92(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r1,-92(r14)
          muli	r2,r1,4
          add	r1,r4,r2
          sw	offset(r0),r1
          lw	r8,offset(r0)
          add	r14,r14,r8
          sw	-36(r14),r9
          sub	r14,r14,r8
% processing assignment: arr[5] := t50
% processing literal: t50 := 11
          addi	r9,r0,11
          sw	-108(r14),r9
          sw	offset(r0),r0
          lw	r9,offset(r0)
          add	r14,r14,r9
          lw	r8,-108(r14)
          sub	r14,r14,r9
% processing literal: t48 := 5
          addi	r4,r0,5
          sw	-100(r14),r4
          sw	offset(r0),r0
          addi	r1,r0,0
% processing offsets(mul): arr := t48 * 1
          lw	r4,-100(r14)
          muli	r7,r4,1
          sw	-104(r14),r7
% processing offsets(mul size): arr := arr * 4
          lw	r4,-104(r14)
          muli	r7,r4,4
          add	r4,r1,r7
          sw	offset(r0),r4
          lw	r9,offset(r0)
          add	r14,r14,r9
          sw	-36(r14),r8
          sub	r14,r14,r9
% processing assignment: arr[6] := t53
% processing literal: t53 := 90
          addi	r8,r0,90
          sw	-120(r14),r8
          sw	offset(r0),r0
          lw	r8,offset(r0)
          add	r14,r14,r8
          lw	r9,-120(r14)
          sub	r14,r14,r8
% processing literal: t51 := 6
          addi	r1,r0,6
          sw	-112(r14),r1
          sw	offset(r0),r0
          addi	r4,r0,0
% processing offsets(mul): arr := t51 * 1
          lw	r1,-112(r14)
          muli	r2,r1,1
          sw	-116(r14),r2
% processing offsets(mul size): arr := arr * 4
          lw	r1,-116(r14)
          muli	r2,r1,4
          add	r1,r4,r2
          sw	offset(r0),r1
          lw	r8,offset(r0)
          add	r14,r14,r8
          sw	-36(r14),r9
          sub	r14,r14,r8
          sw	offset(r0),r0
% processing literal: t54 := 7
          addi	r9,r0,7
          sw	-124(r14),r9
          sw	offset(r0),r0
% processing: function call to printArray 
          addi	r9,r0,96
          sw	-144(r14),r9
          lw	r9,-124(r14)
          sw	-148(r14),r9
          addi	r14,r14,-132
          jl	r15,printArray
          subi	r14,r14,-132
          lw	r9,-136(r14)
          sw	0(r14),r9
          sw	offset(r0),r0
% processing literal: t55 := 7
          addi	r8,r0,7
          sw	-128(r14),r8
          sw	offset(r0),r0
% processing: function call to bubbleSort 
          addi	r8,r0,96
          sw	-144(r14),r8
          lw	r8,-128(r14)
          sw	-148(r14),r8
          addi	r14,r14,-132
          jl	r15,bubbleSort
          subi	r14,r14,-132
          lw	r8,-136(r14)
          sw	0(r14),r8
          sw	offset(r0),r0
% processing literal: t56 := 7
          addi	r9,r0,7
          sw	-132(r14),r9
          sw	offset(r0),r0
% processing: function call to printArray 
          addi	r9,r0,96
          sw	-144(r14),r9
          lw	r9,-132(r14)
          sw	-148(r14),r9
          addi	r14,r14,-132
          jl	r15,printArray
          subi	r14,r14,-132
          lw	r9,-136(r14)
          sw	0(r14),r9
          hlt

% -----------------------------------------------------------------------

offset    res 4
% buffer space used for console output
buf       res 20

