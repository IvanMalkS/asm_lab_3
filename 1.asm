; Адреса:
; 0x014: X1 - 05
; 0x015: X2 - 14
; 0x016: X3 - 0F
; 0x017: X4 - 14
; 0x018: y - 0A

; y = (X4 - (X2 - X3)) - X1

LXI H, 0x0014     ; HL = адрес X1

MOV E, M          ; E = X1 (из 0x0100)
INX H             ; HL = адрес X2
MOV C, M          ; C = X2 (из 0x0101)
INX H             ; HL = адрес X3
MOV D, M          ; D = X3 (из 0x0102)
INX H             ; HL = адрес X4
MOV A, M          ; A = X4 (из 0x0103)

MOV B, A          ; Сохраним X4 (в A) временно в B
MOV A, C          ; A = X2 (из C)
SUB D             ; A = X2 - X3
MOV C, A          ; C = X2 - X3 (Сохраним промежуточный результат в C)

MOV A, B          ; A = X4 (Восстановим X4 из B)
SUB C             ; A = X4 - (X2 - X3)

SUB E             

INX H
MOV M, A         
HLT             
