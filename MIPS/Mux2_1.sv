module Mux2_1(di0, di1, dataout, sel);
  input [31:0] di0, di1;
  input sel;
  output [31:0] dataout;
    
    assign dataout = sel ? di1 : di0;
      
endmodule