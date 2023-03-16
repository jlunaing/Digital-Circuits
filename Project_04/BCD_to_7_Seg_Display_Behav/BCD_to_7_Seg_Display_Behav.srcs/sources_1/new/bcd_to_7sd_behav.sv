`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-09
  * Design Name: BCD to 7-Segment Decoder Behavioral Model
  * Module Name: bcd_to_7sd_behav
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
  *     This implementation uses pushbutton to control which
  *     display is on.
  */

module bcd_to_7sd_behav(
        // 4-bit BCD number
        input logic [3:0] bcd,     
        // 4-bits for 4 pushbutton control logic
        input logic [3:0] btn, 
        // 8-bits for 7 display segments and 1 decimal point
        output logic [7:0] segment,
        // 4-bits for selecting which of the displays to turn on
        // MSB is AN[3] and LSB is AN[0]
        output logic [3:0] disp_sel
        );
    
    // Map the BCD inputs to the corresponding 7-segment
    // outputs the always block
       
    // Control the display selection
    always @(btn)
    begin
        // If button 3 is pressed, the lit display include
        // hex letters A-F in the output.
        if (btn[3])
            case (bcd)
                // input              abcdefgdp
                4'b0000: segment = 8'b0000001_1; // 0
                4'b0001: segment = 8'b1001111_1; // 1
                4'b0010: segment = 8'b0010010_1; // 2
                4'b0011: segment = 8'b0000110_1; // 3
                4'b0100: segment = 8'b1001100_1; // 4
                4'b0101: segment = 8'b0100100_1; // 5
                4'b0110: segment = 8'b0100000_1; // 6
                4'b0111: segment = 8'b0001111_1; // 7
                4'b1000: segment = 8'b0000000_1; // 8
                4'b1001: segment = 8'b0000100_1; // 9
                4'b1010: segment = 8'b0001000_1; // A
                4'b1011: segment = 8'b1100000_1; // b
                4'b1100: segment = 8'b0110001_1; // C
                4'b1101: segment = 8'b1000010_1; // d
                4'b1110: segment = 8'b0110000_1; // E
                4'b1111: segment = 8'b0111000_1; // F
                // Turn off display when input BCD value
                // exceeds the range of decimal digits
                default: segment = 8'b1111111_1;
            endcase
        // If button 3 is NOT pressed, i.e., for all other
        // cases, the lit display only includes 0-9 numbers.
        else
            case (bcd)
                // input              abcdefgdp
                4'b0000: segment = 8'b0000001_1; // 0
                4'b0001: segment = 8'b1001111_1; // 1
                4'b0010: segment = 8'b0010010_1; // 2
                4'b0011: segment = 8'b0000110_1; // 3
                4'b0100: segment = 8'b1001100_1; // 4
                4'b0101: segment = 8'b0100100_1; // 5
                4'b0110: segment = 8'b0100000_1; // 6
                4'b0111: segment = 8'b0001111_1; // 7
                4'b1000: segment = 8'b0000000_1; // 8
                4'b1001: segment = 8'b0000100_1; // 9
                // Turn off display when input BCD value
                // exceeds the range of decimal digits
                default: segment = 8'b1111111_1;
            endcase
        end

    always @(*)
    begin 
        // Turn off all displays
        if (btn[2] == 1)
            disp_sel = 4'b1111; 
        // Turn right-most display only
        else if (btn[1] == 0 && btn[0] == 0)
            disp_sel = 4'b1110;
        // Turn on second-from-right display
        else if (btn[1] == 0 && btn[0] == 1)
            disp_sel = 4'b1101;
        // Turn on second-from-right display
        else if (btn[1] == 1 && btn[0] == 0)
            disp_sel = 4'b1011;
        // Turn left-most display only
        else if (btn[1] == 1 && btn[0] == 1)
            disp_sel = 4'b0111;    
    end
               
endmodule