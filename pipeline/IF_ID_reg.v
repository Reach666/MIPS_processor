module IF_ID_reg(Instruction_out,PC_add4_out,Instruction_in,PC_add4_in,ctrl,clk,reset);
input clk,Instruction_in,PC_add4_in,ctrl,reset;
output Instruction_out,PC_add4_out;

reg [31:0]Instruction_out,PC_add4_out;
wire [31:0]Instruction_in,PC_add4_in;
wire clk,ctrl;

//assign myclk = ~ctrl | clk;

always@(negedge clk)
begin
	if(!reset)
	begin
	PC_add4_out <= 32'b0;
	Instruction_out <= 32'b0;
	end
	else if(!ctrl)
	begin
	PC_add4_out <= PC_add4_out;
	Instruction_out <= Instruction_out;
	end
	else
	begin
	PC_add4_out <= PC_add4_in;
	Instruction_out <= Instruction_in;
	end
end

endmodule
