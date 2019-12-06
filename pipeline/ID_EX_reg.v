module ID_EX_reg(
busA_out,busB_out,PC_add4_out,EX_out,M_out,WB_out,Ext_op_out,
imm16_out,Instruction25_21_out,Instruction20_16_out,Instruction15_11_out,
busA_in,busB_in,PC_add4_in,EX_in,M_in,WB_in,Ext_op_in,
imm16_in,Instruction25_21_in,Instruction20_16_in,Instruction15_11_in,clk,reset);

input busA_in,busB_in,PC_add4_in,EX_in,M_in,WB_in,Ext_op_in,Ext_op_in,
imm16_in,Instruction25_21_in,Instruction20_16_in,Instruction15_11_in,clk,reset;
output busA_out,busB_out,PC_add4_out,EX_out,M_out,WB_out,Ext_op_out,
imm16_out,Instruction25_21_out,Instruction20_16_out,Instruction15_11_out;

wire [31:0]busA_in,busB_in,PC_add4_in;
wire [4:0]Instruction25_21_in,Instruction20_16_in,Instruction15_11_in;
wire [15:0]imm16_in;
wire [1:0]WB_in;
wire [4:0]EX_in;
wire [2:0]M_in;
wire clk,Ext_op_in;

reg [31:0]busA_out,busB_out,PC_add4_out;
reg [4:0]Instruction25_21_out,Instruction20_16_out,Instruction15_11_out;
reg [15:0]imm16_out;
reg [1:0]WB_out;
reg [4:0]EX_out;
reg [2:0]M_out;
reg Ext_op_out;

always@(negedge clk)
begin
	if(!reset)
	begin
	{busA_out,busB_out,PC_add4_out,EX_out,M_out,WB_out,Ext_op_out,Ext_op_out,
imm16_out,Instruction25_21_out,Instruction20_16_out,Instruction15_11_out} <= 500'b0;
	end
	else
	begin
	{busA_out,busB_out,PC_add4_out,EX_out,M_out,WB_out,Ext_op_out,Ext_op_out,
imm16_out,Instruction25_21_out,Instruction20_16_out,Instruction15_11_out} <= 
	{busA_in,busB_in,PC_add4_in,EX_in,M_in,WB_in,Ext_op_in,Ext_op_in,
imm16_in,Instruction25_21_in,Instruction20_16_in,Instruction15_11_in};
	end
end

endmodule
