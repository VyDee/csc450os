    extern interrupt_handler

    global interrupt_handler_32
    interrupt_handler_32:
        push    dword 32                    ; push the interrupt number
        jmp     common_interrupt_handler    ; jump to the common handler

    common_interrupt_handler:               ; the common parts of the generic interrupt handler
        ; save the registers
        push    eax
        push    ebx
        push    ecx
        push    edx
        ;push    esp
        push    ebp
        push    esi
        push    edi

        ; call the C function
        call    interrupt_handler

        ; restore the registers
        pop     edi
        pop     esi
        pop     ebp
        ;pop     esp
        pop     edx
        pop     ecx
        pop     ebx
        pop     eax

        ; restore the esp
        add     esp, 8

        ; return to the code that got interrupted
        iret

    no_error_code_interrupt_handler 33       ; create handler for interrupt 0

 global  interrupts_load_idt

    ; load_idt - Loads the interrupt descriptor table (IDT).
    ; stack: [esp + 4] the address of the first entry in the IDT
    ;        [esp    ] the return address
    interrupts_load_idt:
        mov     eax, [esp+4]    ; load the address of the IDT into register eax
        lidt    eax             ; load the IDT
        ret                     ; return to the calling function