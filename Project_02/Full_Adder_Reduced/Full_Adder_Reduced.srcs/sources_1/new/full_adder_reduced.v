`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-26
  * Design Name: Full Adder Reduced SOP Circuit
  * Module Name: full_adder_reduced
  * Project Name: Project 2
  * Target Devices: Basys 3 board
  *
  * Description: 
  *     This module contains the reduced SOP form for a full adder.
  *     It is a 3-bit adder, with 2 bits associated with the addition
  *     operation and a third, "carry-in" bit. The outputs are a sum
  *     and a "carry-out" bit.
  * 
  * Revision: 1
  */
  
module full_adder_reduced(
    input OP_A,
    input OP_B,
    input Cin,
    output SUM,
    output CO
    );
    
    // Reduced SOP expression for sum operation
    // XOR operator in Verilog is ^
    assign SUM = OP_A ^ (OP_B ^ Cin);
    
    // Reduced SOP expression for carry-out
    assign CO = (OP_A & OP_B) | (OP_A & Cin) | (OP_B & Cin);
    
endmodule