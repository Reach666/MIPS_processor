module extender(ext_imm,extop,imm16);

input imm16,extop;
output ext_imm;

wire [31:0]ext_imm;
wire [15:0]imm16;
wire extop;

assign ext_imm = extop? {{16{imm16[15]}},imm16}:{16'b0,imm16};

endmodule
