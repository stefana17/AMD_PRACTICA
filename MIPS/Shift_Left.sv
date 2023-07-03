module Shift_Left(in0, out);
  input [31:0] in0;
  output [31:0] out;
  
  //assign out = 32'h00000000;
  assign out = in0<<2;
endmodule
