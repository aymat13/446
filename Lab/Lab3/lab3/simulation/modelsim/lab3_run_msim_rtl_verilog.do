transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/Reg_WE.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/Reg_Simple.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/Mux4to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/Mux2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/constantValueGenerator.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3 {C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/imem.v}

