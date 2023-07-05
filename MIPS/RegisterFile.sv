module RegisterFile(clk, we3, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2);
  input [4:0] readRegister1, readRegister2, writeRegister;
  input [31:0] writeData;
  input clk, we;
  output reg [31:0] readData1, readData2;
  reg [31:0] regIn [31:0];
  
  always @(posedge clk)
    begin
      if (we) 
        regIn[writeRegister] <= writeData;

    assign readData1 = (readRegister1 ! = 0) ? regIn[readRegister1] : 0;
    assign readData2 = (readRegister2 ! = 0) ? regIn[readRegister2] : 0;
      
    end
  
endmodule
   
    
    
    
