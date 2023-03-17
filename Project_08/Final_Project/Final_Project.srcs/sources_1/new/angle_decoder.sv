`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: Servo-Motor-Actuated Robotic Arm Project
  * Module Name: angle_decoder
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module converts the target servo angle (set by the switch)
  *     into a value that will be compared against the update frequency
  *     to set the pulse-width modulated signal
  */
  
  module angle_decoder(
        input [8:0] angle,
        output logic [19:0] value
        );
    
    always @ (angle)
    begin
        // The servo angle gets converted to a constant value.
        // This equation depends on the servo motor used 
        // Equation determined through iterative trial and error 
        // using 0 and 180 as reference points. 
        value = (10'd944)*(angle) + 16'd50000;
    end
    
endmodule