; Y = X4 - (X2 - X3) - X1

ORG 0x0020
DB 0x05, 0x14, 0x0F, 0x14   ; X1=5, X2=20, X3=15, X4=20

LXI H, 0x0021     ; HL = адрес X2
MOV A, M          ; A = X2 = 20
INX H             ; HL = адрес X3
SUB M             ; A = X2 - X3 = 5
MOV D, A          ; D = (X2 - X3) = 5

INX H             ; HL = адрес X4
MOV A, M          ; A = X4 = 20
SUB D             ; A = X4 - (X2 - X3) = 15

LXI H, 0x0020     ; HL = адрес X1
SUB M             ; A = 15 - X1 = 10

INX H
INX H
INX H
INX H             ; HL = 0x0024
MOV M, A          ; [0x0024] = 0x0A (10)
HLT
