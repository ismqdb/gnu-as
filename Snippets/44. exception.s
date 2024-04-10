void myfunc(){
    try {
        myfunc2();
        // DoMoreStuff
    }
    catch {
        // Handle exception
    }

    // Continue myfunc
}

void myfunc2(){
    myfunc3();
}

void myfunc3(){
    throw my_exception_code;
}

/////////////////////////////////////////

.equ my_exception_code, 7   # Random value

myfunc:
    enter $0, $0

    pushq $0
    pushq $myfunc_exceptionhandler
    call myfunc2

    # Do more stuff

myfunc_ContinueMyFunc:
    # Do more stuff here

    leave 
    ret

myfunc_exceptionhandler:
    # Handle exception - do any exception-handling code here

    # Go back to the code
    jmp myfunc_ContinueMyFunc

myfunc2:
    enter $0, $0

    pushq $0
    pushq $myfunc2_exceptionhandler

    call myfunc3

    leave
    ret

myfunc2_exceptionhandler:
    # Nothing to do except go to the next handler
    leave           # restore %rsp/%rbp
    addq $8, %rsp   # get rid of return address
    jmp *(%rsp)     # jump to exception handler

myfunc:
    enter $0, $0

    // Throw
    movq $my_exception_code, %rax   # store exception code
    leave                           # restore %rsp/%rbp
    addq $8, %rsp                   # Get rid of return address
    jmp *(%rsp)                     # Jump to exception handler

    # What would have happened if we didn't throw the exception
    leave
    ret