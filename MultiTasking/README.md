# Multitasking and Context Switching Using Timer Interrupts in 8086 Assembly

An 8086 Assembly Language project that demonstrates basic multitasking by running four independent tasks using timer interrupts and process context switching.

The program displays four continuously changing animation characters at different screen positions. A custom timer interrupt handler switches between tasks by saving and restoring their CPU register states using Process Control Blocks (PCBs).

### Features
- Implements four independent tasks.
- Uses timer interrupts for task switching.
- Performs context switching between tasks.
- Stores task states using Process Control Blocks (PCBs).
- Saves and restores CPU registers and flags.
- Displays continuously changing animation characters.
- Uses direct video memory manipulation (`B800h`).
- Configures the Programmable Interval Timer (PIT).
- Hooks the timer interrupt through the Interrupt Vector Table (IVT).

### Concepts Used
- 8086 Assembly Language
- Multitasking and context switching
- Timer interrupts (`INT 08h`)
- Interrupt Service Routines (ISR)
- Process Control Blocks (PCB)
- Stack operations
- CPU register management
- Interrupt Vector Table (IVT)
- Programmable Interrupt Controller (PIC)
- Programmable Interval Timer (PIT)
- Video memory addressing
- `IRET` instruction

### How It Works
1. Initializes the Process Control Blocks for four tasks.
2. Configures the timer frequency.
3. Installs a custom timer interrupt handler in the IVT.
4. Each task continuously updates an animation character at a different screen position.
5. Whenever the timer interrupt occurs, the handler saves the current task's CPU state.
6. It selects the next task and restores its saved CPU state.
7. The `IRET` instruction resumes execution of the selected task.
8. This process repeats continuously, allowing all four tasks to run seemingly simultaneously.

### Execution Details
- **Platform:** 8086 Assembly Language
- **Execution Environment:** DOS / EMU8086
- **Video Memory Segment:** `B800h`
- **Interrupt Used:** Timer Interrupt (INT 08h)

### Learning Objectives
- Understanding how multitasking works at a low level.
- Learning how operating systems perform context switching.
- Understanding timer-based scheduling.
- Practicing interrupt handling and CPU state management.
- Understanding the role of PCBs in task management.
