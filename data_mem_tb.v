`timescale 1ns / 1ps

module data_mem_tb();

parameter clk_period = 10;
parameter ABITS = 32;
parameter DBITS = 32;

// instruction memory
reg clk;
reg en, we;
reg [(ABITS-1):0] addr;
reg [(DBITS-1):0] din;
wire [(DBITS-1):0] dout;

data_mem d_mem( .clk(clk),
                .en(en),
                .we(we),
                .addr(addr),
                .din(din),
                .dout(dout));

always begin
    clk = 1;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    #(clk_period);
    en = 1;
    we = 0;
    addr = 32'h0000;
    din = 32'h0000;
    #(clk_period);
    $display("value stored in the address(%h) is : %h", addr, dout);
    
    en = 0;
    we = 1;
    addr = 32'h0000;
    din = 32'hf123;
    #(clk_period);
    $display("store %h in the address(%h)", din, addr);
    
    en = 1;
    we = 0;
    addr = 32'h0000;
    din = 32'h0000;
    #(clk_period);
    $display("the modified value stored in the address(%h) is : %h", addr, dout);
end

endmodule

