	.file	"To_Upper.s"
	.text
	.globl	To_Upper
	.type	To_Upper, @function

/* **********************
    Name: Jason Lee
    Wisc ID Number: 908 223 8909
    Wisc Email: jlee967@wisc.edu
************************ */


To_Upper:

# C version
/* **********************
    Write the equivalent C code to this function here (in the comment block)
    
    char *str;

    void To_Upper
    {
        while (*str != '\0')
        {
            if(*str >= 97 && *str <= 122)
            {
                *str = *str - 32;
            }
            str++;
        }
    }
************************ */


# Memory Layout
/* ************************ 
    Make a table showing the stack frame for your function (in the comment block)
    The first column should have a memory address (e.g. 8(%rsp))
    The second column should be the name of the C variable used above
    Update the example below with your variables and memory addresses
        -8(%rbp)  |  char *str
************************ */

# Prologue
# Store OS BP
    pushq  %rbp
# Moves base pointer up to bottom of stack frame
    movq   %rsp, %rbp
# Passes first argument to function
    movq   %rdi, -8(%rbp)

# This code prints the letter 'a' (ascii value 97)
# Use this for debugging
# Comment out when finished - your function should not print anything
# Note putchar overwrites all caller saved registers including argument registers
	# movl   $97, %eax
	# movl   %eax, %edi
	# call   putchar@PLT

# Body of function
While_Loop:
# Passes in first character
    movq    -8(%rbp), %rax
# Moves byte with zero extension
    movzbl  (%rax), %eax
# Moves contents of al into cl
# al is the least significant byte from the eax register
    movb    %al, %cl
# Computes bitwise AND, basically checks for terminating character
    testb   %cl, %cl
# Conditional jump that goes to the epilogue
    je      Epilogue

Condition:
# Performs subtract operation, ZF and CF set according to result
    cmpb    $96, %cl
# Jump if condition is met (less than or =)
    jle     Iteration
# performs subtract operation, ZF and CF set according to result
    cmpb    $122, %cl
# Jump if condition is met (greater than)
    jg      Iteration  
# Subtracts
    subl    $32, %eax
# Moves the contents of eax into edx
    movl    %eax, %edx
# Moves the contents of -8(%rbp) to rax
    movq    -8(%rbp), %rax
# Least significant byte of the edx register
    movb    %dl, (%rax)

Iteration:
# Adds 1 to str
    addq    $1, -8(%rbp)
# Goes to the while loop
    jmp     While_Loop

# Epilogue
Epilogue:
    popq    %rbp
    ret
