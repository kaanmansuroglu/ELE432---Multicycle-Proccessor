# ELE 432 - Lab 3: Multicycle RISC-V Processor

Hierarchical SystemVerilog implementation of a multicycle RISC-V processor,
following the design in Harris & Harris (RISC-V Edition).

## Hierarchy

```
top
 ├── riscv
 │    ├── controller
 │    │    ├── mainfsm
 │    │    ├── aludec
 │    │    └── instrdec
 │    └── datapath
 │         ├── PC, OldPC, IR, A, B, ALUOut, Data registers
 │         ├── ALU, regfile, extender
 │         └── source muxes
 └── unified memory (instruction + data RAM)
```

## Files

- `top.sv` — top module with unified memory
- `riscv.sv` — processor wrapper (controller + datapath)
- `controller.sv` — multicycle FSM controller
- `datapath.sv` — multicycle datapath with intermediate registers
- `mainfsm.sv`, `aludec.sv`, `instrdec.sv` — controller submodules (from HW2)
- `alu.sv`, `regfile.sv`, `extend.sv`, `adder.sv` — reused from single-cycle
- `flopr.sv`, `flopenr.sv`, `mux2.sv` — building blocks
- `riscv_testbench.sv` — testbench
- `memfile.txt` — test program (machine code)

## Test program

The provided program exercises `add`, `sub`, `and`, `or`, `slt`, `addi`, `lw`,
`sw`, `beq`, and `jal`. On success it writes the value 25 to memory address
100.

## Result

```
Simulation succeeded
```
