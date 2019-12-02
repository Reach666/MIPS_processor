module sign_ext30(ext_imm30,imm16);

input imm16;
output ext_imm30;

wire [29:0]ext_imm;
wire [15:0]imm16;

assign ext_imm30 = {{14{imm16[15]}},imm16};

endmodule
