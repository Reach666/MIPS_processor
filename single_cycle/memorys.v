module memorys(DataIn,WrEn,Adr,DataOut,Clk);
  input [31:0]DataIn;
  input [31:0]Adr;
  input WrEn;
  input Clk;
  output [31:0]DataOut;

  reg [31:0]data[31:0];
  wire [31:0]DataOut;
  
  always@(negedge Clk)
  begin
    if(WrEn)
      begin
        data[Adr] = DataIn;
      end
  end

  assign DataOut=data[Adr];

endmodule
    