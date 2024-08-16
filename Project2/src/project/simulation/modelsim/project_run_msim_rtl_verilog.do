transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/and32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/or32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/xor32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/nor32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/lessthan32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/half_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/add32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/sub32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/mod_dp.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/mod_cu.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/alu32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/mux8x1.v}

vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/my_mod_alu_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/and32_alu_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/and32_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/or32_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/xor32_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/nor32_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/lessthan32_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/ALPER/Desktop/quartus/project {C:/Users/ALPER/Desktop/quartus/project/sub32_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  my_mod_alu_testbench

add wave *
view structure
view signals
run -all
