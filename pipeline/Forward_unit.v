module Forwarding_unit(ForwardA,ForwardB,ID_EX_Rs,ID_EX_Rt,EX_MEM_Rd,MEM_WB_Rd,EX_MEM_RegWr,MEM_WB_RegWr);
output reg[1:0] ForwardA,ForwardB;
input[4:0] ID_EX_Rs,ID_EX_Rt,EX_MEM_Rd,MEM_WB_Rd;
input EX_MEM_RegWr,MEM_WB_RegWr;

always@(ID_EX_Rs or ID_EX_Rt or EX_MEM_Rd or MEM_WB_Rd 
or EX_MEM_RegWr or MEM_WB_RegWr)
begin
	if(EX_MEM_RegWr && EX_MEM_Rd!=5'b0 && EX_MEM_Rd==ID_EX_Rs)//EX hazard
		ForwardA<=2'b10;
	else if(MEM_WB_RegWr && MEM_WB_Rd!=5'b0 && MEM_WB_Rd==ID_EX_Rs && (EX_MEM_Rd!=ID_EX_Rs || !EX_MEM_RegWr) )//MEM hazard
		ForwardA<=2'b01;
	else
		ForwardA<=2'b00;

	if(EX_MEM_RegWr && EX_MEM_Rd!=5'b0 && EX_MEM_Rd==ID_EX_Rt)
		ForwardB<=2'b10;
	else if(MEM_WB_RegWr && MEM_WB_Rd!=5'b0 && MEM_WB_Rd==ID_EX_Rt && (EX_MEM_Rd!=ID_EX_Rt|| !EX_MEM_RegWr) )
		ForwardB<=2'b01;
	else
		ForwardB<=2'b00;
end

endmodule
