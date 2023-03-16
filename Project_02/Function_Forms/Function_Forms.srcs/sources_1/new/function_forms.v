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
  *     This module contains the implementation of a function 
  *     using NAND/NAND and NOR/NOR circuit forms. The function
  *     is derived from the experimental analysis of a .bit
  *     file programmed into the board. Both NAND and NOR forms
  *     for the output f are functionally equivalent.
  * 
  * Revision: 1
  */

module function_forms(
    input A,
    input B,
    input C,
    input D,
    output f_2_nand,
    output f_2_nor
    );
    
    // Reduced SOP expression for F
    //assign F = (A | B) & (C | D);
    
    // NAND/NAND equation of F
    assign f_2_nand = ~(~(A & C)& ~(A & D)& ~(B & C)& ~(B & D));
    
    // NOR/NOR equation of F
    assign f_2_nor = ~(~(A | B) | ~(C | D));
    
endmodule
