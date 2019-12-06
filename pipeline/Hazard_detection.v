module Hazard_detection(PCWr,IF_IDWr,ID_EXMux,ID_EX_MemtoReg,ID_EX_Rt,IF_ID_Rs,IF_ID_Rt);
output reg PCWr,IF_IDWr,ID_EXMux;
input ID_EX_MemtoReg;
input[4:0] ID_EX_Rt,IF_ID_Rs,IF_ID_Rt;

always@(ID_EX_MemtoReg or ID_EX_Rt or IF_ID_Rs or IF_ID_Rt)
begin
	if(ID_EX_MemtoReg && (ID_EX_Rt==IF_ID_Rs || ID_EX_Rt==IF_ID_Rt) )
	begin
		PCWr<=0;
		IF_IDWr<=0;
		ID_EXMux<=0;
	end
	else begin
		PCWr<=1;
		IF_IDWr<=1;
		ID_EXMux<=1;
	end
end

endmodule
