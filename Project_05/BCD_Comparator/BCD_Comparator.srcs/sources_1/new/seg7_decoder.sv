`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-09
  * Design Name: 7-Segment Decoder
  * Module Name: seg7_decoder
  * Project Name: Project 5
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of a BCD to
  *     7-segment decoder circuit. The input is a 4-bit BCD
  *     number and the outputs are the various segments of
  *     the display including the decimal point.
  *
  *     This implementation also takes the result from a 
  *     comparator as input to control which display is on.
  */

module seg7_decoder(
        input logic [3:0] A, B,
        input logic [2:0] comp_result,
        output logic [7:0] seg_out,
        output logic [3:0] disp_select
        );
     
    always @(*)
    begin
        // If both numbers are equal, display is blank
        if (comp_result == 3'b100)
            begin
            disp_select = 4'b1111;
            end
        // If A < B (less-than case), then show B
        else if (comp_result == 3'b010 && B < 10)
            begin
            disp_select = 4'b0111;
            
            case (B)        
                // input              abcdefgdp
                4'b0000: seg_out = 8'b0000001_1; // 0
                4'b0001: seg_out = 8'b1001111_1; // 1
                4'b0010: seg_out = 8'b0010010_1; // 2
                4'b0011: seg_out = 8'b0000110_1; // 3
                4'b0100: seg_out = 8'b1001100_1; // 4
                4'b0101: seg_out = 8'b0100100_1; // 5
                4'b0110: seg_out = 8'b0100000_1; // 6
                4'b0111: seg_out = 8'b0001111_1; // 7
                4'b1000: seg_out = 8'b0000000_1; // 8
                4'b1001: seg_out = 8'b0000100_1; // 9
                // Turn off display when input BCD value
                // exceeds the range of decimal digits
                default: seg_out = 8'b1111111_1;
            endcase
            end
            
        // If A > B (greater-than case), then show A
        else if (comp_result == 3'b001 && A < 10)
            begin
            disp_select = 4'b0111;
            
            case (A)        
                // input              abcdefgdp
                4'b0000: seg_out = 8'b0000001_1; // 0
                4'b0001: seg_out = 8'b1001111_1; // 1
                4'b0010: seg_out = 8'b0010010_1; // 2
                4'b0011: seg_out = 8'b0000110_1; // 3
                4'b0100: seg_out = 8'b1001100_1; // 4
                4'b0101: seg_out = 8'b0100100_1; // 5
                4'b0110: seg_out = 8'b0100000_1; // 6
                4'b0111: seg_out = 8'b0001111_1; // 7
                4'b1000: seg_out = 8'b0000000_1; // 8
                4'b1001: seg_out = 8'b0000100_1; // 9
                // Turn off display when input BCD value
                // exceeds the range of decimal digits
                default: seg_out = 8'b1111111_1;
            endcase
            end
            
        else
            begin
            disp_select = 4'b1111;
            end
    end
    
endmodule
