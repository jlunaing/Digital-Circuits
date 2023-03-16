`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-31
  * Design Name: Comparator Behavioral Circuit
  * Module Name: comparator
  * Project Name: Project 3
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of a 4-bit
  *     comparator. This circuit compares the values of 
  *     two 4-bit unsigned binary numbers, A and B, and the
  *     output indicates whether the numbers are equal (EQ)
  *     or if A is greater than (GT) or less than (LT) B.
  */

module comparator(A, B, EQ, LT, GT);

    input [3:0] A, B;
    output logic EQ, LT, GT;
    
    // Behavioral logic inside "always" or "initial" blocks only
    // This block always repeats every time A or B changes.

    always @ (A,B)
        begin
            if (A == B)     // If both numbers are equal
                begin
                EQ = 1; LT = 0; GT = 0;
                end
            else if (A > B) // If A is greater than B
                begin
                EQ = 0; LT = 0; GT = 1;
                end
            else if (A < B) // If A is less than B
                begin
                EQ = 0; LT = 1; GT = 0;
                end
            else
                begin
                EQ = 0; LT = 0; GT = 0;
                end
        end
        
endmodule
