LXI H, 0x002A 
MVI B, 1
MVI A, 0
MOV C, A
MOV D, A

SUM_LOOP:
    MOV     A, B          
    CPI     11 
    JZ      END
    MOV     E, M      
    MOV     A, B        
    ORA     A      
  JPE EVEN

ODD:
  MOV A, C
  ADD E
  MOV C, A
  JMP NEXT

EVEN:
  MOV A, D
  ADD E
  MOV D, A

NEXT:
  INX H
  INR B
  JMP SUM_LOOP

END:
  MOV M, D
  INX H
  MOV M, C
  HLT
