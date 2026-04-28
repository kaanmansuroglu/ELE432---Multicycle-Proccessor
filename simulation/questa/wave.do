onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /riscv_testbench/clk
add wave -noupdate -radix hexadecimal /riscv_testbench/reset
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/PC
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/Instr
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/riscv/ctrl/state
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/riscv/dp/SrcA
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/riscv/dp/SrcB
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/riscv/dp/ALUResult
add wave -noupdate -radix hexadecimal /riscv_testbench/dut/Adr
add wave -noupdate -radix hexadecimal /riscv_testbench/WriteData
add wave -noupdate -radix hexadecimal /riscv_testbench/MemWrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {246 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {761 ps}
