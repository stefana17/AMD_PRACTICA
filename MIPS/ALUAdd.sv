module ALUAdd(din1, din2, addout);
  input [31:0] din1;
  input [31:0] din2;
  output reg [31:0] addout;
  
  always @(din1 or din2)
    begin
      addout = din1 + din2;
    end
endmodule

