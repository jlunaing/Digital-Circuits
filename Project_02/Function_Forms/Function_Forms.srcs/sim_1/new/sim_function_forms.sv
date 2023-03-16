`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-26
  * Design Name: Implementing Function Forms
  * Module Name: function_forms
  * Project Name: Project 2
  * Target Devices: Basys 3 board
  *
  * Description: 
  *     This module contains the simulation of a function 
  *     using NAND/NAND and NOR/NOR circuit forms. The function
  *     is derived from the experimental analysis of a .bit
  *     file programmed into the board. Both NAND and NOR forms
  *     for the output f are functionally equivalent.
  * 
  * Revision: 1
  */

module sim_function_forms();
    // Modified default reg and wire types to logic.
    logic a, b, c, d;
    logic f2nand, f2nor;
      
    // Device under test (DUT) must have a name matching that of the
    // module in the design source file
    function_forms DUT (
        .A(a),
        .B(b),
        .C(c),
        .D(d),
        .f_2_nand(f2nand),
        .f_2_nor(f2nor)
        );
    // Each initial block starts at time 0, in parallel.
    initial begin
        // var = <bit-size>'b<num>
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; // index 0
        // Delay advances time by 20-ns
        #20
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; // index 1 
        #20
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; // index 4
        #20
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; // index 5
        #20
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; // index 8
        #20
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; // index 9
        #20
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; // index 12
        #20
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; // index 13
        #20
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
    end
endmodule