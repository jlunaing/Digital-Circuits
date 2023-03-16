`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-16
  * Design Name: BCD Comparator Display Module 2
  * Module Name: bcd_comparator_mod
  * Project Name: Project 5
  * Target Devices: Basys 3 board
  * Revision: 1
  * Dependencies:
        -> comparator.sv
        -> seg7_decoder.sv
  *
  * Description:
  *     This module contains an implementation of a BCD 
  *     comparator circuit. The inputs are two 4-bit BCD
  *     numbers and the circuit outputs the greater of
  *     two numbers on one of the 7-segment displays,
  *     depending on whether the input A or B is greater.
  *     If the numbers are equal, two displays are used
  *     to display the values. Additionally, if a button
  *     is pressed, then no numbers are displayed.
  *
  *     This module makes use of a comparator and
  *     7-segment display modules.
  */

module bcd_comparator_mod(
        // 4-bit BCD numbers
        input [3:0] A_bcd, B_bcd,
        // 1 bit for center pushbutton control
        input btn,
        // 8 bits for 7-segment display
        output logic [7:0] seg,
        // 1 bit for turning display on/off
        output logic [3:0] select
        );
        
    // 3 bits for comparator result
    logic [2:0] comp;
    
    // Instantiate comparator to determine greater value
    comparator COM_1(
        .A(A_bcd),
        .B(B_bcd),
        .result(comp)
        );
        
    // Instantiate 7-segment decoder for BCD output
    seg7_decoder DEC_1(
        .A(A_bcd),
        .B(B_bcd),
        .comp_result(comp),
        .button(btn),
        .seg_out(seg),
        .disp_select(select)
        );
        
endmodule
