`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Luna
// 
// Create Date: 02/28/2023
// Design Name: Data Latching Circuit
// Module Name: d_flip_flop
// Target Devices: Basys 3 board
// Description: This module implements a D-flip-flop based data latching
//              circuit using an 8-bit input. It outputs the decimal equivalent
//              on the four 7-segment displays.
// 
//////////////////////////////////////////////////////////////////////////////////

/*  
    It has three input ports: an 8-bit bus "D", a clock input "CLK", 
    and an enable input "EN".
    It has one output port: an 8-bit bus "ff_out".
    The 8-bit register "Q" is used to store the value of the input "D".
    Inside the always block, the value of "D" is transferred to "Q" on the 
    positive edge of the clock signal "CLK", but only if the enable input "EN" 
    is asserted.
    The output "ff_out" is simply a connection to the "Q" register. 
*/

module d_flip_flop(
        input [7:0] D,
        input EN,
        input CLK,
        output [7:0] ff_out
        );
   
   reg [7:0] Q;
    
   always @(posedge CLK)
   begin
        if (EN)
            begin
                Q <= D;
            end
    end

    assign ff_out = Q;
     
endmodule