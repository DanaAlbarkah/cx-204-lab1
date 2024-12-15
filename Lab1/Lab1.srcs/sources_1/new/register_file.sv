`timescale 1ns / 1ps

module register_file #(
    parameter REG_WIDTH = 16, 
    parameter NUM_REGS = 4    
) (
    input logic clk,                     
    input logic rst,                     
   // input logic wr_en,                   
    input logic [$clog2(NUM_REGS)-1:0] rs1, // Source register 1 index
    input logic [$clog2(NUM_REGS)-1:0] rs2, // Source register 2 index
    input logic [$clog2(NUM_REGS)-1:0] rd,  // Destination register index
    input logic [REG_WIDTH-1:0] data_in,  // Data to write
    output logic [REG_WIDTH-1:0] data_rs1,// Output from register rs1
    output logic [REG_WIDTH-1:0] data_rs2 // Output from register rs2
);
    integer fd;
integer i;
initial
begin
// Create a new file
fd = $fopen("regfile.dump", "w");
#100;
$fclose(fd);
end
    logic [REG_WIDTH-1:0] reg_file [NUM_REGS-1:0];

    // Read logic
    assign data_rs1 = (rs1 == 0) ? 0 : reg_file[rs1]; // x0 always 0
    assign data_rs2 = (rs2 == 0) ? 0 : reg_file[rs2]; // x0 always 0

    // Write logic
    always_ff @(posedge clk or negedge rst)begin
        if (~rst)begin
            reg_file[0] <= 0; // Ensure x0 is always 0
        end else if (rd != 0) begin
            reg_file[rd] <= data_in; // Write to rd, except x0
        end
    end

    initial begin
        $readmemh("/home/it/Chip_Design/CommonCore/CompArch/cx-204/lab1/Lab1/Lab1.srcs/sources_1/new/fib_rf.mem", reg_file); 
    end
    
    always @ (posedge clk)
begin
for (i = 0; i < 4; i=i+1)
begin
$fdisplay(fd,reg_file[i]);
end
end
endmodule