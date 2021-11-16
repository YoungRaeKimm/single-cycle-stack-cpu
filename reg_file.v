`timescale 1ns / 1ps


module reg_file(
                clk,
                rst,
                en1,
                en2,
                we,
                din,
                dout1,
                dout2);

parameter DBITS = 32;   // If you want to make 16 bit registers, set DBITS = 16;
parameter ABITS = 32;
parameter WORDS = (1<<(ABITS-24));

reg [(DBITS-1):0] push_buffer;
reg prev_we;
reg [(DBITS-1):0] stack [0:(WORDS-1)];
reg [(ABITS-1):0] sp; // stack pointer

input clk, rst, en1, en2, we;
input [(DBITS-1):0] din;
output wire [(DBITS-1):0] dout1;
output wire [(DBITS-1):0] dout2;

assign dout1 = (en1==1) ? ((prev_we==1 ) ? push_buffer : stack[sp] ): 32'hxxxxxxxx;
assign dout2 = (en2==1) ? stack[sp-1] : 32'hxxxxxxxx;

always @(posedge clk) begin
    if (rst==1) begin
        sp <= 32'h0;
        prev_we <= 0;
        push_buffer <= 32'h0;
    end
    else begin
        prev_we <= we;
        push_buffer <= din;
        if (prev_we==1)
            stack[sp] <= push_buffer;
        case({en1, en2, we})
            3'b111: sp <= sp-1;
            3'b110: sp <= sp-2;
            3'b101: sp <= sp;
            3'b100: sp <= sp-1;
            3'b011: sp <= sp;
            3'b010: sp <= sp-1;
            3'b001: sp <= sp+1;
            3'b000: sp <= sp;
            default : sp <= sp;
        endcase
    end
end

endmodule
