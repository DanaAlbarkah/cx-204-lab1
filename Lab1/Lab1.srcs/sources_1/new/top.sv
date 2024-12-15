`timescale 1ns / 1ps

module top#
(   parameter REG_WIDTH = 16, 
    parameter NUM_REGS = 4,
    parameter PROG_VALUE=3,
    parameter ALU_WIDTH=16,
    parameter IMEM_DEPTH=4 ,
    parameter width=8,
    parameter depth=4)
(input clk,
input resetn);



  logic [1:0] count; 
  logic  [7:0] instruction;
  logic [ALU_WIDTH-1:0]ALU_out;
  logic [15:0] data_rs1;
  logic [15:0] data_rs2;
  
  
     program_counter#(.PROG_VALUE(PROG_VALUE))
     PC(
     .clk(clk),
     .resetn(resetn),
     .count(count)
    );

    Instruction_memory #(.width(width) , .IMEM_DEPTH(IMEM_DEPTH))
     IM(.address(count),   .instruction(instruction)    );

    register_file #(
     .REG_WIDTH(REG_WIDTH), 
     .NUM_REGS(NUM_REGS) ) 
  re(
   .clk(clk),                     
   .rst(resetn),                     
    .rs1(instruction[3:2]),
   .rs2(instruction[5:4]),
   .rd(instruction[7:6]), 
   .data_in(ALU_out), 
   .data_rs1(data_rs1),
   .data_rs2(data_rs2));
    
    ALU #(.ALU_WIDTH(ALU_WIDTH)) ALU_1 
(  .rs1(data_rs1),
   .rs2(data_rs2) ,
   .opcode(instruction[1:0]),
   .result(ALU_out)
    ); 
    
   
endmodule
