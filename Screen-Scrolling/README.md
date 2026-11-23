# Screen Scrolling Animation Using Stack in 8088 Assembly

An 8088 Assembly Language project that demonstrates continuous upward and downward screen scrolling using direct video memory manipulation and stack-based storage.

The program displays text in the top and bottom sections of the screen and continuously scrolls the screen content up and down using string instructions and a temporary storage area allocated on the stack.

### Features
- Displays multiple text lines at specific screen positions.
- Implements upward and downward screen scrolling.
- Uses stack memory to temporarily save screen content.
- Clears screen rows during upward scrolling.
- Restores saved rows during downward scrolling.
- Uses delay loops to control scrolling speed.
- Performs memory copying using string instructions.

### Concepts Used
- 8086 Assembly Language
- Stack memory allocation
- Stack pointer (`SP`) and base pointer (`BP`)
- Video memory addressing (`B800h`)
- String instructions (`MOVSW`, `STOSW`)
- Repeated operations (`REP`)
- Direction flag (`CLD`, `STD`)
- Procedures and subroutines
- Interrupts (`INT 10h`, `INT 21h`)
- Nested loops and delay mechanisms

### How It Works
1. Clears the screen.
2. Displays five text lines at the top and five at the bottom.
3. Allocates temporary storage space on the stack for three screen rows.
4. Saves the top three rows before scrolling upward.
5. Moves the remaining screen content upward and clears the bottom three rows.
6. Scrolls the screen downward.
7. Restores the previously saved top three rows.
8. Repeats the process continuously with a delay between movements.

### Execution Details
- **Platform:** 8086 Assembly Language
- **Execution Environment:** DOS 
- **Video Memory Segment:** `B800h`
