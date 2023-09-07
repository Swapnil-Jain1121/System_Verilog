#compilation
vlog top_sample_pkt_1.sv

#elaboration
vsim top +testname=fixed_preamble -solvefaildebug=1

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all



