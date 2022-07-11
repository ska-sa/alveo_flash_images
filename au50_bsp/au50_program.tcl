open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
# set the correct name for the device you are targeting.
# this can be found via the hardware manager.
# xcu50_u55n_0, xcu50_u55n_0_1, xcu50_u55n_0_2 etc
set au50_dev xcu50_u55n_0
current_hw_device [get_hw_devices $au50_dev]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices $au50_dev] 0]

# add the flash memory device to the jtag
create_hw_cfgmem -hw_device [lindex [get_hw_devices $au50_dev] 0] [lindex [get_cfgmem_parts {mt25qu01g-spi-x1_x2_x4}] 0]

# configure the parameters for the mcs file programming
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

# program the flash device with the mcs file
startgroup 
create_hw_bitstream -hw_device [lindex [get_hw_devices $au50_dev] 0] [get_property PROGRAM.HW_CFGMEM_BITFILE [ lindex [get_hw_devices $au50_dev] 0]]; program_hw_devices [lindex [get_hw_devices $au50_dev] 0]; refresh_hw_device [lindex [get_hw_devices $au50_dev] 0];
program_hw_cfgmem -hw_cfgmem [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $au50_dev] 0]]
endgroup