`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-26
  * Design Name: Full Adder Reduced SOP Circuit
  * Module Name: full_adder
  * Project Name: Project 3
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description: 
  *     This module contains the reduced SOP form for a full adder.
  *     It is a 3-bit adder, with 2 bits associated with the addition
  *     operation and a third, "carry-in" bit. The outputs are a sum
  *     and a "carry-out" bit.
  */
  
module full_adder(
    input A,
    input B,
    input cin,
    output sum,
    output cout
    );
    
    // Reduced SOP expression for sum operation
    // XOR operator in Verilog is ^
    assign sum = A ^ (B ^ cin);
    
    // Reduced SOP expression for carry-out
    assign cout = (A & B) | (A & cin) | (B & cin);
    
endmodule