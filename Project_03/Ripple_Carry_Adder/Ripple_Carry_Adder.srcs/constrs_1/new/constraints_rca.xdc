## Author: Juan Luna
## Project: Ripple Carry Adder Constraints

## Description:
## This file is a general .xdc for the Basys3 rev B board
## To use it, rename the used ports (in each line, after get_ports) 
## according to the top level signal names in the project
 
## Switches

## 4-bit input B
set_property PACKAGE_PIN V17 [get_ports {b[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN V16 [get_ports {b[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN W16 [get_ports {b[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN W17 [get_ports {b[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
	
## 4-bit input A
set_property PACKAGE_PIN W15 [get_ports {a[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN V15 [get_ports {a[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN W14 [get_ports {a[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property PACKAGE_PIN W13 [get_ports {a[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]
	
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
 
## LEDs

## 4-bit output sum
set_property PACKAGE_PIN U16 [get_ports {rca_sum[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rca_sum[0]}]
set_property PACKAGE_PIN E19 [get_ports {rca_sum[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rca_sum[1]}]
set_property PACKAGE_PIN U19 [get_ports {rca_sum[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rca_sum[2]}]
set_property PACKAGE_PIN V19 [get_ports {rca_sum[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rca_sum[3]}]
	
#set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
	
## 1-bit output carry-out
set_property PACKAGE_PIN V14 [get_ports {rca_cout}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rca_cout}]
	
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {led[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
#set_property PACKAGE_PIN P1 [get_ports {led[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
#set_property PACKAGE_PIN L1 [get_ports {led[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]