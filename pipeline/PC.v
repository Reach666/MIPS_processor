module PC(PC_in,PC_out,PCWr,clk,reset);
output reg[31:0] PC_out;
input[31:0] PC_in;
input PCWr,clk,reset;

always@(negedge clk)
begin
	if(!reset) begin
		PC_out<=0;
	end
	else if(!PCWr) begin
		PC_out<=PC_out;
	end
	else begin
		PC_out<=PC_in;
	end
end

endmodule
