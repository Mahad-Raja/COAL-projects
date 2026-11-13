# Plus Sign Pattern Using Stars in 8086 Assembly

An 8088 Assembly Language project that prints a plus (+) sign pattern using star (`*`) characters through direct video memory manipulation.

The program creates a plus-shaped pattern by printing a vertical line and a horizontal line that intersect at the center of the screen.

### Features

- Direct access to video memory (`B800h`).
- Screen clearing using a custom procedure.
- Vertical star pattern printing.
- Horizontal star pattern printing.
- Center alignment of intersecting lines.
- Loop-based character printing.

### Concepts Used

- 8088 Assembly Language
- Video memory addressing
- Registers and memory offsets
- Procedures and subroutines
- Loops (`LOOP`)
- Conditional jumps (`JL`)
- Direct screen manipulation

### How It Works

1. Clears the screen using the `clearscr` procedure.
2. Prints a vertical line of stars.
3. Prints a horizontal line of stars across the center.
4. Both lines intersect to form a plus (+) sign.

### Execution Details

- **Platform:** 8088 Assembly Language
- **Execution Environment:** DOS&#x20;
- **Video Memory Segment:** `B800h`

