#compilation
vlog array_of_queues.sv

#elaboration
vsim top -sv_seed 4579

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

