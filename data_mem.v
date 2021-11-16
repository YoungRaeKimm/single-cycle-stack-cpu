`timescale 1ns / 1ps

module data_mem(clk,
                en,
                we,
                addr,
                din,
                dout);

parameter DBITS = 32;
parameter ABITS = 32;
parameter WORDS = (1<<(ABITS-10));
parameter MFILE = "datas.mem";

reg [(DBITS-1):0] mem[0:(1024-1)];

input clk, en, we;
input [(ABITS-1):0] addr;
input [(DBITS-1):0] din;
output wire [(DBITS-1):0] dout;

initial begin
    $readmemb(MFILE, mem); //read data
end

assign dout = (en==1) ? mem[addr] : 32'hxxxxxxxx;
always @(posedge clk) begin    
    if(we==1) begin
        mem[addr] = din;
    end    
end

endmodule
