module MEM_WB_reg(WB_out,Rw_out,ALUout_out,DataMem_out,WB_in,Rw_in,ALUout_in,DataMem_in,clk,reset);
output reg[1:0] WB_out;
output reg[4:0] Rw_out;
output reg[31:0] ALUout_out,DataMem_out;
input[1:0] WB_in;
input[4:0] Rw_in;
input[31:0] ALUout_in,DataMem_in;
input clk,reset;

always@(negedge clk)
begin
	if(!reset) begin
		WB_out<=2'b0;
		Rw_out<=5'b0;
		ALUout_out<=32'b0;
		DataMem_out<=32'b0;
	end
	else begin
		WB_out<=WB_in;
		Rw_out<=Rw_in;
		ALUout_out<=ALUout_in;
		DataMem_out<=DataMem_in;
	end
end

endmodule
