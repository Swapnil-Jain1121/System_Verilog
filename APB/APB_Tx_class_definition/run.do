#compilation
vlog APB_tx_2.sv

#elaboration
vsim -novopt -suppress 12110 top -sv_seed 457s

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

