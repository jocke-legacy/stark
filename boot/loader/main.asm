bits 16

global start
extern enter_pmode

section .text

start:
   jmp  enter_pmode

section .data

db    0x55
db    0xaa
   
