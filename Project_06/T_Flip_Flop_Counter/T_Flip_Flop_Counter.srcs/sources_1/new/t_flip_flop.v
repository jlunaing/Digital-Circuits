`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Luna
// 
// Create Date: 02/28/2023
// Design Name: T Flip-Flop-Based 4-Bit Counter
// Module Name: t_flip_flop
// Target Devices: Basys 3 board
// Description: This module implements a T-flip-flop based 4-bit counter
//              It outputs the decimal equivalent on the four 7-segment displays.
// 
//////////////////////////////////////////////////////////////////////////////////
/*  
    It has three input ports: an 8-bit bus "D", a clock input "CLK", and an enable input "EN".
    It has one output port: an 8-bit bus "ff_out".
    The 8-bit register "Q" is used to store the value of the input "D".
    Inside the always block, the value of "D" is transferred to "Q" on the positive edge of the clock signal "CLK", but only if the enable input "EN" is asserted.
    The output "ff_out" is simply a connection to the "Q" register. 
*/

/* T flip-flop excitation table
 *      Q(n) Q(n+1)  T
 *       0     0     0
 *       0     1     1
 *       1     0     1
 *       1     1     0
 */ 
module t_flip_flop(
        input T, 
        input EN,
        input CLK,
        output ff_out
        );
   
   reg [1:0] cnt_dig;     
   clk_div_fs clk(.clk(CLK),
	              .sclk(sclk)
	              ); 
    // Advance the count (used for display multiplexing)
   always @ (posedge sclk)
   begin
         cnt_dig <= cnt_dig + 1; 
   end
   
   reg Q = 1'b0;
    
   always @(posedge CLK)
   begin
        if(EN && T)
            begin
            Q <= ~Q;
            end
   
//        if (EN)
//            begin
//                if (T) // T = 1
//                    begin
//                    Q <= ~Q; // toggle value
//                    end
//                else // T = 0
//                    begin
//                        Q <= Q; // keep current value
//                    end
           
//        else
//            begin
//            Q <= Q;
//            end
        
    end

    assign ff_out = Q;
     
endmodule

// Clock divider module
module clk_div_fs (input clk,
                   output sclk
                   );

    integer MAX_COUNT = 2200000; 
    integer div_cnt =0;
    reg tmp_clk=0; 

    always @ (posedge clk)              
    begin
         if (div_cnt == MAX_COUNT) 
         begin
            tmp_clk = ~tmp_clk; 
            div_cnt = 0;
         end else
            div_cnt = div_cnt + 1;  
    end 
    
    assign sclk = tmp_clk; 
    
endmodule