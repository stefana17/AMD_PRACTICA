// Code your testbench here
// or browse Examples
module tb_sipo;

  reg clkt;
  reg resett;
  reg sit;
  wire [3:0] pot;

  //instantierea
  sipo sipo_inst (.clk(clkt),.reset(resett),.si(sit),.po(pot));
  
  //Generarea semnalului de ceas
  initial
    begin
		#0 clkt = 1'b0;
		forever #5 clkt = ~clkt;
	end

  initial 
    begin
      resett = 1; sit = 0;
      #10 resett = 0; // Dezactivarea semnalului de reset după 10 unități de timp

    // Test 1 : schimb si
    #10 sit = 1; // Setarea si la 1 după 10 unități de timp
    #10 sit = 0; // Setarea si la 0 după alte 10 unități de timp
    #10 sit = 1;
    #10 sit = 0;

    // Test 2 : schimb si resetul ca sa vad ca se initializeaza po
    #10 resett = 1;
    #10 resett = 0;
    #10 sit = 1;
    #10 sit = 0;
    #10 sit = 1;
    #10 sit = 0;

  end
  
  initial 
    begin
    #100 $finish; // Terminarea simulării după 100 unități de timp
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, sipo_inst);
    end

endmodule
