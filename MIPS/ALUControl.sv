module ALUControl(InstrFunct, ALUOp, ALUControl);
  input [5:0] InstrFunct;
  input [1:0] ALUOp;
  output reg [2:0] ALUControl;
  
  always @(InstrFunct , ALUOp) begin
    casex({ALUOp, InstrFunct})
      8'b00_xxxxxx : ALUControl = 3'b010; //add
      8'b1x_100000 : ALUControl = 3'b010; //add
      8'b1x_100010 : ALUControl = 3'b110; //sub
      8'b1x_100101 : ALUControl = 3'b001; //or
      8'b1x_100100 : ALUControl = 3'b000; //and
      8'b1x_101010 : ALUControl = 3'b111; //slt
      8'bx1_xxxxxx : ALUControl = 3'b110; //sub
      default: ALUControl = 3'bxxx;
    endcase
  end
endmodule



