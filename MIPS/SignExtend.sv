module SignExtend(instr, instrExt);
  input [15:0] instr;
  output [31:0] instrExt;
  
  assign instrExt [15:0] = instr[15:0];
  assign instrExt [31:16] = {16{instr[15]}};
endmodule

