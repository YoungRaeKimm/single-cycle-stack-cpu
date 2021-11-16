`timescale 1ns / 1ps


module alu_tb();

parameter clk_period = 10;
parameter DBITS = 32;
parameter ABITS = 32;
parameter WORDS = (1<<ABITS);

reg clk;

// ALU
reg [DBITS-1:0] alu_in1;
reg [DBITS-1:0] alu_in2;
reg [3:0] alu_ctl;
wire branch;
wire [DBITS-1:0] alu_result;

                         
alu alu_unit(
                .operand1(alu_in1),
                .operand2(alu_in2),
                .alu_ctl(alu_ctl),
                .branch(branch),
                .alu_result(alu_result));     
                    
always begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    #(clk_period*0.5);
    
    alu_in1 = 32'h00001000;
    alu_in2 = 32'h00000001;
    alu_ctl = 4'b0000; // add
    #(clk_period); 
    $display("add %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0001; // sub
    #(clk_period); 
    $display("sub %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0010; // neg
    #(clk_period); 
    $display("neg %h    result : %h branch : %h", alu_in1, alu_result, branch);
    
    alu_ctl = 4'b0011; // mult
    #(clk_period); 
    $display("mult %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0100; // and
    #(clk_period); 
    $display("and %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0101; // or
    #(clk_period); 
    $display("or %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0110; // xor
    #(clk_period); 
    $display("xor %h  %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b0111; // not
    #(clk_period); 
    $display("not %h    result : %h branch : %h", alu_in1, alu_result, branch);
    
    alu_ctl = 4'b1011; // negi
    #(clk_period); 
    $display("negi %h    result : %h branch : %h", alu_in2, alu_result, branch);
    
    alu_ctl = 4'b1100; // noti
    #(clk_period); 
    $display("noti %h    result : %h branch : %h", alu_in2, alu_result, branch);
    
    alu_ctl = 4'b1000; // eq
    #(clk_period); 
    $display("eq %h %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b1001; // gt
    #(clk_period); 
    $display("gt %h %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_ctl = 4'b1010; // leq
    #(clk_period); 
    $display("leq %h %h    result : %h branch : %h", alu_in1, alu_in2, alu_result, branch);
    
    alu_in2 = 32'h0;
    alu_ctl = 4'b1101; // branch_zero
    #(clk_period); 
    $display("branch zero %h    result : %h branch : %h", alu_in2, alu_result, branch);
    
    alu_ctl = 4'b1110; // branch_nzero
    #(clk_period); 
    $display("branch nzero %h    result : %h branch : %h", alu_in2, alu_result, branch);
    
    
    
end

endmodule
