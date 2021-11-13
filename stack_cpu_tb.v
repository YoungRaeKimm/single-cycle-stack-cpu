`timescale 1ns / 1ps


module stack_cpu_tb();


reg clk;
reg reset;

parameter clk_period = 10;
parameter DBITS = 32;
parameter ABITS = 32;
parameter WORDS = (1<<ABITS);

// instruction memory
reg [ABITS-1:0] pc;
wire [ABITS-1:0] inst;
wire read_inst_mem;

// control
wire [5:0] opcode;
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

// register
wire [DBITS-1:0] din_reg;
wire [DBITS-1:0] dout_reg1;
wire [DBITS-1:0] dout_reg2;

// ALU
wire [DBITS-1:0] alu_in1;
wire [DBITS-1:0] alu_in2;
wire [31:0] imm;
wire branch;
wire [DBITS-1:0] alu_result;

// data memory           
wire [ABITS-1:0] addr_mem;
wire [DBITS-1:0] din_mem;
wire [DBITS-1:0] dout_mem;

inst_mem i_mem(
                .en(read_inst_mem),
               .pc(pc),
               .dout(inst));                

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
                    
reg_file stack(
                .clk(clk),
                .rst(reset),
                .en1(read_reg1),
                .en2(read_reg2),
                .we(write_reg),
                .din(din_reg),
                .dout1(dout_reg1),
                .dout2(dout_reg2));      
                         
alu alu_unit(
                .operand1(alu_in1),
                .operand2(alu_in2),
                .alu_ctl(alu_ctl),
                .branch(branch),
                .alu_result(alu_result));      
              
data_mem d_mem(
                .clk(clk),
                .en(read_mem),
                .we(write_mem),
                .addr(addr_mem),
                .din(din_mem),
                .dout(dout_mem));

assign opcode = inst[31:26];
assign read_inst_mem = 1;
assign imm = {{22{inst[25]}}, {inst[24:16]} };
assign alu_in1 = dout_reg1;
assign alu_in2 = (alu_src == 0) ? dout_reg2 : imm;
assign addr_mem = (read_mem == 1) ? dout_reg1 : 32'hxxxxxxxx;
assign din_mem = dout_reg2;
assign din_reg = (pc_to_reg == 1) ? (pc + 2) : (mem_to_reg == 1) ? dout_mem : alu_result;
                    
always begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end


initial begin
    @(posedge clk);
    reset = 1;
    @(posedge clk);
    reset = 0;
end


always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <= 0;
    end
    else begin
        pc <= (reg_to_pc==1 || branch == 1) ? dout_reg1  : pc + 1;
    end
end

endmodule
