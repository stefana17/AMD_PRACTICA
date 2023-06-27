// Code your design here
//SISO -> SERIAL INPUT SERIAL OUTPUT
//VAR1
/*module siso(input wire clk,input wire si,output wire so);
  
  reg [3:0] int_reg = 0;
  
  always @(posedge clk) 
  begin
    int_reg[0] <= si;
    int_reg[1] <= int_reg[0];
    int_reg[2] <= int_reg[1];
    int_reg[3] <= int_reg[2];
  end
  
  assign so = int_reg[3];
  
endmodule*/

//SHIFTARE LA  DREAPTA: si are cel mai putin semnificativ bit iar celelalte valori sunt shiftate spre dreapta, astfel încât int_reg[0] devine int_reg[1] etc
module siso(input wire clk,input wire reset,input wire si,output wire so);

  reg [3:0] int_reg = 0;

  always @(posedge clk or posedge reset) 
  begin
    if (reset)
      int_reg <= 4'b0000; //resetare pe 0
    else begin
      int_reg[0] <= si; //si este atribuit cu cel mai putin semnificativ bit
      int_reg[3:1] <= int_reg[2:0];//atribuie bitii 2->0 cu din reg bitului 3->1
      //int_reg <= {int_reg[2:0], si}; //concatenare: combina bitii 2->0 cu si
    end
  end

  assign so = int_reg[3]; //atribui so cu bitul cel mai putin semnificativ

endmodule