`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-31
  * Design Name: Comparator Simulation
  * Module Name: sim_comparator
  * Project Name: Project 3
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains a simulation of a 4-bit
  *     comparator. This circuit compares the values of 
  *     two 4-bit unsigned binary numbers, A and B, and the
  *     output indicates whether the numbers are equal (EQ)
  *     or if A is greater than (GT) or less than (LT) B.
  */

module sim_comparator();

    // Declare inputs and outputs of the module under test
    // Modified default reg and wire types to logic.
    logic [3:0] a,b;
    logic eq, lt, gt;
      
    // Device under test (DUT) must have a name matching that of the
    // module in the design source file
    comparator DUT (
        .A(a),
        .B(b),
        .EQ(eq),
        .LT(lt),
        .GT(gt)
        );
    // Each initial block starts at time 0, in parallel.
    initial begin
        // var = <bit-size>'b<num>
        a = 4'b0010; b = 4'b0010; // Equal case
        #20 // Delay advances time by 20-ns
        a = 4'b0100; b = 4'b0001; // Greater-than case 
        #20
        a = 4'b0100; b = 4'b1000; // Less-than case
        #20
        a = 4'b1010; b = 4'b0101; // Greater-than case
        #20
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
        // Display message
        $display("Simulation finished!");  
    end
endmodule