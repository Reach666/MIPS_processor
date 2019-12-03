module ins_fetch(Instruction,zero,Branch,Jump,clk,reset);

input clk,reset,zero,Branch,Jump;
output[31:0] Instruction;

reg [31:0] PC;
wire [15:0]imm16;
wire [25:0]target;
wire [29:0]PC4,ext_imm30,PC_branch,PC_4_or_beq,PC_jump,next_addr;
wire [31:0]Instruction;

//initial begin 
//	PC = 0;
//end

adder_30   u0(PC4,PC[31:2],30'b01);
sign_ext30 u2(ext_imm30,imm16);
adder_30   u1(PC_branch,ext_imm30,PC4);
mux_2x1 #(.DATA_WIDTH(30)
         )mux_2x1_u0(.in1(PC_branch	   ), 
                     .in0(PC4	           ), 
                     .sel(Branch & zero    ), 
                     .out(PC_4_or_beq	   )
                    );
mux_2x1 #(.DATA_WIDTH(30)
         )mux_2x1_u1(.in1(PC_jump	   ), 
                     .in0(PC_4_or_beq	   ), 
                     .sel(Jump	       	   ), 
                     .out(next_addr	   )
                    );
assign PC_jump = {PC[31:28],target};
assign imm16 = Instruction[15:0];
assign target = Instruction[25:0];

always@(negedge clk)
begin
	if(!reset) begin
		PC=0;
	end
	else begin
		PC = {next_addr,2'b00};
	end
end

memorys Ins_Mem(32'b0,1'b0,{2'b00,PC[31:2]},Instruction,clk);//memorys(DataIn,WrEn,Adr,DataOut,Clk);

endmodule
