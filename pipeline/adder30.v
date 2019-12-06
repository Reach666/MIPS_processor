module adder_32(C,A,B);

input A,B;
output C;

wire [31:0]A,B,C;

assign C = A + B;

endmodule 