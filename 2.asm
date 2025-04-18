LXI H, 0x001A   ; Point HL to the first input byte (x1)
MOV B, M       ; B = x1

INX H          ; Point HL to the second input byte (x2)
MOV A, M       ; A = x2
CMA            ; A = NOT x2
MOV D, A       ; D = NOT x2  (Need to save NOT x2 temporarily)

INX H          ; Point HL to the third input byte (x3)
MOV A, M       ; A = x3
CMA            ; A = NOT x3
ANA B          ; A = (NOT x3) AND x1 (Result C from original code is now in A)

XRA D          ; A = A XOR D = ((NOT x3) AND x1) XOR (NOT x2)
               ; This is equivalent to D XOR C from original due to XOR commutativity

INX H          ; Point HL to the fourth input byte (x4)
XRA M          ; A = A XOR x4 = ((NOT x3) AND x1) XOR (NOT x2) XOR x4

ANI 0x01       ; Keep only the least significant bit

; Store the result
LXI H, 0x001E   ; Point HL to the output location
MOV M, A       ; Store the final LSB result
HLT            ; Halt
