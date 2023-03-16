`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: TBD
  * Module Name: angle_decoder
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of...
  */
  
  module angle_decoder(
        input [8:0] angle,
        output logic [19:0] value
        );
    
    always @ (angle)
    begin
        // The servo angle gets converted to a constant value.
        // This equation depends on the servo motor you are 
        // using. Equation determined through iterative
        // trial and error using 0 and 360 as reference points. 
        value = (10'd944)*(angle) + 16'd60000;
    end
    
endmodule