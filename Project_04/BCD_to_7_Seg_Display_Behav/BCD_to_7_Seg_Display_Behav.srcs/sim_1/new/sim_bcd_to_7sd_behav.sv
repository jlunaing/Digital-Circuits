`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-09
  * Design Name: BCD to 7-Segment Decoder Behavioral Simulation
  * Module Name: bcd_to_7sd_behav
  * Project Name: Project 4
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of a BCD to
  *     7-segment decoder circuit. The input is a 4-bit BCD
  *     number and the outputs are the various segments of
  *     the display including the decimal point.
  *
  *     This implementation uses pushbutton to control which
  *     display is on.
  */

module sim_bcd_to_7sd_behav();
    
    // Declare inputs and outputs of the module under test
    
    // 4-bit input BCD number
    logic [3:0] sim_bcd;
    // 8-bit output vector for the segments and "off" function
    logic [7:0] sim_segment;
    
    // 4-bit input for 4 pushbutton control logic
    logic [3:0] sim_btn;
    // 4-bit output for selecting active display
    logic [3:0] sim_disp_sel;

    // Instantiate device under test (DUT) with a name
    // matching that of the module in .vs design source file
    bcd_to_7sd_behav DUT (
        .bcd(sim_bcd),
        .segment(sim_segment),
        .btn(sim_btn),
        .disp_sel(sim_disp_sel)
        );

    // Initialize the input values for the simulation.
    // Each initial block starts at time 0, in parallel.
    initial begin
    
        // Turn the right-most display
        
        // Top button is pressed (0-9, 0-F shown)
        // Center button is not pressed (normal operation)
        // Left and right buttons are FALSE
        sim_btn = 4'b1000;
        
        // Decoder logic
        sim_bcd = 4'b0000;
        #10 sim_bcd = 4'b0001;
        #10 sim_bcd = 4'b0010;
        #10 sim_bcd = 4'b0011;
        #10 sim_bcd = 4'b0100;
        #10 sim_bcd = 4'b0101;
        #10 sim_bcd = 4'b0110;
        #10 sim_bcd = 4'b0111;
        #10 sim_bcd = 4'b1000;
        #10 sim_bcd = 4'b1001;
        #10 sim_bcd = 4'b1010;
        #10 sim_bcd = 4'b1011;
        #10 sim_bcd = 4'b1100;
        #10 sim_bcd = 4'b1101;
        #10 sim_bcd = 4'b1110;
        #10 sim_bcd = 4'b1111;
        #10 
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
  end
endmodule