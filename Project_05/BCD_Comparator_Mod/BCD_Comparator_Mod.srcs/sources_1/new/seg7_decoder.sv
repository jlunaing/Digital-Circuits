`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-16
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
  *     comparator as input as well as a pushbutton to 
  *     control which display is on.
  */

module seg7_decoder(
        // 4-bit BCD number
        input [3:0] A, B,
        // 3-bits for comparator result (EQ, LT, GT)
        input [2:0] comp_result,
        // 1-bit for center pushbutton control
        input button,
        // 8-bits for 7 display segments and 1 decimal point
        output logic [7:0] seg_out,
        // 4-bits for selecting which of the displays to turn on
        // MSB is AN[3] and LSB is AN[0]
        output logic [3:0] disp_select
        );
     
    always @(*)
    begin
        // If both numbers are equal, AN[2] and AN[1] are on
        if (comp_result == 3'b100 && A < 10 && B < 10)
            begin
            disp_select = 4'b1001;
            end
        // If A < B (less-than case), show B and AN[0] is on
        else if (comp_result == 3'b010 && B < 10)
            begin
            disp_select = 4'b1110;
            
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
        // If A > B (greater-than case), , show A and AN[3] is on
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
        
        // Turn off all displays
        if (button == 1)
        begin
            disp_select = 4'b1111; 
        end
    end
        
endmodule