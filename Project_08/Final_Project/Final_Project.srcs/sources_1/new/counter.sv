`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: Servo-Motor-Actuated Robotic Arm Project
  * Module Name: counter
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module converts the clock signal into a usable signal
  *		that the servo motor can use. Each servo motor needs a refresh
  *		rate to update its PWM level.
  */

module counter(
        input clr,
	    input clk,
	    output reg [19:0]count
        );

    // Run on the positive edge of the clock
	always @ (posedge clk)
	begin
	    // If the clear button is being pressed or the count
	    // value has been reached, set count to 0.
	    // This constant depends on the refresh rate required by the
	    // servo motor you are using. This creates a refresh rate
	    // of 10-ms. 
		
		// 100MHz/(1/10ms) or 
		//(system clock)/(1/(refresh rate)).
		if (clr == 1'b1 || count == 20'd1000000)
			begin
				count <= 20'b0;
			end
		// If clear is not being pressed and the count value
		// is not reached, continue to increment count. 
		else
			begin
				count <= count + 1'b1;
			end
	end
endmodule
