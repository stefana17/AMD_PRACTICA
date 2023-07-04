module InstructionMemory(address, instruction);
  input [31:0] address; //adresa de input
  output [31:0] instruction; //instructiunea la adresa din memoria locala
  
  reg [31:0] mem [0:1024];
  
  initial 
    begin
      $readmemh("cod.txt", mem);
    end
  
  assign instruction = mem[address>>2];	
	

endmodule