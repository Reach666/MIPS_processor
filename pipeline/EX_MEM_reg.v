module EX_MEM_reg(
ALUout_out,zero_out,busB_out,Rw_out,WB_out,M_out,ADDout_out,
ALUout_in,zero_in,busB_in,Rw_in,WB_in,M_in,ADDout_in,clk,reset);

input ALUout_in,zero_in,busB_in,Rw_in,WB_in,M_in,ADDout_in,clk,reset;
output ALUout_out,zero_out,busB_out,Rw_out,WB_out,M_out,ADDout_out;

wire [31:0]busB_in,ALUout_in,ADDout_in;
wire [4:0]Rw_in;
wire [1:0]WB_in;
wire [2:0]M_in;

reg [31:0]busB_out,ALUout_out,ADDout_out;
reg [4:0]Rw_out;
reg [1:0]WB_out;
reg [2:0]M_out;
reg zero_out;

always@(negedge clk)
begin
	if(!reset)
	begin
	{ALUout_out,zero_out,busB_out,Rw_out,WB_out,M_out,ADDout_out} <= 500'b0;
	end
	else
	begin
	{ALUout_out,zero_out,busB_out,Rw_out,WB_out,M_out,ADDout_out} <=
	{ALUout_in,zero_in,busB_in,Rw_in,WB_in,M_in,ADDout_in};
	end
end

endmodule
