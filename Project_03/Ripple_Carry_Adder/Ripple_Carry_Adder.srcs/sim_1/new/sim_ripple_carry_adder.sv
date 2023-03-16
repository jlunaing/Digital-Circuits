`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-31
  * Design Name: Ripple Carry Adder Simulation
  * Module Name: sim_ripple_carry_adder
  * Project Name: Project 3
  * Target Devices: Basys 3 board
  * Revision: 1
  * Dependencies:
  *     - half_adder.sv
  *     - full_adder.sv
  *
  * Description:
  *     This module contains the implementation of a 4-bit
  *     ripple carry adder (RCA). The circuit adds two 4-bit
  *     binary numbers and outputs the resulting 4-bit sum
  *     and a single-bit carry out. The design is modular
  *     in that we use the previously design modules for the
  *     half and full adders to build the RCA.
  */

module sim_ripple_carry_adder();

    // Declare inputs and outputs of the module under test
    // Modified default reg and wire types to logic.
    logic [3:0] a;
    logic [3:0] b;
    logic cout;
    logic [3:0] sum;
      
    // Device under test (DUT) must have a name matching that of the
    // module in the design source file
    ripple_carry_adder DUT (
        .a(a),
        .b(b),
        .rca_cout(cout),
        .rca_sum(sum)
        );
    // Each initial block starts at time 0, in parallel.
    initial begin
        // var = <bit-size>'b<num>
        a = 4'b0001; b = 4'b0010; // index 0
        #20 // Delay advances time by 20-ns
        a = 4'b0010; b = 4'b0100; // index 1 
        #20
        a = 4'b0100; b = 4'b1000; // index 4
        #20
        a = 4'b1010; b = 4'b0101; // index 5
        #20
        a = 4'b1111; b = 4'b1111; // index 8
        #20
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
        // Display message
        $display("Simulation finished!");  
    end
endmodule