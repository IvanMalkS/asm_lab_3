LXI H, 0x0015	 
MVI D, 10       
SUB A      

LOOP:    
	ADD M        
	INX H     
	DCR D  
JNZ LOOP         ; Если D != 0, повторяем цикл

MOV M, A      
HLT      
