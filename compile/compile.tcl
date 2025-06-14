# Dr. Kaputa
# Quartus II compile script for DE1-SoC board

# 1] name your project here
set project_name "Lab_4_TLDE"

file delete -force ../project
file delete -force ../output_files
file mkdir ../project
cd ../project
load_package flow
project_new $project_name
set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY display_counter
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 2] include your relative path files here
set_global_assignment -name VHDL_FILE ../src/generic_counter.vhd
set_global_assignment -name VHDL_FILE ../src/generic_adder_beh.vhd
set_global_assignment -name VHDL_FILE ../src/seven_seg.vhd
set_global_assignment -name VHDL_FILE ../src/display_counter.vhd

execute_flow -compile
project_close