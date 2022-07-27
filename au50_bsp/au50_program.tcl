open_hw_manager
connect_hw_server -allow_non_jtag

# 500202A30D7AA xcu50_u55n_0 
# 500202A3099AA xcu50_u55n_0_1

# get the JTAG programmers serial number
# This is located on the programmers iself or
# it can be found using the hardware manager
# ie 5002002A3099AA
open_hw_target {localhost:3121/xilinx_tcf/Xilinx/500202A20EDAA}

# set the correct name for the device you are targeting.
# this can be found using the hardware manager
# xcu50_u55n_0, xcu50_u55n_0_1, xcu50_u55n_0_2 etc
set au50_dev xcu50_u55n_0

# opens a connection to the hardware
current_hw_device [get_hw_devices $au50_dev]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices $au50_dev] 0]

# adds the flash memory device to the jtag
create_hw_cfgmem -hw_device [lindex [get_hw_devices $au50_dev] 0] [lindex [get_cfgmem_parts {mt25qu01g-spi-x1_x2_x4}] 0]

# configures the parameters for the mcs file programming
set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.VERIFY  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.CHECKSUM  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.FILES [list "./au50_bsp.mcs" ] [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.PRM_FILE {} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
set_property PROGRAM.UNUSED_PIN_TERMINATION {pull-none} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
refresh_hw_device [lindex [get_hw_devices $au50_dev] 0]

# programs the flash device with the mcs file
startgroup 
create_hw_bitstream -hw_device [lindex [get_hw_devices $au50_dev] 0] [get_property PROGRAM.HW_CFGMEM_BITFILE [ lindex [get_hw_devices $au50_dev] 0]]; program_hw_devices [lindex [get_hw_devices $au50_dev] 0]; refresh_hw_device [lindex [get_hw_devices $au50_dev] 0];
program_hw_cfgmem -hw_cfgmem [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
endgroup
