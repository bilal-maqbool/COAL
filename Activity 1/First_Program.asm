; ------------------------------------------------------------
; Program: Minimal 8086 Video Memory Demo
; Purpose: Display character 'H' directly on screen using
;          VGA text mode video memory.
; ------------------------------------------------------------

org 100h            ; Required for .COM program.
                    ; Tells assembler program starts at offset 100h.

mov ax, 0B800h      ; Load AX with 0B800h.
                    ; 0B800h is the segment address of VGA text video memory.

mov ds, ax          ; Copy AX into DS (Data Segment register).
                    ; Now DS points to video memory.
                    ; Any memory access using DS will affect screen memory.

mov [0], 'H'        ; Store ASCII character 'H' at offset 0000.
                    ; Offset 0000 = Row 0, Column 0 (top-left corner).
                    ; Even addresses store characters.

mov [1], 03h        ; Store attribute byte at offset 0001.
                    ; Odd addresses store color attributes.
                    ; 03h = Cyan text (foreground) on black background.
                    ; Format: Background(4 bits) + Foreground(4 bits)

mov ah, 00h         ; BIOS keyboard function 00h.
                    ; AH = 00h means "Wait for key press".

int 16h             ; Call BIOS interrupt 16h.
                    ; Program pauses until user presses any key.

ret                 ; Return control to DOS.
                    ; Ends the .COM program.