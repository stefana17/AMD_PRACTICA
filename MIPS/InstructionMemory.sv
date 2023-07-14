module InstructionMemory(address, instruction);
  input [31:0] address; //adresa de acces in memorie
  output [31:0] instruction; //instructiunea citita la adresa specificata 
  
  reg [31:0] mem [0:31];
  
  initial 
    begin
      $readmemh("cod.txt", mem);
    end
  
  assign instruction = mem[address>>2];	
	

endmodule

