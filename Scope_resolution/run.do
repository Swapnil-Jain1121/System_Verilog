#compilation
vlog scope_2.sv

#elaboration
vsim -novopt -suppress 12110 top 

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

