module shiftleft2(out,in);

input in;
output out;

wire [31:0]in,out;

assign out = in <<2;

endmodule 
