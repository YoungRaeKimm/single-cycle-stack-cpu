`timescale 1ns / 1ps


module inst_mem_tb();

parameter clk_period = 10;
parameter ABITS = 32;

// instruction memory
reg clk;
reg [(ABITS-1):0] pc;
wire [(ABITS-1):0] fetched_inst;
reg [(ABITS-1):0] din_inst_mem;
reg read_inst_mem;
reg write_inst_mem;

inst_mem i_mem(.clk(clk),
                .en(read_inst_mem),
                .we(write_inst_mem),
                .pc(pc),
                .din(din_inst_mem),
                .dout(fetched_inst));    
      
always begin
    clk = 1;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    pc = 0;
    read_inst_mem = 1;
    write_inst_mem = 0;      
    din_inst_mem = 32'hxxxxxxxx;
//    rst = 1;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd10;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd34;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd20;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd31;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd57;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd60;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd67;
    @(posedge clk)
    $display("program counter : %d instruction : %h", pc, fetched_inst);
    pc=32'd78;
end

//always @(posedge clk)begin
//    $display("program counter : %d instruction : %h", pc, fetched_inst);
//    pc=pc+1;
//end

endmodule

