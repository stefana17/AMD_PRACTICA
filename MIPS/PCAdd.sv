module PCAdd(PCnew, PCPlus);
  input [31:0] PCnew;
  output reg [31:0] PCPlus;
  
  always @(PCnew)
    begin
      PCPlus = PCnew + 32'h00000004;
    end
endmodule