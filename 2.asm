LXI H, 0x001A   
MOV B, M      

INX H          
MOV A, M      
CMA            
MOV D, A       

INX H          
MOV A, M       
CMA            
ANA B          

XRA D        

INX H         
XRA M          

ANI 0x01      


LXI H, 0x001E  
MOV M, A       
HLT          
