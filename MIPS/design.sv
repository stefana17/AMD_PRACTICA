// Code your design here
`include "SignExtend.sv"
`include "ALUControl.sv"
`include "Mux2_1.sv"
`include "ALU.sv"
`include "PC.sv"
`include "PCAdd.sv"
`include "Shift_Left.sv"
`include "ALUAdd.sv"
`include "InstructionMemory.sv"
`include "RegisterFile.sv"
`include "UnitControl.sv"

/*module MIPS(SrcA, ALUOp, instr, di0, di1, sel, zero, ALUResult);
  input [15:0] instr;
  input [1:0] ALUOp;
  input [31:0] SrcA;
  input [31:0] di0, di1;
  input sel;
  
  output [31:0] ALUResult;
  output zero;
  
  wire [31:0] instrExt, dataout;
  wire [2:0] ALUControl;
  
  SignExtend SignExtend_inst(instr, instrExt);
  ALUControl ALUControl_inst(instr[5:0], ALUOp, ALUControl);
  Mux2_1 Mux2_1_inst(di0, di1, dataout, sel);
  ALU ALU_inst(SrcA, dataout, ALUControl, zero, ALUResult);
endmodule*/