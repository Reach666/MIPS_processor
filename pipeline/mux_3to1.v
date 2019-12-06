module mux_3x1 #(parameter DATA_WIDTH = 32) (in10, in01, in00, sel, out);

input [DATA_WIDTH-1:0] in10;
input [DATA_WIDTH-1:0] in01;
input [DATA_WIDTH-1:0] in00;
input [1:0] sel;
output [DATA_WIDTH-1:0] out;

assign out=sel[1]?in10:(sel[0]?in01:in00);

endmodule
