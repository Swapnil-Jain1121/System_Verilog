#compilation
vlog semaphore_1.sv

#elaboration
vsim top

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all