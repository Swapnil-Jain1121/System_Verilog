#compilation
vlog randomize_inline_only.sv

#elaboration
vsim top +testname=fixed_preamble -solvefaildebug=2

#adding signals to the wave
#add wave -position insertpoint sim:/top/*

#simulation
run -all

