// Code your design here
//SIPO -> SERIAL INPUT PARALLEL OUTPUT
module sipo(input wire clk,input wire reset,input wire si,output reg[3:0] po);

  reg [3:0] int_reg = 0;

  always @(posedge clk or posedge reset) 
  begin
    if (reset)
      int_reg <= 4'b0000; //resetare pe 0
    else begin
      int_reg[0] <= si; //si este atribuit cu cel mai putin semnificativ bit
      int_reg[3:1] <= int_reg[2:0];//atribuie bitii 2->0 cu din reg bitului 3->1
      //int_reg <= {int_reg[2:0], si}; //concatenare: combina bitii 2->0 cu si =>preluat de la siso, nu are treaba :)
    end
  end

  always @(posedge clk) begin
    if (reset)
      po <= 4'b0000; //iesire paralela pe 0(initializare)
    else
      po <= int_reg; //iesirea paralela primeste valorile din int_reg
  end

endmodule

