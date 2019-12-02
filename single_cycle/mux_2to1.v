module mux_2x1 #(parameter DATA_WIDTH = 32) (in1, in0, sel, out);

input [DATA_WIDTH-1:0] in1;
input [DATA_WIDTH-1:0] in0;
input sel;
output [DATA_WIDTH-1:0] out;

assign out=sel?in1:in0;

endmodule

///////example of use:///////
//mux_2x1 #(.DATA_WIDTH(32)
//         )mux_2x1_u5(.in1(Inst_15_0_signext), 
//                     .in0(gpr_rd_data2     ), 
//                     .sel(ALUSrc           ), 
//                     .out(ALU_datain2_src0 )
//                    )
