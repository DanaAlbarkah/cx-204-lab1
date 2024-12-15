`timescale 1ns / 1ps


module tb_Top;
    logic  clk=0; 
    logic resetn;
    
    always #5 clk = ~clk;
    top DUT (.*);
    
    initial begin
    resetn =1; #5;
    resetn =0; #5;
    resetn =1; #5;
    #100;
    $finish; 
    end
endmodule
