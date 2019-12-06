module MIPS_top(clk,reset);
input clk,reset;
wire[31:0] Instruction,busA,busB,busW,ext_imm,busB_MUX,ALUout,DataOut,PC_add4_in1,PC_add4_out,PC_add4;
wire[5:0] op,func;
wire[4:0] Rt,Rs,Rd,Rw,Rw_in,Rd_out,Rs_out,Rt_out,Rw_out;
wire[15:0] imm16,imm16_out;
wire[2:0] ALUctr,ALUop,ALUop_ctrl;
wire[1:0] WB,WB1,WB2,WB3,ForwardA,ForwardB,WB_mux_in;
wire[4:0] EX,EX1,EX_mux_in;
wire[2:0] M,M1,M2,M_mux_in;
wire[31:0] imm_shift,ADDout,ALU_out,ALUB_in,ALUA_in,busA_out,busB_out,ALUB_mux_in,busA_in,busB_in,Regw_data;
wire[31:0] PC_branch,PCorBranch,PC,PC_jump,PC_in,Instruction_out,ALUout_out,Write_datas,Dataout_muxin,ALUout_muxin;
wire RegW,Mem2Reg,Branch,Jump,MemR,MemW,RegDst,ALUSrc,zero;
wire[9:0] ID_EX_ctrl_in;

assign op=Instruction[31:26];
assign Rs=Instruction[25:21];
assign Rt=Instruction[20:16];
assign Rd=Instruction[15:11];
assign imm16=Instruction[15:0];
assign func=imm16_out[5:0];
assign WB_mux_in = {RegW,Mem2Reg};
assign M_mux_in = {Branch,1'b1,MemW};
assign EX_mux_in = {RegDst,ALUop,ALUSrc};
assign WB = ID_EX_ctrl_in[9:8];
assign M = ID_EX_ctrl_in[7:5];
assign EX = ID_EX_ctrl_in[4:0];
assign RegDst_ctrl = EX1[4];
assign ALUop_ctrl = EX1[3:1];
assign ALUSrc_ctrl = EX1[0];
assign Branch_ctrl = M2[2];
assign MemR_ctrl = M2[1];
assign MemW_ctrl = M2[0];
assign RegW_ctrl = WB3[1];
assign EX_MEM_RegWr = WB2[1];
assign Mem2Reg_ctrl = WB3[0];
assign ID_EX_MemtoReg = WB1[0];
assign Jump=!Instruction_out[31]&!Instruction_out[30]&!Instruction_out[29]&!Instruction_out[28]&Instruction_out[27]&!Instruction_out[26];
assign PC_jump = {PC[31:28],Instruction_out[25:0],2'b00};
assign PCSrc = Branch_ctrl & zero;

mux_2x1 #(32) mux_2x1_PC(.in1(PC_branch),.in0(PC_add4),.sel(PCSrc),.out(PCorBranch));  //add4 or branch
mux_2x1 #(32) mux_2x1_Jump(PC_jump,PCorBranch,Jump,PC_in);//mux_2x1(in1, in0, sel, out);  //jump or add4

PC PC_u0(.PC_in(PC_in),.PC_out(PC),.PCWr(PCWr),.clk(clk),.reset(reset));
adder_32 adder_32_PC(.C(PC_add4),.A(PC),.B(32'd4));
memorys Ins_Mem(32'b0,1'b0,{2'b00,PC[31:2]},Instruction_out,clk);//memorys(DataIn,WrEn,Adr,DataOut,Clk);

IF_ID_reg IF_ID_reg_u0(.Instruction_out(Instruction),.PC_add4_out(PC_add4_in1),.Instruction_in(Instruction_out),.PC_add4_in(PC_add4),.ctrl(IF_IDWr),.clk(clk),.reset(reset));

Hazard_detection Hazard_detection_u0(.PCWr(PCWr),.IF_IDWr(IF_IDWr),.ID_EXMux(ID_EXMux),.ID_EX_MemtoReg(ID_EX_MemtoReg),.ID_EX_Rt(Rt_out),.IF_ID_Rs(Rs),.IF_ID_Rt(Rt));
MIPS_control MIPS_control_u0(op,RegW,RegDst,ExtOp,ALUSrc,ALUop,MemW,Mem2Reg,Branch);
registers registers_u0(.busA(busA_in),.busB(busB_in),.busW(Regw_data),.Ra(Rs),.Rb(Rt),.Rw(Rw),.RegWr(RegW_ctrl),.Clk(clk));

ID_EX_reg ID_EX_reg_u0(
.busA_out(busA_out),.busB_out(busB_out),.PC_add4_out(PC_add4_out),.EX_out(EX1),.M_out(M1),.WB_out(WB1),.Ext_op_out(ExtOp_ctrl),
.imm16_out(imm16_out),.Instruction25_21_out(Rs_out),.Instruction20_16_out(Rt_out),.Instruction15_11_out(Rd_out),
.busA_in(busA_in),.busB_in(busB_in),.PC_add4_in(PC_add4_in1),.EX_in(EX),.M_in(M),.WB_in(WB),.Ext_op_in(ExtOp),
.imm16_in(imm16),.Instruction25_21_in(Rs),.Instruction20_16_in(Rt),.Instruction15_11_in(Rd),.clk(clk),.reset(reset));

extender extender_u0(.ext_imm(ext_imm),.extop(ExtOp_ctrl),.imm16(imm16_out));
shiftleft2 shiftleft2_u0(.out(imm_shift),.in(ext_imm));
adder_32 adder_32_u0(.C(ADDout),.A(PC_add4_out),.B(imm_shift));

mux_3x1 #(32) mux_3x1_a(.in10(ALUout_out), .in01(Regw_data), .in00(busA_out), .sel(ForwardA), .out(ALUA_in));
mux_3x1 #(32) mux_3x1_b(.in10(ALUout_out), .in01(Regw_data), .in00(busB_out), .sel(ForwardB), .out(ALUB_mux_in));
mux_2x1 #(32) mux_2x1_AluSrc(.in1(ext_imm),.in0(ALUB_mux_in),.sel(ALUSrc_ctrl),.out(ALUB_in));
ALU_control ALU_control_u0(func,ALUop_ctrl,ALUctr);
ALU ALU_u0(.busC(ALU_out),.zero(zero_in),.busA(ALUA_in),.busB(ALUB_in),.ALUctr(ALUctr));

Forwarding_unit Forwarding_unit_u0(.ForwardA(ForwardA),.ForwardB(ForwardB),.ID_EX_Rs(Rs_out),.ID_EX_Rt(Rt_out),.EX_MEM_Rd(Rw_out),.MEM_WB_Rd(Rw),.EX_MEM_RegWr(EX_MEM_RegWr),.MEM_WB_RegWr(RegW_ctrl));

mux_2x1 #(5) mux_2x1_RegDst(.in1(Rd_out),.in0(Rt_out),.sel(RegDst_ctrl),.out(Rw_in));

EX_MEM_reg EX_MEM_reg_u0(
.ALUout_out(ALUout_out),.zero_out(zero),.busB_out(Write_datas),.Rw_out(Rw_out),.WB_out(WB2),.M_out(M2),.ADDout_out(PC_branch),
.ALUout_in(ALU_out),.zero_in(zero_in),.busB_in(ALUB_mux_in),.Rw_in(Rw_in),.WB_in(WB1),.M_in(M1),.ADDout_in(ADDout),.clk(clk),.reset(reset));

memorys Data_Mem(Write_datas,MemW_ctrl,ALUout_out,DataOut,clk);//memorys(DataIn,WrEn,Adr,DataOut,Clk);

MEM_WB_reg MEM_WB_reg_u0(.WB_out(WB3),.Rw_out(Rw),.ALUout_out(ALUout_muxin),.DataMem_out(Dataout_muxin),
.WB_in(WB2),.Rw_in(Rw_out),.ALUout_in(ALUout_out),.DataMem_in(DataOut),.clk(clk),.reset(reset));
mux_2x1 #(32) mux_2x1_Regwrite(.in1(Dataout_muxin),.in0(ALUout_muxin),.sel(Mem2Reg_ctrl),.out(Regw_data));

mux_2x1 #(10) mux_2x1_CtlMux(.in1({WB_mux_in,M_mux_in,EX_mux_in}),.in0(10'b0),.sel(ID_EXMux),.out(ID_EX_ctrl_in));

/*MIPS_control MIPS_control(op,RegWr,RegDst,ExtOp,AluSrc,ALUop,MemWr,MemtoReg,Branch,Jump);
ins_fetch ins_fetch(Instruction,zero,Branch,Jump,clk,reset);
ALU_control ALU_control(func,ALUop,ALUctr);
mux_2x1 #(5) mux_2x1_RegDst(Rd,Rt,RegDst,Rw);//mux_2x1(in1, in0, sel, out);
registers registers(busA,busB,busW,Rs,Rt,Rw,RegWr,clk);//registers(busA,busB,busW,Ra,Rb,Rw,RegWr,Clk);
extender extender(ext_imm,ExtOp,imm16);
mux_2x1 #(32) mux_2x1_AluSrc(ext_imm,busB,AluSrc,busB_MUX);
ALU ALU(ALUout,zero,busA,busB_MUX,ALUctr);
memorys Data_Mem(busB,MemWr,ALUout,DataOut,clk);//memorys(DataIn,WrEn,Adr,DataOut,Clk);
mux_2x1 #(32) mux_2x1_MemtoReg(DataOut,ALUout,MemtoReg,busW);*/

endmodule
