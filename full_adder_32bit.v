`timescale 1ns / 1ps

module full_adder_32bit(
    operand1,
    operand2,
    neg1,
    neg2,
    sum
    );
    
input wire [31:0] operand1;
input wire [31:0] operand2;
input wire neg1;
input wire neg2;
output wire [31:0] sum;

wire [31:0] carry;
wire [31:0] sign_op1;
wire [31:0] sign_op2;


assign sign_op1 = (neg1 == 1) ? ~operand1 + 1 : operand1;
assign sign_op2 = (neg2 == 1) ? ~operand2 + 1 : operand2;

genvar i;
generate
    for(i=0; i<32; i=i+1) begin
        if(i==0)
            full_adder_1bit adder(sign_op1[i], sign_op2[i], 0, sum[i], carry[i]);
        else
            full_adder_1bit adder(sign_op1[i], sign_op2[i], carry[i-1], sum[i], carry[i]);
    end
endgenerate
    
endmodule
