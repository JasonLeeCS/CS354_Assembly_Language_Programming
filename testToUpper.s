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
    
    int main()
    {
        char *str;

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
        -4(%rbp)  |  int x
        -8(%rbp)  |  int y
        -16(%rbp  |  int *px
************************ */

To_Upper:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    %rdi, -8(%rbp)
        jmp     .L2
.L4:
        movq    -8(%rbp), %rax
        movzbl  (%rax), %eax
        cmpb    $96, %al
        jle     .L3
        movq    -8(%rbp), %rax
        movzbl  (%rax), %eax
        cmpb    $122, %al
        jg      .L3
        movq    -8(%rbp), %rax
        movzbl  (%rax), %eax
        subl    $32, %eax
        movl    %eax, %edx
        movq    -8(%rbp), %rax
        movb    %dl, (%rax)
.L3:
        addq    $1, -8(%rbp)
WHILE_LOOP:
        movq    -8(%rbp), %rax
        movzbl  (%rax), %eax
        testb   %al, %al
        jne     .L4
        nop
        nop
        popq    %rbp
        ret





# This code prints the letter 'a' (ascii value 97)
# Use this for debugging
# Comment out when finished - your function should not print anything
# Note putchar overwrites all caller saved registers including argument registers
	movl	$97, %eax
	movl	%eax, %edi
	call	putchar@PLT


# Body of function


# Epilogue
    ret
