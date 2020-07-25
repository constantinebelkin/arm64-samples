.arch armv8-a // Define target instruction set
.cpu cortex-a53 // Define target microarchitecture

.text // Actual code section
.global _start // Linker must able to see this necessary label

_start: // Kernel requires "_start" label to be as programm entrypoint
	mov x0, 0x1 // Assign STDOUT as write target
	ldr x1, =greeting // Load string address in memory
	ldr x2, =length // Load string length value address in memory
	mov w8, 0x40 // Prepare "write" system call
	svc 0x0 // Software interruption

	mov w8, 0x5d // Prepare "exit" system call
	svc 0x0

.data // Inittializing data section
greeting:
	.ascii "Hello, world!\n" // Declare ASCII string in memory
length = .-greeting //calculate string length
