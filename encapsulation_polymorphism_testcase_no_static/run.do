#compilation
vlog top.sv

#elaboration
vsim top +testcase=test_rand_pkt  +count=5

#adding signals to the wave
#add wave -position insertpoint sim:/tb/*

#simulation
run -all