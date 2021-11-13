`timescale 1ns / 1ps


module inst_mem_tb();

parameter clk_period = 10;
parameter ABITS = 32;

// instruction memory
reg clk;
reg [(ABITS-1):0] pc;
wire [(ABITS-1):0] fetched_inst;
reg read_inst_mem;

inst_mem i_mem(
                .en(read_inst_mem),
               .pc(pc),
               .dout(fetched_inst));    
                    
always begin
    clk = 1;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    pc = 0;
    read_inst_mem = 1;
end

always @(posedge clk)begin
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=pc+1;
end

endmodule

