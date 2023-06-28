// Code your design here
// Code your design here
//PISO -> PARALLEL INPUT SERIAL OUTPUT
module piso(input wire clk,input wire reset, input wire mode,input wire pi,output reg so);
  
  reg [3:0] int_reg = 4'b0000;

  always @(posedge clk or posedge reset) 
    begin
      if (reset)
        int_reg <= 4'b0000; //stare initiala
      else if (mode == 1'b0)
        int_reg <= pi; //daca mode este 0  se va stoca valoarea din intrarea paralela in pi 
      else
        int_reg <= {int_reg[3], int_reg[3:1]}; //daca mode este 1 se va face shiftare la dreapta (bitul 3 se duce pe pozitia 2 si celelalte se muta la dreapta)
    end

  always @(posedge clk) 
    begin
      if (reset)
        so <= 1'b0; //resetare iesire
      else if (mode == 1'b1)
        so <= int_reg[0]; //daca mode e 1 so ia valoarea celui mai putin semnificativ bit
      else
        so <= 1'b0; //so ia valoarea logica 0
    end

endmodule