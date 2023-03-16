`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-03-02
  * Design Name: Sequence Detector
  * Module Name: seq_detector
  * Project Name: Project 7
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *
  */

module seq_detector(
        input CLK, X, BTN,
        output Z
        );
        
    typedef enum logic [2:0] {START, r_0, r_01, r_011, r_0110, r_0111, r_011X0, r_011X01} state_type;
    state_type state, next_state;
    
    always_ff @ (posedge CLK)
    state <= next_state;
    
    always_comb
        begin
            next_state = START;
            Z = 0;
            case(state)
                START:      if(!X) next_state = r_0;
                
                r_0:        if(X) next_state = r_01;
                            else next_state = r_0;
                            
                r_01:       if(X) next_state = r_011;
                            else next_state = r_0;
                            
                r_011:      case({BTN, X})
                                2'b00: next_state = r_0110;
                                2'b01: next_state = START;
                                2'b10: next_state = r_0;
                                2'b11: next_state = r_0111;
                                default: next_state = START;
                            endcase
                                
                r_0110:     if(X) next_state = r_011X0;
                            else next_state = START;
                            
                r_0111:     if(X) next_state = r_011X0;
                            else next_state = START;
                            
                r_011X0:    if(X) next_state = r_011X01;
                            else next_state = r_0;
                            
                r_011X01:   if(X) next_state = r_0;
                            else Z = 1;
                            
                default:    next_state = START;        
            endcase
        end    
endmodule
