module MIPS_top(clk,reset);
input clk,reset;
wire[31:0] Instruction,busA,busB,busW,ext_imm,busB_MUX,ALUout,DataOut;
wire[5:0] op,func;
wire[4:0] Rt,Rs,Rd,Rw;
wire[15:0] imm16;
wire[2:0] ALUctr,ALUop;

ins_fetch ins_fetch(Instruction,zero,Branch,Jump,clk,reset);
assign op=Instruction[31:26];
assign Rt=Instruction[25:21];
assign Rs=Instruction[20:16];
assign Rd=Instruction[15:11];
assign imm16=Instruction[15:0];
assign func=Instruction[5:0];

MIPS_control MIPS_control(op,RegWr,RegDst,ExtOp,AluSrc,ALUop,MemWr,MemtoReg,Branch,Jump);
ALU_control ALU_control(func,ALUop,ALUctr);

mux_2x1 #(5) mux_2x1_RegDst(Rd,Rt,RegDst,Rw);//mux_2x1(in1, in0, sel, out);
registers registers(busA,busB,busW,Rs,Rt,Rw,RegWr,clk);//registers(busA,busB,busW,Ra,Rb,Rw,RegWr,Clk);
extender extender(ext_imm,ExtOp,imm16);
mux_2x1 #(32) mux_2x1_AluSrc(ext_imm,busB,AluSrc,busB_MUX);
ALU ALU(ALUout,zero,busA,busB_MUX,ALUctr);
memorys Data_Mem(busB,MemWr,ALUout,DataOut,clk);//memorys(DataIn,WrEn,Adr,DataOut,Clk);
mux_2x1 #(32) mux_2x1_MemtoReg(DataOut,ALUout,MemtoReg,busW);

endmodule
