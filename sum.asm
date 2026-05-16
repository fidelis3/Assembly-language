.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
num1   db ?
num2   db ?
result db ?
buffer db 16 dup(?)

.code

main PROC
    call GetInput
    call Sum
    call DisplaySum
    invoke ExitProcess, 0
main ENDP

GetInput PROC
    mov al, 5
    mov num1, al
    mov bl, 8
    mov num2, bl
    ret
GetInput ENDP

Sum PROC
    mov al, num1
    add al, num2
                                                                                         
    ret
Sum ENDP

DisplaySum PROC
    movzx eax, result
    print str$(eax)
    ret
DisplaySum ENDP

end main