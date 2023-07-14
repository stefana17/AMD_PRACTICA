module UnitControl(opcode, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
  input [31:26] opcode;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  output reg [1:0] ALUOp;
  
  always @(*)
    begin
      casex(opcode)
        //R-type
        6'b000000 :
          begin
            RegWrite = 1'b1; RegDst = 1'b1; ALUSrc = 1'b0; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b10; Jump = 1'b0;
          end
        //lw
        6'b100011 :
          begin
            RegWrite = 1'b1; RegDst = 1'b0; ALUSrc = 1'b1; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b1; ALUOp = 2'b00; Jump = 1'b0;
          end
        //sw
        6'b101011 : 
          begin
            RegWrite = 1'b0; RegDst = 1'b0; ALUSrc = 1'b1; Branch = 1'b0; MemWrite = 1'b1; MemtoReg = 1'b0; ALUOp = 2'b00; Jump = 1'b0;
          end
        //beq
        6'b00100 :
          begin
            RegWrite = 1'b0; RegDst = 1'b0; ALUSrc = 1'b0; Branch = 1'b1; MemWrite = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b01; Jump = 1'b0;
          end
        //addi
        6'b001000 :
          begin
            RegWrite = 1'b1; RegDst = 1'b0; ALUSrc = 1'b1; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b00; Jump = 1'b0;
          end
        //j
        6'b000010 :
          begin
            RegWrite = 1'b0; RegDst = 1'b0; ALUSrc = 1'b0; Branch = 1'b0; MemWrite = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b00; Jump = 1'b1;
          end
      endcase
    end
endmodule