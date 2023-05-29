#include <asm/desc.h>

void my_store_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY
asm("sidt %0;"
    :"=m"(*idtr)
        );

// </STUDENT FILL>
}

void my_load_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY

asm ("lidt %0;"
    ::"m"(*idtr)
        );
// <STUDENT FILL>
}

void my_set_gate_offset(gate_desc *gate, unsigned long addr) {
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY
gate -> offset_high = addr >> 32;
gate -> offset_mid = (addr << 32) >> 48;
gate -> offset_low = (addr  << 48) >> 48;

// </STUDENT FILL>
}

unsigned long my_get_gate_offset(gate_desc *gate) {
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY
unsigned long addr = 0;
addr = gate->offset_high;
addr = addr << 16;
addr = addr | gate->offset_mid;
addr = addr << 16;
addr = addr | gate->offset_low;

return addr;
// </STUDENT FILL>
}
