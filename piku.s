    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr} 

    @ Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr     r0, =line1
    bl      printf

    ldr     r0, =line2
    bl      printf

    ldr     r0, =line3
    bl      printf

    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      @ Return 0.

    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc ?~@~T the Program Counter ?~@~T to return.
    pop     {ip, pc} 

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.
line1:
    .asciz  "Oh, raspberry pi,\n"
line2:
    .asciz  "Acclaimed utilization\n"
line3:
    .asciz  "Though not edible\n"
