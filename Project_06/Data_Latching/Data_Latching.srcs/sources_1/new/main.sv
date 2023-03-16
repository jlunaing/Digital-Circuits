`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Luna
// 
// Create Date: 02/28/2023
// Design Name: Data Latching Circuit
// Module Name: main
// Target Devices: Basys 3 board
// Description: This module implements a D-flip-flop based data latching
//              circuit using an 8-bit input. It outputs the decimal equivalent
//              on the four 7-segment displays.
// 
//////////////////////////////////////////////////////////////////////////////////

module main(
        input clock,
        // D flip-flop I/O
        input [7:0] SW,
        input BTN,
        // 7-segment display I/O
        output [3:0] disp_sel,
        output [7:0] seg
        );
        
        logic [7:0] ffout_segin;
        
        wire sign = 0;
        wire valid = 1;
    
    // Instantiate D flip-flop module
    d_flip_flop D_FF(.D(SW),
                     .EN(BTN),
                     .CLK(clock),
                     .ff_out(ffout_segin)
                     );
    // Instantiate 7-segment display module
    sseg_dec SEG_7(.ALU_VAL(ffout_segin),
                   .SIGN(sign),
                   .VALID(valid),
                   .CLK(clock),
                   .DISP_EN(disp_sel),
                   .SEGMENTS(seg)    
                   );
                    
endmodule
