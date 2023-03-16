`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: TBD
  * Module Name: comparator
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains an implementation of...
  */

module comparator(
        input [19:0] A,
	    input [19:0] B,
	    output logic PWM
        );

	always @ (A,B)
	begin
        // If A is less than B, output is 1.
        if (A < B)
            begin
            PWM <= 1'b1;
            end
        // If A is greater than B, output is 0.
        else 
            begin
            PWM <= 1'b0;
            end
	end
endmodule