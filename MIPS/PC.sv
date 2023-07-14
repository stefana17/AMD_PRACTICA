module PC(clk, PC, PCnew);
  input [31:0] PC;
  input clk;
  output reg [31:0] PCnew;
  
  always @(posedge clk)
    begin
      PCnew <= PC;
    end
endmodule
    
  