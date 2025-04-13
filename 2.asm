ORG 0x0015
DB 0x00, 0x00, 0x00, 0x01

LXI H, 0x0015
MOV B, M         ; B = x1 = 0x00

INX H
MOV A, M         ; x2 = 0x00
CMA              ; A = 0xFF
MOV D, A         ; D = ¬x2

INX H
MOV A, M         ; x3 = 0x00
CMA              ; A = 0xFF
ANA B            ; A = ¬x3 AND x1 = 0x00
MOV C, A         ; C = промежуточный результат

MOV A, D         ; A = ¬x2
XRA C            ; A = ¬x2 XOR (¬x3 AND x1) = 0xFF

INX H
XRA M            ; A = промежуточный XOR x4 = 0xFE

ANI 0x01         ; Оставляем младший бит (0x00)

; Записываем результат
LXI H, 0x0019
MOV M, A         ; Гарантированно пишем в 0x0019
HLT
