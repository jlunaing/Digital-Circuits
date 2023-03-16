`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-09
  * Design Name: BCD to 7-Segment Display Decoder Simulation
  * Module Name: sim_bcd_to_7sd
  * Project Name: Project 4
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains a Verilog simulation of a BCD to
  *     7-segment decoder circuit. The input is a 4-bit BCD
  *     number and the outputs are the various segments of
  *     the display including the decimal point.
  *
  *     This implementation uses the right-most display and
  *     when the input BCD value exceeds the range of decimal
  *     digits, the display is turned off.
  */

module sim_bcd_to_7sd();
    
    // Declare inputs and outputs of the module under test
    
    // Input 4-bit BCD number
    logic [3:0] sim_bcd;
    // Output 8-bit vector for the segments and "off" function
    logic [7:0] sim_segment;

    // Instantiate device under test (DUT) with a name
    // matching that of the module in .vs design source file
    bcd_to_7sd DUT (
        .bcd(sim_bcd),
        .segment(sim_segment)
        );

    // Initialize the input values for the simulation.
    // Each initial block starts at time 0, in parallel.
    initial begin
        // var = <bit-size>'b<num>
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
        #10 
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
  end

//  // Display the output values for the simulation
//  initial begin
//    #1 repeat (12) begin
//      #10 $display("bcd = %b, segment = %b", bcd, segment);
//    end
//  end

endmodule
