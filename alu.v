`timescale 1ns / 1ps

module alu(
    operand1,
    operand2,
    alu_ctl,
    branch,
    alu_result
    );
    
input wire [31:0] operand1;
input wire [31:0] operand2;
input wire [3:0] alu_ctl;
output wire branch;
output reg  [31:0] alu_result;
    
reg [31:0] op1;
reg [31:0] op2;
reg neg1;
reg neg2;
wire [31:0] sum;

full_adder_32bit adder(.operand1(op1),
                        .operand2(op2),
                        .neg1(neg1),
                        .neg2(neg2),
                        .sum(sum));

assign branch = (alu_ctl == 4'b1101 && operand2 == 0) ? 1 : (alu_ctl == 4'b1110 && operand2 != 0) ? 1 : 0;
always @(*) begin
    case(alu_ctl)
        4'b0000: begin      // add
            op1 = operand1;
            op2 = operand2;
            neg1=0;
            neg2=0;
            alu_result = sum;
        end
        4'b0001: begin      // sub
            op1 = operand1;
            op2 = operand2;
            neg1=0;
            neg2=1;
            alu_result = sum;
        end
        4'b0010: begin      // neg
            op1 = operand1;
            op2 = 32'h0;
            neg1=1;
            neg2=0;
            alu_result = sum;
        end
        4'b0011: begin      // mult
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = operand1 * operand2;
        end
        4'b0100: begin      // and
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = operand1 & operand2;
        end
        4'b0101: begin      // or
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = operand1 | operand2;
        end
        4'b0110: begin      // xor
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = operand1 ^ operand2;
        end
        4'b0111: begin      // not
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = ~operand1;
        end
        4'b1011: begin      // negi
            op1 = 32'h0;
            op2 = operand2;
            neg1=0;
            neg2=1;
            alu_result = sum;
        end
        4'b1100: begin      // noti
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = ~operand2;
        end
        4'b1000: begin      // eq
            op1 = operand1;
            op2 = operand2;
            neg1=0;
            neg2=1;
            alu_result = !sum;
        end
        4'b1001: begin      // gt
            op1 = operand1;
            op2 = operand2;
            neg1=0;
            neg2=1;
            alu_result = !sum[31];
        end
        4'b1010: begin      // leq
            op1 = operand1;
            op2 = operand2;
            neg1=0;
            neg2=1;
            alu_result = sum[31];
        end
        4'b1101: begin      // branch_zero
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = sum;
        end
        4'b1110: begin      // branch_nzero
            op1 = 32'h0;
            op2 = 32'h0;
            neg1=0;
            neg2=0;
            alu_result = sum;
        end
        
        default: begin
            op1 = 4'h0;
            op2 = 4'h0;
            neg1=0;
            neg2=0;
            alu_result = sum;
        end
    
    endcase


end
    
    
endmodule
