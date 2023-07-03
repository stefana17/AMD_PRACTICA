module PC(clk, PC, PCnew);
  input [31:0] PC;
  input clk;
  output reg [31:0] PCnew;
  
  initial 
    begin 
      PCnew = 32'h00000000;
    end
  
  always @(posedge clk)
    begin
      PCnew = PC;
    end
endmodule
    
  