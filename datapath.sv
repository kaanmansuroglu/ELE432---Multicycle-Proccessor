
module datapath(input  logic        clk, reset,
                // from controller
                input  logic [1:0]  ALUSrcA,
                input  logic [1:0]  ALUSrcB,
                input  logic [1:0]  ResultSrc,
                input  logic        AdrSrc,
                input  logic        IRWrite,
                input  logic        PCWrite,
                input  logic        RegWrite,
                input  logic [1:0]  ImmSrc,
                input  logic [2:0]  ALUControl,
                // memory interface
                output logic [31:0] Adr,
                output logic [31:0] WriteData,
                input  logic [31:0] ReadData,
                // to controller
                output logic        Zero,
                // for testbench 
                output logic [31:0] PC,
                output logic [31:0] Instr);

  // Internal signals
  logic [31:0] OldPC;
  logic [31:0] A, B;
  logic [31:0] ALUResult, ALUOut;
  logic [31:0] Data;
  logic [31:0] ImmExt;
  logic [31:0] SrcA, SrcB;
  logic [31:0] Result;
  logic [31:0] RD1, RD2;

  
  flopenr #(32) pcreg(clk, reset, PCWrite, Result, PC);

  
  flopenr #(32) oldpcreg(clk, reset, IRWrite, PC, OldPC);

  
  mux2 #(32) adrmux(PC, ALUOut, AdrSrc, Adr);

  
  flopenr #(32) instrreg(clk, reset, IRWrite, ReadData, Instr);

  
  regfile rf(clk, RegWrite,
             Instr[19:15], Instr[24:20], Instr[11:7],
             Result,
             RD1, RD2);

				 
  flopr #(32) areg(clk, reset, RD1, A);
  flopr #(32) breg(clk, reset, RD2, B);

  assign WriteData = B;  // for sw instruction

  
  extend ext(Instr[31:7], ImmSrc, ImmExt);

  
  always_comb
    case (ALUSrcA)
      2'b00:   SrcA = PC;
      2'b01:   SrcA = OldPC;
      2'b10:   SrcA = A;
      default: SrcA = 32'bx;
    endcase

  always_comb
    case (ALUSrcB)
      2'b00:   SrcB = B;
      2'b01:   SrcB = ImmExt;
      2'b10:   SrcB = 32'd4;
      2'b11:   SrcB = ImmExt;
      default: SrcB = 32'bx;
    endcase

	 
  alu alu(SrcA, SrcB, ALUControl, ALUResult, Zero);

  
  flopr #(32) aluoutreg(clk, reset, ALUResult, ALUOut);

  
  flopr #(32) datareg(clk, reset, ReadData, Data);

  
  always_comb
    case (ResultSrc)
      2'b00:   Result = ALUOut;      // R/I-type result
      2'b01:   Result = Data;        // lw
      2'b10:   Result = ALUResult;   // combinational (PC+4 in fetch, branch target)
      default: Result = 32'bx;
    endcase

endmodule
