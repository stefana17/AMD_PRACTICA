// Code your testbench here
// or browse Examples
module testbench;

  //declar toate semnalele
  reg clkt;
  reg resett;
  reg sit;
  wire sot;
  reg [3:0] pit;
  wire [3:0] pot;
  reg modet;

  //instantiere module
  siso siso_inst(.clk(clkt),.reset(resett),.si(sit),.so(sot));
  sipo sipo_inst (.clk(clkt),.reset(resett),.si(sit),.po(pot));
  piso piso_inst (.clk(clkt),.reset(resett),.pi(pit),.mode(modet),.so(sot));
  pipo pipo_inst (.clk(clkt),.reset(resett),.pi(pit),.po(pot));

  //Generarea semnalului de ceas
  initial
    begin
		#0 clkt = 1'b0;
		forever #5 clkt = ~clkt;
	end

  //intializare input
  initial begin
    resett = 1; sit = 0; pit = 0; modet = 0; //reset 1 e pentru o stare initiala a modulelor, si pe 0 si pi pe 0 pentru a testa functionalitatea modulelor cu valori de intrare, mode 0 pentru a incarca la piso
    #10 resett = 0; //resetare
    #20 sit = 1; // sit pe 1 
    #10 sit = 0; ///sit pe 0 
    #10 modet = 1; //shiftez 
    #20 modet = 0; //incarc
  end
  
  initial 
    begin
       #100 $finish; // Terminarea simulării după 100 unități de timp
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, siso_inst);
      $dumpvars(0, sipo_inst);
      $dumpvars(0, piso_inst);
      $dumpvars(0, pipo_inst);
    end

endmodule