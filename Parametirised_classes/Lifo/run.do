#compilation
vlog param_class_from_param_class.sv

#elaboration
vsim -novopt -suppress 12110 top 

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

