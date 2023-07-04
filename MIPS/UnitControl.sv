module UnitControl(opcode, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
  input [31:26] opcode;
  output reg RegDst, Jump, Brach, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  output reg [1:0] ALUOp;
  
  always @()
    begin
      casex(opcode)
        //R-type
        6'b000000 : RegWrite = 1'b1; RegDst = 1'b1; ALUSrc = 1'b0; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b10;
        //lw
        6'b100011 : RegWrite = 1'b1; RegDst = 1'b0; ALUSrc = 1'b1; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b1; ALUOp = 2'b00;
        //sw
        6'b101011 : RegWrite = 1'b0; RegDst = 1'bx; ALUSrc = 1'b1; Branch = 1'b0; MemWrite = 1'b1; MemtoReg = 1'bx; ALUOp = 2'b00;
        //beq
        6'b00100 : RegWrite = 1'b0; RegDst = 1'bx; ALUSrc = 1'b0; Branch = 1'b1; MemWrite = 1'b0; MemtoReg = 1'bx; ALUOp = 2'b01;
        
        
  
  
  
