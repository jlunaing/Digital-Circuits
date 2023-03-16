`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-16
  * Design Name: BCD Comparator Display Module
  * Module Name: bcd_comparator
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
  *     two numbers on the left-most 7-segment display.
  *     If the numbers are equal, no value is displayed.
  *
  *     This module makes use of a comparator and
  *     7-segment display modules.
  */
module bcd_comparator(
        // 4-bit BCD numbers
        input logic [3:0] A_bcd, B_bcd,
        // 8 bits for 7-segment display
        output logic [7:0] seg,
        // 1 bit for turning display on/off
        output logic [3:0] select
        );
        
    // 3 bits for comparator result
    logic [2:0] comp;

    // 4 bits for BCD to binary result
    //logic [3:0] A_bin;
    //logic [3:0] B_bin;
    
    // Instantiate BCD to binary converters for A and B
    //bcd_to_binary A_2_BIN(
    //.bcd_num(A_bcd),
    //.bin_num(A_bin)
    //);
        
    //bcd_to_binary B_2_BIN(
    //.bcd_num(B_bcd),
    //.bin_num(B_bin)
    //);
    
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
        .seg_out(seg),
        .disp_select(select)
        );
        
endmodule
