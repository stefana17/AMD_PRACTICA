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
`include "DataMemory.sv"

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

/*module MIPS(clk, PC, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, ALUOp, writeData, readData1, readData2);
  
  input clk;
  input [31:0] PC, writeData;
  
  output [31:0] readData1, readData2;
  output Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  output [1:0] ALUOp;
  
  wire [31:0] PCnew, instruction;
  wire [4:0] dataout;
  wire RegDst, RegWrite;
  
  PC PC_inst(clk, PC, PCnew);
  InstructionMemory InstructionMemory_inst(PCnew, instruction);
  Mux2_1 #(5) Mux2_1_inst (instruction[20:16], instruction[15:11], dataout, RegDst);
  UnitControl UnitControl_inst(instruction[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
  RegisterFile RegisterFile_inst(clk, RegWrite, instruction[25:21], instruction[20:16], dataout[4:0], writeData, readData1, readData2);

endmodule*/

module MIPS(clk, start);
  input clk, start;
  
  wire [31:0] PCnew, PCnew4, addout, muxoutPC, muxoutPC1, muxoutPC2, instruction, muxoutReg, readData1, readData2, instrExt, ALUResult, readData, muxoutMem, outshiftAdd;
  wire [4:0] muxoutWriteReg;
  wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero;

  wire [1:0] ALUOp;
  wire [2:0] ALUControl;
  
  wire [31:0] outshiftinstr;
  
  //Cale PC
  Mux2_1 #(32) Mux2_1_instStart(.di1(32'b0), .di0(muxoutPC2), .dataout(muxoutPC), .sel(start));
  PC PC_inst(.clk(clk), .PC(muxoutPC), .PCnew(PCnew));
  ALUAdd ALUAdd_instPC(.din1(PCnew), .din2(4), .addout(PCnew4));
  ALUAdd ALUAdd_inst(.din1(PCnew4), .din2(outshiftAdd), .addout(addout));
  Mux2_1 #(32) Mux2_1_instPC1(.di0(PCnew4), .di1(addout), .dataout(muxoutPC1), .sel(Branch&zero));
  Mux2_1 #(32) Mux2_1_instPC2(.di0(muxoutPC1), .di1({PCnew4[31:28], outshiftinstr[27:0]}), .dataout(muxoutPC2), .sel(Jump));
  
  //ShiftPC
  Shift_Left Shift_Left_instPC(.in0({6'b0, instruction[25:0]}), .out(outshiftinstr));
  
  //ShiftAdd
  Shift_Left Shift_Left_instAdd(.in0(instrExt), .out(outshiftAdd));
  
  //InstructionMmemory
  InstructionMemory InstructionMemory_inst(.address(PCnew), .instruction(instruction));
  
  //Register + ALU
  Mux2_1 #(5) Mux2_1_instReg(.di0(instruction[20:16]), .di1(instruction[15:11]), .dataout(muxoutWriteReg), .sel(RegDst));
  RegisterFile RegisterFile_inst(.clk(clk), .we(RegWrite), .readRegister1(instruction[25:21]), .readRegister2(instruction[20:16]), .writeRegister(muxoutWriteReg), .writeData(muxoutMem), .readData1(readData1), .readData2(readData2));
  UnitControl UnitControl_inst(.opcode(instruction[31:26]), .RegDst(RegDst), .Jump(Jump), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
  Mux2_1 #(32) Mux2_1_instALU(.di0(readData2), .di1(instrExt), .dataout(muxoutReg), .sel(ALUSrc));
  SignExtend SignExtend_inst(.instr(instruction[15:0]), .instrExt(instrExt));
  ALU ALU_inst(.SrcA(readData1), .SrcB(muxoutReg), .ALUControl(ALUControl), .zero(zero), .ALUResult(ALUResult));
  ALUControl ALUControl_inst(.InstrFunct(instruction[5:0]), .ALUOp(ALUOp), .ALUControl(ALUControl));
  
  //DataMemory
  DataMemory DataMemory_inst(.clk(clk), .we(MemWrite), .address(ALUResult), .writeData(readData2), .readData(readData));
  Mux2_1 #(32) Mux2_1_instMem(.di0(ALUResult), .di1(readData), .dataout(muxoutMem), .sel(MemtoReg));
  
  
endmodule

