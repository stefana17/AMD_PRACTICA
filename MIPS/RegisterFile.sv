module RegisterFile(clk, we, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2);
  input [4:0] readRegister1, readRegister2, writeRegister; //adresele de citire si scriere in fisierul de inregistrari
  input [31:0] writeData; //datele care vor fi scrise in fisierul de inregistrari
  input clk, we;
  output reg [31:0] readData1, readData2; //datele citite din fisierul de inregistrari
  reg [31:0] regIn [31:0];
  integer i;
  
  initial 
    begin
      for(i = 0; i < 32; i= i + 1)
        regIn[i] = 32'b0;
    end
  
  always @(readRegister1, readRegister2)
    begin
      readData1 = regIn[readRegister1]; //atribuie lui readData1 valoarea stocata in registru la adresa readRegister1
      readData2 = regIn[readRegister2]; //atribuie lui readData2 valoarea stocata in registru la adresa readRegister2
    end
  
  always @(negedge clk)
    begin
      if (we) 
        regIn[writeRegister] <= writeData; //valorile de la intrarea writeData sunt inregistrate in registru la adresa specificata
      readData1 = regIn[readRegister1];
      readData2 = regIn[readRegister2];
      
    end
  
endmodule
   
    
    
    
