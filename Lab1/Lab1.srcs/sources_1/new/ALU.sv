module ALU
#(parameter ALU_WIDTH=16) 
(    input logic [ALU_WIDTH-1 :0] rs1,rs2 ,
    input [1:0] opcode,    output logic [ALU_WIDTH-1:0] result
    );    
    always @(*) begin   
     if (opcode == 2'b00)
         result = rs1 + rs2;
       else if (opcode == 2'b01)  
          result = rs1 - rs2; 
          else if  (opcode == 2'b10)  
         result = rs1 & rs2;    
          else
         result = rs1 | rs2;  
       end
    endmodule