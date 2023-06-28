// Code your design here
//SISO -> SERIAL INPUT SERIAL OUTPUT
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

//PIPO -> PARLLEL INPUT PARALLEL OUTPUT 
//BUFFER REGISTER -> CE E LA INTRARE SE COPIAZA LA IESIRE
module pipo(input wire clk,input wire reset,input wire [3:0] pi,output reg [3:0] po);

  always @(posedge clk or posedge reset) 
    begin
      if (reset)
        po <= 4'b0000; //po este resetat
      else
        po <= pi; // po este egal cu intrarea paralela pi
    end
endmodule