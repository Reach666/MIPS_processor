`timescale 10ns/1ns
//`include "MIPS_top.v"
module MIPS_test;
reg clk,reset;

MIPS_top MIPS_top(clk,reset);

initial 
begin
	clk=0;
	reset=0;
end

initial
begin
	#1.3 reset=1;
end

initial
begin
	repeat(1000)
	#0.5 clk=~clk;
end

initial
begin
	#0.3
	$readmemb("mipspip.txt",MIPS_top.Ins_Mem.data);
//	MIPS_top.ins_fetch.Ins_Mem.data[0]=32'b00100001000010000000000000000001;//32'b001000 01000 01000 0000000000000001
//	MIPS_top.ins_fetch.Ins_Mem.data[1]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[2]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[3]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[4]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[5]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[6]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[7]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[8]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[9]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[10]=32'b00100001000010000000000000000001;
//	MIPS_top.ins_fetch.Ins_Mem.data[11]=32'b00100001000010000000000000000001;
end

initial
begin
	#0.3
	MIPS_top.Data_Mem.data[0]=32'h1;//5'b00000
	MIPS_top.Data_Mem.data[1]=32'h3;
	MIPS_top.Data_Mem.data[2]=32'h5;
	MIPS_top.Data_Mem.data[3]=32'h7;
	MIPS_top.Data_Mem.data[4]=32'h9;
	MIPS_top.Data_Mem.data[5]=32'h2;
	MIPS_top.Data_Mem.data[6]=32'h4;
	MIPS_top.Data_Mem.data[7]=32'h6;
	MIPS_top.Data_Mem.data[8]=32'h8;//5'b01000
	MIPS_top.Data_Mem.data[9]=32'h0;//5'b01001
	MIPS_top.Data_Mem.data[10]=32'h0;
	MIPS_top.Data_Mem.data[11]=32'h0;
end

initial
begin
	#2.5
	$display("Input  %1d%1d%1d%1d %1d%1d%1d%1d %1d%1d%1d%1d",MIPS_top.Data_Mem.data[0],MIPS_top.Data_Mem.data[1],
MIPS_top.Data_Mem.data[2],MIPS_top.Data_Mem.data[3],MIPS_top.Data_Mem.data[4],MIPS_top.Data_Mem.data[5],
MIPS_top.Data_Mem.data[6],MIPS_top.Data_Mem.data[7],MIPS_top.Data_Mem.data[8],MIPS_top.Data_Mem.data[9],
MIPS_top.Data_Mem.data[10],MIPS_top.Data_Mem.data[11]);
	#400
	$display("Output %1d%1d%1d%1d %1d%1d%1d%1d %1d%1d%1d%1d",MIPS_top.Data_Mem.data[12],MIPS_top.Data_Mem.data[13],
MIPS_top.Data_Mem.data[14],MIPS_top.Data_Mem.data[15],MIPS_top.Data_Mem.data[16],MIPS_top.Data_Mem.data[17],
MIPS_top.Data_Mem.data[18],MIPS_top.Data_Mem.data[19],MIPS_top.Data_Mem.data[20],MIPS_top.Data_Mem.data[21],
MIPS_top.Data_Mem.data[22],MIPS_top.Data_Mem.data[23]);
end

endmodule
