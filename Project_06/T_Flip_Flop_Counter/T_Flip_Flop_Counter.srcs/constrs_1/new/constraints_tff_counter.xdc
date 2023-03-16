## Author: Juan Luna
## Project: BCD Comparator Structural Model, Modified

## Description:
## This file is a general .xdc for the Basys3 rev B board
## To use it, rename the used ports (in each line, after get_ports) 
## according to the top level signal names in the project

## Syntax:
## set_property PACKAGE_PIN A [get_ports {B}]
##      set_property IOSTANDARD LVCMOS33 [get_ports {B}]
##
## Line 1:  Physical pin assignment
##              Logical pin B is assigned to physical pin A
## Line 2: 
##          I/O standard for logical pin B
##              Sets voltage level and drive strength for pin B
##          LVCMOS33 digital signaling standard
##              Standard commonly used in FPGA designs. 
##              It specifies a 3.3V low-voltage standard.

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
 
## Switches

## Right side
#set_property PACKAGE_PIN V17 [get_ports {sw[0]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
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

## Right side
#set_property PACKAGE_PIN U16 [get_ports {led[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
#set_property PACKAGE_PIN E19 [get_ports {led[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
#set_property PACKAGE_PIN U19 [get_ports {led[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
#set_property PACKAGE_PIN V19 [get_ports {led[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
#set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
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

## Left-most LED
#set_property PACKAGE_PIN L1 [get_ports {led[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
	
	
## Segments of 7-segment display
set_property PACKAGE_PIN W7 [get_ports {seg[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]
set_property PACKAGE_PIN W6 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN U8 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN V8 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN U5 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN V5 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN U7 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

## Decimal point of 7-segment display
set_property PACKAGE_PIN V7 [get_ports seg[0]]							
	set_property IOSTANDARD LVCMOS33 [get_ports seg[0]]

## The four 7-segment displays
set_property PACKAGE_PIN U2 [get_ports {disp_sel[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {disp_sel[3]}]
set_property PACKAGE_PIN U4 [get_ports {disp_sel[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {disp_sel[2]}]
set_property PACKAGE_PIN V4 [get_ports {disp_sel[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {disp_sel[1]}]
set_property PACKAGE_PIN W4 [get_ports {disp_sel[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {disp_sel[0]}]

## Buttons
set_property PACKAGE_PIN U18 [get_ports BTN]						
    set_property IOSTANDARD LVCMOS33 [get_ports BTN]
#set_property PACKAGE_PIN T18 [get_ports btnU]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports btnL]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#set_property PACKAGE_PIN T17 [get_ports btnR]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]