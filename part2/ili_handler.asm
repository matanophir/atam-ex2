.globl my_ili_handler

.text
.align 4, 0x90
my_ili_handler:
  ####### Some smart student's code here #######
  pushq %rsi
  pushq %rbx
  pushq %rax

  movq 24(%rsp), %rsi # rip_ptr
  movzbq (%rsi), %rdi # first byte


  movq $1, %rbx
  cmpb $0x0F,%dil
  jne my_ili_handler_call_what

  movq $2, %rbx
  movzbq 1(%rsi), %rdi # second byte

  my_ili_handler_call_what:
  call what_to_do_wrapper

  cmpq $0,%rax
  je my_ili_handler_restore_old_control

  movq %rax, %rdi
  addq %rbx, 24(%rsp)

  popq %rax
  popq %rbx
  popq %rsi
  iretq

  my_ili_handler_restore_old_control:

  popq %rax
  popq %rbx
  popq %rsi
  jmp *old_ili_handler
  


  what_to_do_wrapper:
    push %rdi
    push %rsi
    push %rdx
    push %rcx
    push %r8
    push %r9
    push %r10
    push %r11

    call what_to_do

    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi

    ret
