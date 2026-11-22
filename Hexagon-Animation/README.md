# Hexagon Animation Using Stars in 8088 Assembly

An 8088 Assembly Language project that draws a hexagon on the screen using direct video memory manipulation and creates a simple animation effect by displaying a moving star (`*`) along the hexagon's outline.

The program first draws the hexagon using yellow hash (`#`) characters and then displays white star (`*`) characters along the same path, creating an animation effect.

### Features

- Draws a hexagonal shape using character-based graphics.
- Uses direct video memory access (`B800h`).
- Displays yellow `#` characters to form the hexagon.
- Displays white `*` characters along the hexagon's outline.
- Uses a delay procedure to control animation speed.
- Uses reusable procedures for drawing lines and shapes.
- Supports diagonal and vertical character movement.

### Concepts Used

- 8086 Assembly Language
- Video memory addressing
- Registers and memory offsets
- Procedures and subroutines
- Stack operations (`PUSH`, `POP`)
- Loops (`LOOP`)
- Arithmetic operations
- Character attributes and colors
- Animation using delay loops

### How It Works

1. Clears the screen.
2. Draws a hexagon using yellow `#` characters.
3. Calls the hexagon procedure again to display white `*` characters along the same path.
4. Uses a delay between character placements to make the animation visible.

### Execution Details

- **Platform:** 8088 Assembly Language
- **Execution Environment:** DOS
- **Video Memory Segment:** `B800h`

