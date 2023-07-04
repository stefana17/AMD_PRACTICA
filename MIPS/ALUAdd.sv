module ALUAdd(din1, din2, out);
  input [31:0] din1;
  input [31:0] din2;
  output reg [31:0] out;
  
  always @(din1 or din2)
    begin
      out = din1 + din2;
    end
endmodule