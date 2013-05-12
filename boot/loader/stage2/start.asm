bits 32

global start
extern bmain

section .text

start:
   call  bmain

   hlt
