module MIPS_control(op,RegWr,RegDst,ExtOp,AluSrc,ALUop,MemWr,MemtoReg,Branch,Jump);

input [5:0] op;
output RegWr,RegDst,ExtOp,AluSrc,MemWr,MemtoReg,Branch,Jump;
output [2:0] ALUop;

assign RegWr=!op[5]&!op[4]&!op[3]&!op[2]&!op[1]&!op[0]
		+!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0]
		+op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0]
		+!op[5]&!op[4]&op[3]&!op[2]&!op[1]&!op[0];//R-type ori lw addi
assign RegDst=!op[5]&!op[4]&!op[3]&!op[2]&!op[1]&!op[0];//R-type
assign ExtOp=op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0]
		+op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0];//lw sw
assign ALUSrc=!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0]
		+op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0]
		+op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0]
		+!op[5]&!op[4]&op[3]&!op[2]&!op[1]&!op[0];//ori lw sw addi
assign ALUop[2]=!op[5]&!op[4]&!op[3]&!op[2]&!op[1]&!op[0];//R-type
assign ALUop[1]=!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0];//ori
assign ALUop[0]=!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0];//beq
assign MemWr=op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0];//sw
assign MemtoReg=op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0];//lw
assign Branch=!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0];//beq
assign Jump=!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0];//jump

endmodule 