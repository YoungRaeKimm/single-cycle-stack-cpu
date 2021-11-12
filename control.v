`timescale 1ns / 1ps

module control(
    op,
    read_reg1,
    read_reg2,
    write_reg,
    read_mem,
    write_mem,
    mem_to_reg,
    pc_to_reg,
    reg_to_pc,
    alu_src,
    alu_ctl
    );
    
input wire [5:0] op;        // to be decoded opcode
output reg read_reg1;       // pops the one top register of the stacks
output reg read_reg2;       // pops the two top register of the stacks
output reg write_reg;       // pushes the value
output reg read_mem;        // loads the value from memory
output reg write_mem;       // store the value to memory
output reg mem_to_reg;      // which result to be pushed in stack (0:alu result 1:the value stored in memory)
output reg pc_to_reg;       // store the pc value to register
output reg reg_to_pc;       // pops the top of the stack and stores it in the PC
output reg alu_src;         // register value or immediate value
output reg [3:0] alu_ctl;   // control alu
    
parameter ADD = 6'b000000;
parameter SUB = 6'b000001;
parameter NEG = 6'b000010;
parameter MULT = 6'b000011;
parameter AND = 6'b000100;
parameter OR = 6'b000101;
parameter XOR = 6'b000110;
parameter NOT = 6'b000111;
    
parameter ADDI = 6'b001000;
parameter SUBI = 6'b001001;
parameter NEGI = 6'b001010;
parameter MULTI = 6'b001011;
parameter ANDI = 6'b001100;
parameter ORI = 6'b001101;
parameter XORI = 6'b001110;
parameter NOTI = 6'b001111;

parameter PUSH = 6'b100000;

parameter POP = 6'b101000;

parameter EQ = 6'b010000;
parameter GT = 6'b010001;
parameter LEQ = 6'b010010;

parameter BRANCH_ZERO = 6'b011000;
parameter BRANCH_NZERO = 6'b011001;

parameter PUSH_PC = 6'b110000;

parameter POP_PC = 6'b111000;


always @(op) begin
    case(op)
    ADD : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end
    SUB : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0001;
    end
    NEG : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0010;
    end
    MULT : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0011;
    end
    AND : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0100;
    end
    OR : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0101;
    end
    XOR : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0110;
    end
    NOT : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0111;
    end
    
    
    ADDI : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0000;
    end
    SUBI: begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0001;
    end
    NEGI : begin
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b1011;
    end
    MULTI : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0011;
    end
    ANDI : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0100;
    end
    ORI : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0101;
    end
    XORI : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b0110;
    end
    NOTI : begin
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 1;
        alu_ctl = 4'b1100;
    end
        
    PUSH : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 1;
        write_mem = 1;
        mem_to_reg = 1;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end
        
    POP : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 0;
        read_mem = 0;
        write_mem = 1;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end
        
    EQ : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b1000;
    end        
    GT : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b1001;
    end
    LEQ : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b1010;
    end    
    
    BRANCH_ZERO : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 0;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b1101;
    end
    BRANCH_NZERO : begin
        read_reg1 = 1;
        read_reg2 = 1;
        write_reg = 0;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b1110;
    end
    
    
    PUSH_PC : begin
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 1;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 1;
        reg_to_pc = 0;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end

    POP_PC : begin
        read_reg1 = 1;
        read_reg2 = 0;
        write_reg = 0;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        reg_to_pc = 1;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end    
    default : begin
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 0;
        read_mem = 0;
        write_mem = 0;
        mem_to_reg = 0;
        pc_to_reg = 0;
        alu_src = 0;
        alu_ctl = 4'b0000;
    end    
    endcase
end
    
endmodule
