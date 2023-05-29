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
  call what_to_do

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
  
