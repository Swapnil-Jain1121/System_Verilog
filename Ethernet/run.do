#compilation
vlog ethernet_3_protected.sv

#elaboration
vsim -novopt -suppress 12110 top -sv_seed 457s

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

