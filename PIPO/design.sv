// Code your design here
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