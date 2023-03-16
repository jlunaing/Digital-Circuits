`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-19
  * Design Name: Half Adder Circuit
  * Module Name: half_adder
  * Project Name: Project 3
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains a digital circuit that performs
  *     mathematical addition. It takes two 1-bit values as 
  *     inputs and outputs the sum and a carry-out bit. That 
  *     is, one bit that carries the result of the two-bit 
  *     addition and another that tells whether the addition 
  *     operation generated a carry-out.
  */

module half_adder(
    input A,
    input B,
    output sum, 
    output cout
    );
    
    assign sum = (~A & B) | (A & ~B);
    assign cout = A & B;
    
endmodule