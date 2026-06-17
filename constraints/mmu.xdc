# Clock

set_property PACKAGE_PIN W5 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports clk]


# Reset button

set_property PACKAGE_PIN U18 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports reset]


# Virtual address switches

set_property PACKAGE_PIN V17 [get_ports virtual_addr[0]]
set_property PACKAGE_PIN V16 [get_ports virtual_addr[1]]

set_property PACKAGE_PIN W16 [get_ports virtual_addr[2]]
set_property PACKAGE_PIN W17 [get_ports virtual_addr[3]]


# LEDs

set_property PACKAGE_PIN U16 [get_ports page_fault]

set_property PACKAGE_PIN E19 [get_ports protection_fault]

set_property PACKAGE_PIN U19 [get_ports translation_valid]


set_property IOSTANDARD LVCMOS33 [get_ports *]