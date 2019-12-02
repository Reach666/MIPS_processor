module ALU(busC,zero,busA,busB,ALUctr);

input busA,busB,ALUctr;
output zero,busC;

reg [31:0] busC;
reg zero;
wire [31:0] busA, busB;
wire [2:0] ALUctr;

parameter myAND = 3'b000;
parameter myOR  = 3'b001;
parameter myADD = 3'b010;
parameter mySUB = 3'b110;
parameter myLESS= 3'b111;

always@(*)
begin
zero = 0;
case(ALUctr)
	myAND : busC = busA & busB;
	myOR  : busC = busA | busB;
	myADD : busC = busA + busB;
	mySUB : begin
	        busC = busA - busB;
		if(busC == 0)
		zero = 1;
		end
	//myLESS:busC =  
endcase 
end

endmodule

