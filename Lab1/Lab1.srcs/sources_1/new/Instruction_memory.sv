
module Instruction_memory #(parameter width=8 , parameter IMEM_DEPTH=4)(  
  input logic [($clog2(IMEM_DEPTH) -1) : 0]  address,  
  output logic [width -1 : 0] instruction    );
       
  reg [width -1:0] memory [IMEM_DEPTH-1:0];
   
    initial begin   
 //   memory [0]= 11011000 ; // x3 = x1 + x2
 //  memory [1]= 01101100 ; // x1 = x2 + x3   
 //   memory [2]= 10110100 ; // x2 = x3 + x1
 //  memory [3]= 00110100 ; // x0 = x3 + x1 
 $readmemb("/home/it/Chip_Design/CommonCore/CompArch/cx-204/lab1/Lab1/Lab1.srcs/sources_1/new/fib_im.mem",memory );
       end
       
       always_comb begin
        instruction = memory[address];  // Fetch the instruction based on address
    end
       
endmodule