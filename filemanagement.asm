; =========================================
; MASM32 Program: File Write and Read
; =========================================

.386
.model flat, stdcall
option casemap:none

; include MASM32 libraries
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\macros\macros.asm

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    fileName db "myfile.txt",0
    message  db "Welcome to Tutorials Point",0
    msgDone  db "Written to file",0

    bytesWritten dd ?
    bytesRead    dd ?

.data?
    hFile HANDLE ?
    buffer db 64 dup(?)

.code

start:

    ; =====================================
    ; Create/Open File
    ; =====================================

    invoke CreateFile,
        addr fileName,          ; file name
        GENERIC_WRITE or GENERIC_READ,
        0,
        NULL,
        CREATE_ALWAYS,
        FILE_ATTRIBUTE_NORMAL,
        NULL

    mov hFile, eax

    ; =====================================
    ; Write to File
    ; =====================================

    invoke WriteFile,
        hFile,
        addr message,
        LENGTHOF message - 1,
        addr bytesWritten,
        NULL

    ; =====================================
    ; Display message
    ; =====================================

    invoke StdOut, addr msgDone
    invoke StdOut, chr$(13,10)

    ; =====================================
    ; Move file pointer to beginning
    ; =====================================

    invoke SetFilePointer,
        hFile,
        0,
        NULL,
        FILE_BEGIN

    ; =====================================
    ; Read from file
    ; =====================================

    invoke ReadFile,
        hFile,
        addr buffer,
        64,
        addr bytesRead,
        NULL

    ; Null terminate buffer
    mov eax, bytesRead
    mov buffer[eax], 0

    ; =====================================
    ; Print file contents
    ; =====================================

    invoke StdOut, addr buffer
    invoke StdOut, chr$(13,10)

    ; =====================================
    ; Close file
    ; =====================================

    invoke CloseHandle, hFile

    ; =====================================
    ; Exit program
    ; =====================================

    invoke ExitProcess, 0

end start