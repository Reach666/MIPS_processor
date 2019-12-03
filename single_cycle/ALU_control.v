module ALU_control(func,ALUop,ALUctr);

input [5:0] func;
input [2:0] ALUop;
output [2:0] ALUctr;
wire[2:0] ALUctr;

assign ALUctr[2]=(!ALUop[2]&ALUop[0])|(ALUop[2]&!func[2]&func[1]&!func[0]);
assign ALUctr[1]=(!ALUop[2]&!ALUop[1])|(!ALUop[2]&ALUop[0])|(ALUop[2]&!func[2]&!func[0]);
assign ALUctr[0]=(!ALUop[2]&ALUop[1])|(ALUop[2]&!func[3]&func[2]&!func[1]&func[0])|(ALUop[2]&func[3]&!func[2]&func[1]&!func[0]);

endmodule

//assign ALUop[2]=!op[5]&!op[4]&!op[3]&!op[2]&!op[1]&!op[0];//R-type
//assign ALUop[1]=!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0];//ori
//assign ALUop[0]=!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0];//beq
