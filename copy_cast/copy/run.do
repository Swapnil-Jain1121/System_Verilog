#compilation
vlog deep_copy_practical_example.sv

#elaboration
vsim top

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all