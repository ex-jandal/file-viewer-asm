# File Viewer (Assembly Language for Linux)

This project is a simple file viewer implemented in x86-64 assembly language, designed specifically for Linux. It demonstrates the use of Linux system calls for basic file I/O operations.

## Platform

- **Operating System:** Linux
- **Architecture:** x86-64

## Files

- `main.asm`: The primary assembly source code for the file viewer.
- `LICENSE`: Contains the licensing information for this project.
- `.asm-lsp.toml`: Configuration for the Assembly Language Server Protocol.
- `.gitignore`: Specifies intentionally untracked files to ignore by Git.

## Dependencies

To build and run this project, you will need:
- `nasm` (The Netwide Assembler)
- `ld` (The GNU linker)

You can typically install these on a Debian-based system (like Ubuntu) with:
```bash
sudo apt-get update
sudo apt-get install nasm
```

or if you use Arch Linux like me BTW 😏 just run:
```bash
sudo pacman -Sy
sudo pacman -S nasm
```

## Building and Running

1.  **Assemble the source code into a 64-bit ELF object file:**
    ```bash
    nasm -f elf64 main.asm -o main.o
    ```

2.  **Link the object file to create an executable:**
    ```bash
    ld main.o -o file_viewer
    ```

3.  **Run the executable:**
    ```bash
    ./viewer <filename>
    ```
    For example, to view the content of `main.asm`:
    ```bash
    ./viewer main.asm
    ```

## Features

*   Reads a file specified by a command-line argument.
*   Displays the file's content to standard output.
*   Includes basic error handling for file-not-found scenarios.

## License

This project is licensed under the terms found in the [LICENSE](LICENSE) file.
