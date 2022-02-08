segment main

start:
	; detect EGA BIOS
	mov ah, 0x12
	mov bl, 0x10
	int 0x10
	cmp bl, 0x10
	je .cga
	; detect VGA BIOS
	mov ax, 0x1a00
	int 0x10
	cmp al, 0x1a
	jne .ega
	; detect VESA BIOS
	mov ax, vesa_info_buffer
	mov es, ax
	xor di, di
	mov ax, 0x4f00
	int 0x10
	cmp ax, 0x004f
	jne .vga
	cmp word [es:di+0], 0x4556  ; 'VE'
	jne .vga
	cmp word [es:di+2], 0x4153  ; 'SA'
	jne .vga
	cmp word [es:di+4], 0x0102  ; version
	jb .vga
.vesa:
	mov dx, strings.vesa
	jmp .print
.vga:
	mov dx, strings.vga
	jmp .print
.ega:
	mov dx, strings.ega
	jmp .print
.cga:
	mov dx, strings.cga
.print:
	mov ax, strings
	mov ds, ax
	mov ah, 0x09
	int 0x21
	mov ax, 0x4c00
	int 0x21

segment strings
	.cga db "CGA$"
	.ega db "EGA$"
	.vga db "VGA$"
	.vesa db "VESA$"

segment vesa_info_buffer
	rb 256
