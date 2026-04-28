transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/riscv.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/regfile.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/mux2.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/flopr.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/extend.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/datapath.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/controller.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/aludec.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/alu.sv}
vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/top.sv}

vlog -sv -work work +incdir+C:/Users/kaanm/OneDrive/Desktop/EE4\ -\ SPRING/ELE\ 432\ -\ Digital\ Design/Preliminary\ Works/PRE3 {C:/Users/kaanm/OneDrive/Desktop/EE4 - SPRING/ELE 432 - Digital Design/Preliminary Works/PRE3/riscv_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  riscv_testbench

add wave *
view structure
view signals
run -all
