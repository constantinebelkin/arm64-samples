.arch armv8-a
.cpu cortex-a53

.text
.global _start

_start:
	mov x0, 0x1
put_char:
	ldr x1, =char
	mov x2, 0x1
	mov w8, 0x40
	svc 0x0

	ldr x11, [x1] // Dereference value by the address
	add x11, x11, 0x1 // Increment character value
	str x11, [x1] // Save value back to memory
	cmp x11, 0xff // Check if it is the last ASCII chaacter
	bne put_char // Continue loop if not

	mov w8, 0x5d
	svc 0x0

.data
char: .byte 0x0 //Initialize "char" variable in memory
