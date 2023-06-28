// Code your testbench here
// or browse Examples
module tb_pipo;
  
  reg clkt;
  reg resett;
  reg [3:0] pit;
  wire [3:0] pot;

  //instantierea
  pipo pipo_inst (.clk(clkt),.reset(resett),.pi(pit),.po(pot));

  //Generarea semnalului de ceas
  initial
    begin
		#0 clkt = 1'b0;
		forever #5 clkt = ~clkt;
	end

  // Testarea operațiilor
  initial begin
    resett = 1; pit = 4'b1000; //resetare si dat o valoare lui pi la intrare
    #10 resett = 0; //resetare
    #20 pit = 4'b0010; //dat valoare la pi la intrare
    #10 pit = 4'b1111;
  end
  
    initial 
      begin
       #100 $finish; // Terminarea simulării după 100 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, pipo_inst);
    end

endmodule