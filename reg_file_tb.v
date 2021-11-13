`timescale 1ns / 1ps

module reg_file_tb();

parameter clk_period = 10;
parameter DBITS = 32;

reg clk, rst;
reg read_reg1;
reg read_reg2;
reg write_reg;
reg [DBITS-1:0] din_reg;
wire [DBITS-1:0] dout_reg1;
wire [DBITS-1:0] dout_reg2;

reg_file stack( .clk(clk),
                .rst(rst),
                .en1(read_reg1),
                .en2(read_reg2),
                .we(write_reg),
                .din(din_reg),
                .dout1(dout_reg1),
                .dout2(dout_reg2));
                
always begin
    clk <= 0;
    forever #(clk_period/2) clk <= ~clk;
end

initial begin
    rst <= 1;
    @(posedge clk);
    rst <= 0;
    read_reg1 <= 0;     // push
    read_reg2 <= 0;
    write_reg <= 1;
    din_reg <= 32'h0;
    @(posedge clk);
    read_reg1 <= 0;     // push
    read_reg2 <= 0;
    write_reg <= 1;
    din_reg <= 32'h1;
    @(posedge clk);
    read_reg1 <= 0;     // push
    read_reg2 <= 0;
    write_reg <= 1;
    din_reg <= 32'h2;
    @(posedge clk);
    read_reg1 <= 0;     // push
    read_reg2 <= 0;
    write_reg <= 1;
    din_reg <= 32'h3;
    @(posedge clk);
    
    read_reg1 <= 1;     // pops two register and push
    read_reg2 <= 1;
    write_reg <= 1;
    din_reg <= 32'h4;
    @(posedge clk);
    
    read_reg1 <= 1;     // pops one register
    read_reg2 <= 0;
    write_reg <= 0;
    din_reg <= 32'h0;
    @(posedge clk);
    read_reg1 <= 1;     // pops two register
    read_reg2 <= 1;
    write_reg <= 0;
    din_reg <= 32'h0;
    @(posedge clk);
    read_reg1 = 0;
    read_reg2 = 0;
end


endmodule