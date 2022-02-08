;
; This is Windows 1.01 (and higher) screen grabber stub
;

VER		EQU	100		; 100 = DOSSHELL 2
					; 101 = Windows 1.0x
					; 103 = Windows 1.03 with HP extensions
					; 200 = Windows 2.0x
					; 300 = Windows 3.x

.8086
		include video.inc

code		segment
		org	0h

		IF	VER EQ 100
		jmp	near ptr NotSupported
		jmp	near ptr NotSupported
		jmp	near ptr NotSupported
		jmp	near ptr NotSupported
		ELSE
		jmp	near ptr InquireGrab
		jmp	near ptr EnableGrab
		jmp	near ptr DisableGrab
		jmp	near ptr PromptGrab
		ENDIF
		jmp	near ptr InquireSave
		jmp	near ptr SaveScreen
		jmp	near ptr RestoreScreen
		jmp	near ptr InitScreen

		IF	VER GE 103
ExtFuncTable label word
		dw EndPaint ;Func 0FFF4h
		dw BeginPaint ;Func 0FFFSh
		dw MarkBlock ;Func 0FFF6h
		dw PutBlock ;Func 0FFF7h
		dw GetBlock ;Func 0FFF8h
		dw RealizeColor ;Func 0FFFAh
		dw GetVersion ;Func 0FFFAh
		dw DisableSave ;Func 0FFFBh
		dw EnableSave ;Func 0FFFCh
		dw SetSwapDrive ;Func 0FFFDh
		dw GetInfo ;Func 0FFFAh
		dw GetID	;Func 0FFFFh
		ENDIF

NotSupported	proc far
		stc
		ret
NotSupported	endp

		IF VER GT 100

InquireGrab	proc far
		ret
InquireGrab	endp

EnableGrab	proc far
		ret
EnableGrab	endp

DisableGrab	proc far
		ret
DisableGrab	endp

PromptGrab	proc far
		ret
PromptGrab	endp

		ENDIF

InquireSave	proc far
		ret
InquireSave	endp

SaveScreen	proc far
		ret
SaveScreen	endp

RestoreScreen	proc far
		ret
RestoreScreen	endp

InitScreen	proc far
		push	ax
		mov	ax,0Fh
		int	10h
		xor	ah,ah
		int	10h
		pop	ax
		ret
InitScreen	endp

		IF	VER GT 103
EndPaint	proc near
		ret
EndPaint	endp

BeginPaint	proc near
		ret
BeginPaint	endp

MarkBlock	proc near
		ret
MarkBlock	endp

PutBlock	proc near
		ret
PutBlock	endp

GetBlock	proc near
		ret
GetBlock	endp

RealizeColor	proc near
		ret
RealizeColor	endp

GetVersion	proc near
		ret
GetVersion	endp

DisableSave	proc near
		ret
DisableSave	endp

EnableSave	proc near
		ret
EnableSave	endp

SetSwapDrive	proc near
		ret
SetSwapDrive	endp

GetInfo		proc near
		ret
GetInfo		endp

GetID		proc near
		ret
GetID		endp

		ENDIF

code	ends
	end
