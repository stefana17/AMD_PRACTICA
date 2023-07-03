module ALU(SrcA, SrcB, ALUControl, zero, ALUResult);
  input [31:0] SrcA;
  input [31:0] SrcB;
  input [2:0] ALUControl;
  output reg [31:0] ALUResult;
  output zero;
  
  assign zero = (ALUResult == 0); // ALUResult e 0, atunzi zero e pe true
  always @(SrcA or SrcB or ALUControl)
    case(ALUControl)
        3'b010: ALUResult = SrcA + SrcB;
        3'b110: ALUResult = SrcA - SrcB;
        3'b000: ALUResult = SrcA & SrcB;
        3'b001: ALUResult = SrcA | SrcB;
        3'b111: ALUResult = SrcA < SrcB ? 1:0;
        default: ALUResult = 0;
      endcase
endmodule