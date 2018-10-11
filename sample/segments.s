;
; segments of code
;

section _code vstart=0

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
    mov ax, section._seack.stask_start
    add ax, 0x900
    shr ax, 4
    mov ss, ax
    mov sp, stask_start

    ; code
    jmp $



section _data align=16 vstart=0

    var1 dd 0x1
    var2 dd 0x2


section _stack align=16 vstart=0

    times 128 db 0              ; 128B stack

    stask_start:
