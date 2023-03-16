`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Luna
// 
// Create Date: 02/28/2023
// Design Name: T Flip-Flop-Based 4-Bit Counter
// Module Name: main
// Target Devices: Basys 3 board
// Description: This module implements a T-flip-flop based 4-bit counter
//              It outputs the decimal equivalent on the four 7-segment displays.
// 
//////////////////////////////////////////////////////////////////////////////////

module main(
        input clock,
        input BTN,
        // 7-segment display I/O
        output [3:0] disp_sel,
        output [7:0] seg
        );
        
        logic [3:0] tffout;
        
        wire sign = 0;
        wire valid = 1;
        
    
    // Instantiate T flip-flop modules
    t_flip_flop T0 (.T(1),
                    .EN(BTN),
                    .CLK(clock),
                    .ff_out(tffout[0])
                     );
                     
    t_flip_flop T1 (.T(tffout[0]),
                    .EN(BTN),
                    .CLK(clock),
                    .ff_out(tffout[1])
                     );
                     
    t_flip_flop T2 (.T(tffout[0] & tffout[1]),
                    .EN(BTN),
                    .CLK(clock),
                    .ff_out(tffout[2])
                     );
                     
    t_flip_flop T3 (.T(tffout[1] & tffout[2]),
                    .EN(BTN),
                    .CLK(clock),
                    .ff_out(tffout[3])
                     );
    
    // Instantiate 7-segment display module
    sseg_dec SEG_7(.ALU_VAL(ffout),
                   .SIGN(sign),
                   .VALID(valid),
                   .CLK(clock),
                   .DISP_EN(disp_sel),
                   .SEGMENTS(seg)    
                   );
                    
endmodule