/*module Mux2_1(di0, di1, dataout, sel); 
  input [31:0] di0, di1;
  input sel;
  output [31:0] dataout;
    
    assign dataout = sel ? di1 : di0;
      
endmodule*/

//fa cu parametrii sa poti da cati biti vrei tu!!!


module Mux2_1 # (parameter SIZE = 5)(di0, di1, dataout, sel);
  input [SIZE-1:0] di0, di1;
  input sel;
  output [SIZE-1:0] dataout;
  
  assign dataout = sel ? di1 : di0;
  
endmodule

