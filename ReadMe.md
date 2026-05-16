# Assembly Codes

This folder contains a small set of MASM32 assembly examples:

- `hello.asm` shows a basic Windows message box program.
- `sum.asm` demonstrates simple arithmetic and console output with MASM32 helpers.
- `filemanagement.asm` demonstrates creating, writing, reading, and closing a text file.

## Requirements

- MASM32 installed at `C:\masm32`
- Windows SDK APIs available through the MASM32 include and library paths

## Build

From a MASM32 command prompt, assemble and link a file with:

```bat
ml /c /coff hello.asm
link /subsystem:windows hello.obj
```

Replace `hello` with `sum` or `filemanagement` to build the other samples.

## Run

After building, run the generated `.exe` from the same folder.

## Files

- `hello.asm`: Displays a `MessageBox` with the text `Hello, World!`.
- `sum.asm`: Loads two sample values, adds them, and prints the result.
- `filemanagement.asm`: Writes text to `myfile.txt`, reads it back, and prints the contents.
- `myfile.txt`: Output file created by `filemanagement.asm`.

## Notes

- The examples use MASM32 includes and libraries directly from `C:\masm32`.
- Build outputs such as `.obj` and `.exe` files are generated in this folder.
