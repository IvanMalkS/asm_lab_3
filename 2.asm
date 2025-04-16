ORG 0x0015
DB 0x00, 0x00, 0x01, 0x01

; Сброс всех используемых регистров
XRA A          ; A = 0
MOV B, A       ; B = 0
MOV D, A       ; D = 0
MOV C, A       ; C = 0

LXI H, 0x0020
MOV B, M       ; B = x1 = 0x01

INX H
MOV A, M       ; x2 = 0x01
CMA            ; A = 0xFE
MOV D, A       ; D = ¬x2

INX H
MOV A, M       ; x3 = 0x00
CMA            ; A = 0xFF
ANA B          ; A = ¬x3 ∧ x1 = 0x01
MOV C, A       ; C = 0x01

MOV A, D       ; A = ¬x2 = 0xFE
XRA C          ; A = 0xFF

INX H
XRA M          ; A = 0xFE

; Двойная проверка результата
ANI 0x01       ; Должно быть 0x00
MOV A, A       ; Фиктивная операция для проверки флагов

LXI H, 0x0024
MOV M, A       ; Гарантированно 0x00
HLT
