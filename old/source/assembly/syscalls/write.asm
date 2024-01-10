SECTION .Data
SECTION .TEXT

ViperWrite:
   mov eax,4   ; write syscall
   mov ebx,1   ; stdout
   int 80h     ; Interrupt
   ret         ; Retyrb conrtol
