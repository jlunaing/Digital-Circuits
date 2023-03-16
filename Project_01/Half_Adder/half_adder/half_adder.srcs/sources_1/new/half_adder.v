`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-19
  * Design Name: Half Adder Circuit
  * Module Name: half_adder
  * Project Name: Project 1
  * Target Devices: Basys 3 board
  * Tool Versions: 
  * Description:
  *     This module contains a digital circuit that performs
  *     mathematical addition. It takes two 1-bit values as 
  *     inputs and outputs the sum and a carry-out bit. That 
  *     is, one bit that carries the result of the two-bit 
  *     addition and another that tells whether the addition 
  *     operation generated a carry-out.
  *
  * Dependencies: N/A
  * 
  * Revision: 1
  * Revision 0.01 - File Created
  * Additional Comments: N/A 
  */

module half_adder(
    input OP_A,
    input OP_B,
    output SUM, 
    output CO
    );
    
    assign SUM = (~OP_A & OP_B) | (OP_A & ~OP_B);
    assign CO = OP_A & OP_B;
    
endmodule