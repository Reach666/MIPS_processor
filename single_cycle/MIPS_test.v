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
	#5 reset=1;
end

initial
begin
	repeat(20)
	#2 clk=~clk;
end

initial
begin
	#1
	MIPS_top.ins_fetch.Ins_Mem.data[0]=32'b00100001000010000000000000000001;//32'b001000 01000 01000 0000000000000001
	MIPS_top.ins_fetch.Ins_Mem.data[1]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[2]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[3]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[4]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[5]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[6]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[7]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[8]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[9]=32'b00100001000010000000000000000001;
	MIPS_top.ins_fetch.Ins_Mem.data[10]=32'b00100001000010000000000000000001;
end

initial
begin
	#1
	MIPS_top.registers.data[0]=32'b0;//5'b00000
	MIPS_top.registers.data[8]=32'b1;//5'b01000
	MIPS_top.registers.data[9]=32'b0;//5'b01001
end

endmodule
