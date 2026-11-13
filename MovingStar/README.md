# Rectangular Star Pattern in 8088 Assembly

An 8088 Assembly Language project that prints a three-sided rectangular star pattern on the screen using direct video memory manipulation.

The program prints stars in three sections: a vertical line on the left, a horizontal line connecting the bottom, and another vertical line on the right, forming a rectangular U-shaped pattern.

### Features

- Direct access to video memory (`B800h`).
- Screen clearing using a custom procedure.
- Vertical and horizontal star printing.
- Screen positioning using memory offsets.
- Loop-based character printing.
- Conditional jumps for controlling loop execution.

### Concepts Used

- 8088 Assembly Language
- Video memory addressing
- Registers and memory offsets
- Procedures and subroutines
- `LOOP`, `JLE`, and `JL` instructions
- Direct screen manipulation

### How It Works

1. Clears the screen.
2. Prints a vertical line of stars.
3. Prints a horizontal line of stars.
4. Prints another vertical line of stars to complete the U-shaped pattern.

**Platform:** 8088 Assembly Language
**Execution Environment:** DOS 
