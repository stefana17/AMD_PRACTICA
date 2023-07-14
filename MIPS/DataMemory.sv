module DataMemory(clk, we, address, writeData, readData);
  input clk, we;
  input [31:0] address, writeData; //adresa la care se acceseaza memoria RAM, datele ce vor fi scrise in memorie
  output [31:0] readData; //datele citite din memoria RAM
  reg [31:0] RAM [63:0];
  integer i;
  
  initial 
    begin
      for(i = 0; i < 32; i= i + 1)
        RAM[i] = 32'b0;
    end
  
  assign readData = RAM[address]; //atribuie lui readData valoarea stocata in memoria RAM la adresa specificata
                                
  always @(negedge clk)
    begin
      if(we)
        RAM[address] <= writeData; //valorile de la intrarea writeData sunt inregistrate in memoria RAM la adresa specificata
    end
  
endmodule
