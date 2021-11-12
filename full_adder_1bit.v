`timescale 1ns / 1ps

module full_adder_1bit(
    operand1,
    operand2,
    carry_in,
    sum,
    carry_out
    );
    
input operand1;
input operand2;
input carry_in;
output sum;
output carry_out;

assign sum = (operand1 ^ operand2) ^ carry_in;
assign carry_out = (operand1 & operand2) | ((operand1 ^ operand2) & carry_in);
    
endmodule
