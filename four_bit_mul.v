`timescale 1ns / 1ps
module four_bit_mul(
    clk,
    operand1,
    operand2,
    product
    );
    
input clk;
input [3:0] operand1;
input [3:0] operand2;
output [7:0] product;

wire [7:0] product_reg [3:0][3:0];

single_bit_mul U00(.clk(clk),
                .operand1(operand1[0]),
                .operand2(operand2[0]),
                .product(product_reg[0][0])
                );
single_bit_mul U10(.clk(clk),
                .operand1(operand1[1]),
                .operand2(operand2[0]),
                .product(product_reg[1][0])
                );
single_bit_mul U20(.clk(clk),
                .operand1(operand1[2]),
                .operand2(operand2[0]),
                .product(product_reg[2][0])
                );
single_bit_mul U30(.clk(clk),
                .operand1(operand1[3]),
                .operand2(operand2[0]),
                .product(product_reg[3][0])
                );
single_bit_mul U01(.clk(clk),
                .operand1(operand1[0]),
                .operand2(operand2[1]),
                .product(product_reg[0][1])
                );
single_bit_mul U11(.clk(clk),
                .operand1(operand1[1]),
                .operand2(operand2[1]),
                .product(product_reg[1][1])
                );
single_bit_mul U21(.clk(clk),
                .operand1(operand1[2]),
                .operand2(operand2[1]),
                .product(product_reg[2][1])
                );
single_bit_mul U31(.clk(clk),
                .operand1(operand1[3]),
                .operand2(operand2[1]),
                .product(product_reg[3][1])
                );
single_bit_mul U02(.clk(clk),
                .operand1(operand1[0]),
                .operand2(operand2[2]),
                .product(product_reg[0][2])
                );
single_bit_mul U12(.clk(clk),
                .operand1(operand1[1]),
                .operand2(operand2[2]),
                .product(product_reg[1][2])
                );
single_bit_mul U22(.clk(clk),
                .operand1(operand1[2]),
                .operand2(operand2[2]),
                .product(product_reg[2][2])
                );
single_bit_mul U32(.clk(clk),
                .operand1(operand1[3]),
                .operand2(operand2[2]),
                .product(product_reg[3][2])
                );
single_bit_mul U03(.clk(clk),
                .operand1(operand1[0]),
                .operand2(operand2[3]),
                .product(product_reg[0][3])
                );
single_bit_mul U13(.clk(clk),
                .operand1(operand1[1]),
                .operand2(operand2[3]),
                .product(product_reg[1][3])
                );
single_bit_mul U23(.clk(clk),
                .operand1(operand1[2]),
                .operand2(operand2[3]),
                .product(product_reg[2][3])
                );
single_bit_mul U33(.clk(clk),
                .operand1(operand1[3]),
                .operand2(operand2[3]),
                .product(product_reg[3][3])
                );
    
assign product = (product_reg[0][0] << 0) + (product_reg[1][0] << 1) + (product_reg[2][0] << 2) + (product_reg[3][0] << 3)
 + (product_reg[0][1] << 1) + (product_reg[1][1] << 2) + (product_reg[2][1] << 3) + (product_reg[3][1] << 4)
  + (product_reg[0][2] << 2) + (product_reg[1][2] << 3) + (product_reg[2][2] << 4) + (product_reg[3][2] << 5)
   + (product_reg[0][3] << 3) + (product_reg[1][3] << 4) + (product_reg[2][3] << 5) + (product_reg[3][3] << 6);

       
    
endmodule
