;
; segments of code
;

section _code

    ; base << 4 + offset
    jmp 0x90:start
    ; code base

    start:

    ; initializing data-section
    mov ax, section._data.start
    add ax, 0x900               ; _data.start + 0x900
    shr ax, 4                   ; ax >> 4
    mov ds, ax                  ; data-section base

    ; initializing stack
    mov ax, section._stack.start
    add ax, 0x900
    shr ax, 4
    mov ss, ax
    mov sp, stack_top

    ; code
    jmp $



section _data align=16 vstart=0

    var1 dd 0x01234567
    var2 dd 0x89abcdef


section _stack align=16 vstart=0

    times 128 db 0              ; 128B stack

    stack_top:
