#compilation
vlog array_of_queue.sv

#elaboration
vsim top

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

