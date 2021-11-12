`timescale 1ns / 1ps

module inst_mem(
                en,
                pc,
                dout);

parameter DBITS = 32;
parameter ABITS = 32;
parameter WORDS = (1<<(ABITS-2));
parameter MFILE = "instructions.mem";

reg [(ABITS-1):0] mem[0:(WORDS)-1];

//input clk;
input en;
input wire [(ABITS-1):0] pc;
output wire [(ABITS-1):0] dout;

initial begin
    $readmemb(MFILE, mem); //read data
end

assign dout = (en) ? mem[pc] : 32'hxxxxxxxx;

endmodule
