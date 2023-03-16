`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-02
  * Design Name: FSM 3-Bit Counter
  * Module Name: fsm_counter
  * Project Name: Project 7
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *
  */
  
module fsm_counter(
            input CLK,
            input EN,
            output [2:0] CNT
            );
            
    logic [2:0] state = 0, next_state;
    logic [2:0] upstate = 0;
    assign CNT = state;
    
    always_ff @ (posedge CLK)
        if (EN)
            state <= next_state;    // state register
    
    always_comb 
        begin
            case(state)
                0: next_state = 2;
                2: next_state = 4;
                4: next_state = 5;
                5: next_state = 7;
                7: next_state = 0;
                default: next_state = 0;
            endcase
        end
    
endmodule
