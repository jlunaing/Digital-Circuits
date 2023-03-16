`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-09
  * Design Name: BCD to 7-Segment Display Decoder
  * Module Name: bcd_to_7sd
  * Project Name: Project 4
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of a BCD to
  *     7-segment decoder circuit. The input is a 4-bit BCD
  *     number and the outputs are the various segments of
  *     the display including the decimal point.
  *
  *     This implementation uses the right-most display and
  *     when the input BCD value exceeds the range of decimal
  *     digits, the display is turned off.
  */

module bcd_to_7sd(
        // 4-bit BCD number
        input [3:0] bcd,      
        // 8-bits for 7 display segments and 1 decimal point
        output [7:0] segment,
        // 4-bits for selecting which of the displays to turn on
        output [3:0] disp_sel
        );
    
    
    // Turn on right-most display, AN[0]
    assign disp_sel = 4'b1110;

    // Map the BCD inputs to the corresponding 7-segment
    // 7-segment outputs using the conditional operator (?)
    
    // Syntax: 
    // condition ? expression_if_true : expression_if_false
    
    // In this context, if the input condition is not true,
    // the next condition is evaluated.
    
    //                         input       abcdefgdp
    assign segment = (bcd == 4'b0000) ? 8'b0000001_1 : // 0
                     (bcd == 4'b0001) ? 8'b1001111_1 : // 1
                     (bcd == 4'b0010) ? 8'b0010010_1 : // 2
                     (bcd == 4'b0011) ? 8'b0000110_1 : // 3
                     (bcd == 4'b0100) ? 8'b1001100_1 : // 4
                     (bcd == 4'b0101) ? 8'b0100100_1 : // 5
                     (bcd == 4'b0110) ? 8'b0100000_1 : // 6
                     (bcd == 4'b0111) ? 8'b0001111_1 : // 7
                     (bcd == 4'b1000) ? 8'b0000000_1 : // 8
                     (bcd == 4'b1001) ? 8'b0000100_1 : // 9
                     // Turn off display when input BCD value
                     // exceeds the range of decimal digits
                     8'b1111111_1;
                     
endmodule