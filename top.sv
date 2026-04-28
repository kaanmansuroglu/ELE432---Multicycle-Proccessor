module top(input  logic        clk, reset,
           output logic [31:0] WriteData, DataAdr,
           output logic        MemWrite);

  logic [31:0] ReadData;
  logic [31:0] PC, Instr;
  logic [31:0] Adr;

  riscv riscv(
    .clk(clk), .reset(reset),
    .Adr(Adr),
    .WriteData(WriteData),
    .ReadData(ReadData),
    .MemWrite(MemWrite),
    .PC(PC),
    .Instr(Instr)
  );

  logic [31:0] RAM[63:0];

  initial
    $readmemh("C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/memfile.txt", RAM);

  assign ReadData = RAM[Adr[31:2]];

  always_ff @(posedge clk)
    if (MemWrite)
      RAM[Adr[31:2]] <= WriteData;

  assign DataAdr = Adr;

endmodule
