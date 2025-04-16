ORG 0x0020       ; Тестовые значения
DB 0x01      
DB 0x02     
DB 0x03      
DB 0x04     
DB 0x05       
DB 0x06     
DB 0x07   
DB 0x08  
DB 0x09   
DB 0x10        


LXI H, 0x0020	 
MVI D, 10       
SUB A      

LOOP:    
	ADD M        
	INX H     
	DCR D  
JNZ LOOP         ; Если D != 0, повторяем цикл

MOV M, A      
HLT      

