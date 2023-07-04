module RegisterFile(clk, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2);
  input [4:0] readRegister1, readRegister2, writeRegister;
  input [31:0] writeData;
  output reg [31:0] readData1, readData2;
  reg [31:0] regIn [31:0];
  
  always @(posedge clk)
    
    
    
