
module controller(input  logic        clk, reset,
                  input  logic [6:0]  op,
                  input  logic [2:0]  funct3,
                  input  logic        funct7b5,
                  input  logic        Zero,
                  output logic        PCWrite,
                  output logic        AdrSrc,
                  output logic        MemWrite,
                  output logic        IRWrite,
                  output logic [1:0]  ResultSrc,
                  output logic [2:0]  ALUControl,
                  output logic [1:0]  ALUSrcA,
                  output logic [1:0]  ALUSrcB,
                  output logic [1:0]  ImmSrc,
                  output logic        RegWrite);

  typedef enum logic [3:0] {
    S0  = 4'd0,
    S1  = 4'd1,
    S2  = 4'd2,
    S3  = 4'd3,
    S4  = 4'd4,
    S5  = 4'd5,
    S6  = 4'd6,
    S7  = 4'd7,
    S8  = 4'd8,
    S9  = 4'd9,
    S10 = 4'd10
  } statetype;

  statetype state, nextstate;

  logic [1:0] ALUOp;
  logic       Branch, PCUpdate;

  aludec ad(op[5], funct3, funct7b5, ALUOp, ALUControl);

  assign PCWrite = PCUpdate | (Branch & Zero);

  
  always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

	 
  always_comb begin
    case (state)
      S0:  nextstate = S1;
      S1:  case (op)
             7'b0000011: nextstate = S2;   // lw
             7'b0100011: nextstate = S2;   // sw
             7'b0110011: nextstate = S6;   // R-type
             7'b0010011: nextstate = S8;   // I-type ALU
             7'b1101111: nextstate = S9;   // jal
             7'b1100011: nextstate = S10;  // beq
             default:    nextstate = S0;
           endcase
      S2:  nextstate = (op == 7'b0000011) ? S3 : S5;
      S3:  nextstate = S4;
      S4:  nextstate = S0;
      S5:  nextstate = S0;
      S6:  nextstate = S7;
      S7:  nextstate = S0;
      S8:  nextstate = S7;
      S9:  nextstate = S7;
      S10: nextstate = S0;
      default: nextstate = S0;
    endcase
  end

  // ImmSrc decode
  always_comb
    case (op)
      7'b0000011: ImmSrc = 2'b00;  // lw         I-type
      7'b0010011: ImmSrc = 2'b00;  // I-type ALU I-type
      7'b1100111: ImmSrc = 2'b00;  // jalr       I-type
      7'b0100011: ImmSrc = 2'b01;  // sw         S-type
      7'b1100011: ImmSrc = 2'b10;  // beq        B-type
      7'b1101111: ImmSrc = 2'b11;  // jal        J-type
      default:    ImmSrc = 2'b00;
    endcase

	 
  always_comb begin
    IRWrite   = 0;
    AdrSrc    = 0;
    ALUSrcA   = 2'b00;
    ALUSrcB   = 2'b00;
    ALUOp     = 2'b00;
    ResultSrc = 2'b00;
    MemWrite  = 0;
    RegWrite  = 0;
    Branch    = 0;
    PCUpdate  = 0;

    case (state)
      S0: begin // Fetch
        AdrSrc    = 0;
        IRWrite   = 1;
        ALUSrcA   = 2'b00;  // PC
        ALUSrcB   = 2'b10;  // 4
        ALUOp     = 2'b00;
        ResultSrc = 2'b10;  // ALUResult (comb) -> PC
        PCUpdate  = 1;
      end

      S1: begin // Decode
        ALUSrcA = 2'b01;
        ALUSrcB = 2'b01;
        ALUOp   = 2'b00;
      end

      S2: begin // MemAdr
        ALUSrcA = 2'b10;
        ALUSrcB = 2'b01;
        ALUOp   = 2'b00;
      end

      S3: begin // MemRead
        AdrSrc    = 1;
        ResultSrc = 2'b00;
      end

      S4: begin // MemWB
        ResultSrc = 2'b01;
        RegWrite  = 1;
      end

      S5: begin // MemWrite
        AdrSrc   = 1;
        MemWrite = 1;
      end

      S6: begin // ExecuteR
        ALUSrcA = 2'b10;
        ALUSrcB = 2'b00;
        ALUOp   = 2'b10;
      end

      S7: begin // ALUWB
        ResultSrc = 2'b00;
        RegWrite  = 1;
      end

      S8: begin // ExecuteI
        ALUSrcA = 2'b10;
        ALUSrcB = 2'b01;
        ALUOp   = 2'b10;
      end
		
		S9: begin // JAL
        ALUSrcA   = 2'b01;   // OldPC
        ALUSrcB   = 2'b10;   // 4
        ALUOp     = 2'b00;
        ResultSrc = 2'b00;   // ALUOut -> PC
        PCUpdate  = 1;
      end

      S10: begin // BEQ
        ALUSrcA   = 2'b10;
        ALUSrcB   = 2'b00;
        ALUOp     = 2'b01;   // subtract
        ResultSrc = 2'b00;   // ALUOut (jump target from S1)
        Branch    = 1;
      end
    

      default: begin end
    endcase
  end

endmodule