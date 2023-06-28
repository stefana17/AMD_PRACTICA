// Code your testbench here
// or browse Examples
module tb_piso;
  
  reg clkt;
  reg resett;
  reg pit;
  reg modet;
  wire sot;

  //instantierea
  piso piso_inst (.clk(clkt),.reset(resett),.pi(pit),.mode(modet),.so(sot));

  //Generarea semnalului de ceas
  initial
    begin
		#0 clkt = 1'b0;
		forever #5 clkt = ~clkt;
	end

  // Testarea operațiilor
  initial begin
    resett = 1; pit = 1; modet = 0; //fac o resetare, incarc valorile si pun mode pe 0 pentru a face operatia ded incarcare
    #10 resett = 0; // resetez dupa 10 unitati de timp
    #20 pit = 0; // se face shiftare
    #10 pit = 1;
    #10 modet = 1; //shiftare
    #20 modet = 0; //incarcare
  end
  
  initial 
    begin
    #100 $finish; // Terminarea simulării după 100 unități de timp
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, piso_inst);
    end

endmodule