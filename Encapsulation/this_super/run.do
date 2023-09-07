#compilation
vlog top.sv

#elaboration
vsim top

#adding signals to the wave
#add wave -position insertpoint sim:/tb/*

#simulation
run -all