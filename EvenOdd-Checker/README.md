# Even or Odd Checker Using Procedures and Stack in 8086 Assembly

An 8086 Assembly Language project that checks whether two given numbers are even or odd using division and displays the results directly on the screen through video memory.

The program uses a custom procedure to perform the divisibility check and determines the result by checking the remainder after division by 2.

### Features
- Checks two numbers for even or odd.
- Uses division to calculate the remainder.
- Displays results directly on the screen.
- Uses stack-based parameter passing.
- Implements a procedure with stack frame management.
- Uses separate messages for even and odd results.

### Concepts Used
- 8086 Assembly Language
- Stack operations (`PUSH`, `POP`)
- Procedure calls and returns
- Parameter passing through the stack
- Stack frame using `BP`
- Division instruction (`DIV`)
- Conditional jumps (`JE`)
- Video memory addressing (`B800h`)
- String printing using loops

### How It Works
1. Clears the screen.
2. Pushes the numbers, divisor, and message information onto the stack.
3. Calls the `check` procedure.
4. Divides each number by 2.
5. Checks the remainder:
   - Remainder 0 → Even
   - Non-zero remainder → Odd
6. Displays the corresponding result for each number on separate rows.
7. Restores the stack and returns to the main program.

### Sample Input
- First Number: 44
- Second Number: 13
- Divisor: 2

### Expected Output
- 44 is Even
- 13 is Odd

### Execution Details
- **Platform:** 8086 Assembly Language
- **Execution Environment:** DOS / EMU8086
- **Video Memory Segment:** `B800h`
