// Code your testbench here
// or browse Examples
//testare ALU
/*module test_ALU;
  reg [31:0] SrcAt, SrcBt;
  reg [2:0] ALUControlt;
  wire [31:0] ALUResultt;
  wire zerot;
  
  //instantierea
  ALU ALU_inst(SrcAt, SrcBt, ALUControlt, zerot, ALUResultt);
  
  //testare cu operatiile din carte
  initial
    begin
      #0 ALUControlt = 3'b010; SrcAt = 32'h4A3212BD ; SrcBt = 32'h1234ABCD ;
      #20 ALUControlt = 3'b110;
      #20 ALUControlt = 3'b010;
      #20 ALUControlt = 3'b110;
      #20 ALUControlt = 3'b000;
      #10 ALUControlt = 3'b001;
      #10 ALUControlt = 3'b111;
    end
  initial
    #120 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, ALU_inst);
    end
endmodule*/

//testare Sign Extend -> copiere cel mai semnificativ bit
/*module test_SignExtend;
  
  reg [15:0] instrt;
  wire [31:0] instrExtt;
  
  //instantiere
  SignExtend SignExtend_inst(instrt, instrExtt);
  
  //testare
  initial
    begin
      #0 instrt = 16'b0001;
      #10 instrt = 16'h1111;
      #10 instrt = 16'hff00;
      #10 instrt = 16'hffdd;
    end
  initial
    #120 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, SignExtend_inst);
    end
endmodule*/

//testare ALU Control
/*module test_ALUControl;
  reg [5:0] InstrFunctt;
  reg [1:0] ALUOpt;
  wire [2:0] ALUControlt;
  
  //instantierea
  ALUControl ALUControl_inst(InstrFunctt, ALUOpt, ALUControlt);
  
  //testare cu operatiile din carte
  initial
    begin
      #0 ALUOpt = 2'b00; InstrFunctt = 6'bxxxxxx;
      #20 ALUOpt = 2'b01; InstrFunctt = 6'bxxxxxx;
      #20 ALUOpt = 2'b1x; InstrFunctt = 6'b100000;
      #20 ALUOpt = 2'b1x; InstrFunctt = 6'b100010;
      #20 ALUOpt = 2'b1x; InstrFunctt = 6'b100100;
      #10 ALUOpt = 2'b1x; InstrFunctt = 6'b100101;
      #10 ALUOpt = 2'b1x; InstrFunctt = 6'b101010;
    end
  initial
    #120 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, ALUControl_inst);
    end
endmodule

//testare mux 2 intrari, o iesire
/*module test_Mux2_1;
  reg [31:0] di0t, di1t;
  reg selt;
  wire [31:0] dataoutt;
  
  //instantierea
  Mux2_1 Mux2_1_inst(di0t, di1t, dataoutt, selt);
  
  //testare
  initial 
    begin
      #10 di0t = 32'h11111111; di1t = 32'h22222222; selt = 1'b0;
      #30 selt = 1'b1;
      #30 selt = 1'b0; 
    end
  
  initial
    #120 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, Mux2_1_inst);
    end
endmodule*/

//tesatre MIPS
/*module test_MIPS;
  reg [15:0] instrt;
  reg [1:0] ALUOpt;
  reg [31:0] SrcAt;
  reg [31:0] di0t, di1t;
  reg selt;
  
  wire [31:0] ALUResultt;
  wire zerot;
  
  //instantierea
  MIPS MIPS_inst(SrcAt, ALUOpt, instrt, di0t, di1t, selt, zerot, ALUResultt);
  
  //testare
  initial
    begin
      #0 instrt = 16'h0020; SrcAt = 32'h4A3212BD; di0t = 32'h11111111; di1t = 32'h22222222; selt = 1'b0; ALUOpt = 2'b1x;
      #30 instrt = 16'h0024; ALUOpt = 2'b1x;
      #30 instrt = 16'h002A; ALUOpt = 2'b1x;
    end
   initial
    #120 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, MIPS_inst);
    end
endmodule*/


//testare PC
/*module test_PC;
  reg [31:0] PCt;
  reg clkt;
  wire [31:0] PCnewt;
  
  //instantierea
  PC PC_inst(clkt, PCt, PCnewt);
  
  //generarea semnalului de ceas
  initial
    begin
		#0 clkt = 1'b0;
		forever #10 clkt = ~clkt;
	end

  //testare
  initial begin
    #10 PCt = 32'h10000000;
    #20 PCt = 32'h11000100; 
    #10 PCt = 32'h12A00000;
  end
  
    initial 
      begin
       #120 $finish; // Terminarea simulării după 120 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, PC_inst);
    end
  
endmodule*/

//testare PCAdd
/*module test_PCAdd;
  reg [31:0] PCnewt;
  wire [31:0] PCPlust;
  
  //instantierea
  PCAdd PCAdd_inst(PCnewt, PCPlust);
  
  //testare
  initial begin
    #10 PCnewt = 32'h10000000;
    #20 PCnewt = 32'h11000100; 
    #10 PCnewt = 32'h12A00000;
  end
  
    initial 
      begin
       #120 $finish; // Terminarea simulării după 120 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, PCAdd_inst);
    end
  
endmodule*/

//testare Shift_Left
/*module test_Sfift_Left;
  reg [31:0] in0t;
  wire [31:0] outt;
  
  //instantierea
  Shift_Left Shift_Left_inst(in0t, outt);
  
  //testare
  initial begin
    #0 in0t = 32'h10000010;
    #20 in0t = 32'h11000110; 
    #20 in0t = 32'h12A00001;
  end
  
    initial 
      begin
       #120 $finish; // Terminarea simulării după 120 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, Shift_Left_inst);
    end
  
endmodule*/

//testare ALUAdd
/*module test_ALUAdd;
  reg [31:0] din1t;
  reg [31:0] din2t;
  wire [31:0] outt;
  
  //instantierea
  ALUAdd ALUAdd_inst(din1t, din2t, outt);
  
  //testare
  initial begin
    #10 din1t = 32'h10000000; din2t = 32'h1234ABCD;
    #20 din1t = 32'h11000100; din2t = 32'h56780000;
    #10 din1t = 32'h12A00000; din2t = 32'hFFFF0000;
  end
  
    initial 
      begin
       #120 $finish; // Terminarea simulării după 120 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, ALUAdd_inst);
    end
  
endmodule*/
  
//testare InstructionMemory
/*module test_InstructionMemory;
  reg [31:0] addresst;
  wire [31:0] instructiont;
  
  reg [31:0] memt [0:1024];
  
  //instantierea
  InstructionMemory InstructionMemory_inst(addresst, instructiont);
  
  //testare
  initial 
    begin 
      // Inițializarea adresei și așteptarea unui ciclu de ceas
      #0 addresst = 0;
    
      // Testarea a 10 adrese consecutive
      repeat (10) begin
      #10 addresst = addresst + 4;
    end
    
    // Așteptarea unui ciclu de ceas și încheierea simulării
    #1;
    $finish;
  end
  
  /*initial 
    begin
      $fopen("cod.txt", "w");
    end*/
    
    // Scrierea conținutului memoriei în fișier
    /*for (int i = 0; i <= 1024; i = i + 1) begin
      $fwrite(1, "%h\n", dut.mem[i]);
    end*/
  
 /* initial 
      begin
       #120 $finish; // Terminarea simulării după 120 unități de timp
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, InstructionMemory_inst);
    end
endmodule*/
  
/*module test_UnitControl;
  reg [31:26] opcodet;
  wire RegDst, Jump, Brach, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;*/
  
  