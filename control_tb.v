`timescale 1ns / 1ps


module control_tb();

parameter clk_period = 10;
parameter ABITS = 32;

reg clk;
// control
reg [5:0] opcode;
wire read_reg1;
wire read_reg2;
wire write_reg;
wire read_mem;
wire write_mem;
wire mem_to_reg;
wire pc_to_reg;
wire reg_to_pc;
wire alu_src;
wire [3:0] alu_ctl;


control control_unit(
                    .op(opcode),
                    .read_reg1(read_reg1),
                    .read_reg2(read_reg2),
                    .write_reg(write_reg),
                    .read_mem(read_mem),
                    .write_mem(write_mem),
                    .mem_to_reg(mem_to_reg),
                    .pc_to_reg(pc_to_reg),
                    .reg_to_pc(reg_to_pc),
                    .alu_src(alu_src),
                    .alu_ctl(alu_ctl));     
                    
always begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    #(clk_period*0.5)
    
    opcode = 6'b000000; // add
    #(clk_period) 
    $display("add opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000001; // sub
    #(clk_period) 
    $display("sub opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000010; // neg
    #(clk_period) 
    $display("negopcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000011; // mult
    #(clk_period) 
    $display("mult opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000100; // and
    #(clk_period) 
    $display("and opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000101; // or
    #(clk_period) 
    $display("or opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000110; // xor
    #(clk_period) 
    $display("xor opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b000111; // not
    #(clk_period) 
    $display("not opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001000; // addi
    #(clk_period) 
    $display("addi opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001001; // subi
    #(clk_period) 
    $display("subi opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001010; // negi
    #(clk_period) 
    $display("negi opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001011; // multi
    #(clk_period) 
    $display("multi opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001100; // andi
    #(clk_period) 
    $display("andi opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001101; // ori
    #(clk_period) 
    $display("ori opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001110; // xori
    #(clk_period) 
    $display("xori opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b001111; // noti
    #(clk_period) 
    $display("noti opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b100000; // push
    #(clk_period) 
    $display("push opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b101000; // pop
    #(clk_period) 
    $display("pop opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b010000; // eq
    #(clk_period) 
    $display("eq opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b010001; // gt
    #(clk_period) 
    $display("gt opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b010010; // leq
    #(clk_period) 
    $display("leq opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b011000; // branch_zero
    #(clk_period) 
    $display("branch_zero opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b011001; // branch_nzero
    #(clk_period) 
    $display("branch_nzero opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b110000; // push_pc
    #(clk_period) 
    $display("push_pc opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
    opcode = 6'b111000; // pop_pc
    #(clk_period) 
    $display("pop_pc opcode : %h read_reg1 : %d read_reg2 : %d write_reg : %d read_mem : %d write_mem : %d mem_to_reg : %d pc_to_reg : %d reg_to_pc : %d alu_src : %d alu_ctl : %h", opcode, read_reg1, read_reg2, write_reg, read_mem, write_mem, mem_to_reg, pc_to_reg, reg_to_pc, alu_src, alu_ctl);
    
end

endmodule
