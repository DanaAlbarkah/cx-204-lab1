`timescale 1ns / 1ps

    module program_counter#(
    parameter PROG_VALUE=3
)(
    input logic clk,
    input logic resetn,
    output logic [$clog2(PROG_VALUE+1)-1 : 0] count
);

    always_ff @(posedge clk) begin 
        if(~resetn) count <= 0;
        else begin 
       count <= count + 1;
        end
    end
endmodule