`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-31
  * Design Name: Ripple Carry Adder Circuit
  * Module Name: ripple_carry_adder
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

module ripple_carry_adder(a, b, rca_sum, rca_cout);

    input [3:0] a;
    input [3:0] b;
    output [3:0] rca_sum;
    output rca_cout;
    
    logic [2:0] carry;
    
    half_adder HA(
        .A(a[0]),   // HA takes the LSB of 4-bit input a
        .B(b[0]),   // HA takes the LSB of 4-bit input b
        .cout(carry[0]),    // HA cout is saved in carry bus
        .sum(rca_sum[0])    // HA sum is LSB of RCA's sum
        );
    
    full_adder FA1(
        .A(a[1]),   // FA1 takes second LSB of 4-bit input a
        .B(b[1]),   // FA1 takes second LSB of 4-bit input b
        .cin(carry[0]),     // FA1 cin is HA cout; accessed from bus
        .cout(carry[1]),    // FA1 cout is saved in carry bus
        .sum(rca_sum[1])    // FA1 sum is second LSB of RCA's sum
        );
        
    full_adder FA2(
        .A(a[2]),   // FA2 takes second MSB of 4-bit input a
        .B(b[2]),   // FA2 takes second MSB of 4-bit input b
        .cin(carry[1]),     // FA2 cin is FA1 cout; accessed from bus
        .cout(carry[2]),    // FA2 cout is saved in carry bus
        .sum(rca_sum[2])    // FA2 sum is second MSB of RCA's sum
        );
        
    full_adder FA3(
        .A(a[3]),   // FA3 takes the MSB of 4-bit input a
        .B(b[3]),   // FA3 takes the MSB of 4-bit input b
        .cin(carry[2]),     // FA3 cin is FA2 cout; accessed from bus
        .cout(rca_cout),    // FA3 cout is final RCA cout
        .sum(rca_sum[3])    // FA3 sum is the MSB of RCA's sum
        );
    
endmodule
