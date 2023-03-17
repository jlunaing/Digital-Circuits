`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: Servo-Motor-Actuated Robotic Arm Project
  * Module Name: sw_to_angle
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module mappes a switch on an FPGA board to a specific
  *     angle of rotation of the servo motor. 
  */
  
// Convert from switch value to angle
// Each switch provides a different angle in degrees, starting
// at 0, incrementing by 24 degrees each time. 
module sw_to_angle (
        input [3:0] sw,
        output logic [7:0] angle
        );
        
    // Run when the switch state changes
    always @ (sw)
    begin
        case (sw)
                  1: angle = 8'd24;      // Switch 0
                  2: angle = 8'd72;      // Switch 1
                  4: angle = 8'd120;     // Switch 2
                  8: angle = 8'd192;     // Switch 3
            default: angle = 8'd0;
        endcase                 
    end
    
endmodule

// Initially assumed 360-deg rotation
// This can replace the code above if servo motors have
// continuous rotation

//case (sw)
//    1:  angle = 9'd0;       // Switch 0
//    2:  angle = 9'd24;      // Switch 1
//    4:  angle = 9'd48;      // Switch 2
//    8:  angle = 9'd72;      // Switch 3
//    16: angle = 9'd96;      // Switch 4
//    32: angle = 9'd120;     // Switch 5
//    64: angle = 9'd144;     // Switch 6
//    128: angle = 9'd168;    // Switch 7
//    256: angle = 9'd192;    // Switch 8
//    512: angle = 9'd216;    // Switch 9
//    1024: angle = 9'd240;   // Switch 10
//    2048: angle = 9'd264;   // Switch 11
//    4096: angle = 9'd288;   // Switch 12
//    8192: angle = 9'd312;   // Switch 13
//    16384: angle = 9'd336;  // Switch 14
//    32768: angle = 9'd360;  // Switch 15
//    default: angle = 9'd0;
//endcase                
