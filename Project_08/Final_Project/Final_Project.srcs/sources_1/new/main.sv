`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-10
  * Design Name: Servo-Motor-Actuated Robotic Arm Project
  * Module Name: main
  * Project Name: Final Project
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *     This module contains the main script for the
  *     implementation a 3-servomotor robotic arm actuated
  *     by switches on the board.
  */

module main (
        input [11:0] sw,
        input clr,
        input clk,
        output PWM1,
        output PWM2,
        output PWM3
        );
    
    logic [19:0] A_net;
    logic [19:0] value_sw1, value_sw2, value_sw3;
    logic [7:0] angle_sw1, angle_sw2, angle_sw3;
    
    // Convert incoming switch value to an angle
    sw_to_angle SW2SERVO1(.sw(sw[3:0]),
                          .angle(angle_sw1)
                          );
                  
    sw_to_angle SW2SERVO2(.sw(sw[7:4]),
                          .angle(angle_sw2)
                          );
                         
    sw_to_angle SW2SERVO3(.sw(sw[11:8]),
                          .angle(angle_sw3)
                          );
    
    // Convert servo angle to value needed for PWM
    angle_decoder DEC1(.angle(angle_sw1),
                       .value(value_sw1)
                       );
                      
    angle_decoder DEC2(.angle(angle_sw2),
                       .value(value_sw2)
                       );
                   
    angle_decoder DEC3(.angle(angle_sw3),
                       .value(value_sw3)
                       );         
    
    // Compare the count value from counter with constant value
    // set by switches.
    comparator COMP1(.A(A_net),
                    .B(value_sw1),
                    .PWM(PWM1)
                    );
                    
    comparator COMP2(.A(A_net),
                    .B(value_sw2),
                    .PWM(PWM2)
                    );
                    
    comparator COMP3(.A(A_net),
                    .B(value_sw3),
                    .PWM(PWM3)
                    );                  
    // Counts up to a certain value and then resets.
    // This creates the refresh rate of 20 ms.   
    counter CTN(
               .clr(clr),
               .clk(clk),
               .count(A_net)
               );
        
endmodule