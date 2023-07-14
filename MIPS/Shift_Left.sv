module Shift_Left(in0, out);
  input [31:0] in0;
  output [31:0] out;
  
  assign out = in0<<2;
endmodule

