`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-02-16
  * Design Name: BCD to Binary Converter
  * Module Name: bcd_to_binary
  * Project Name: Project 5
  * Target Devices: Basys 3 board
  * Revision: 1
  *
  * Description:
  *
  *
  */

module bcd_to_binary(
        // 4-bit binary-coded decimal input
        input logic [3:0] bcd_num,
        // 4-bit binary output
        output logic [3:0] bin_num
        );
    
    always @ (*)
        begin
            case (bcd_num)
                4'b0000: bin_num = 4'b0000; // 0 -> 0000
                4'b0001: bin_num = 4'b0001; // 1 -> 0001
                4'b0010: bin_num = 4'b0010; // 2 -> 0010
                4'b0011: bin_num = 4'b0011; // 3 -> 0011
                4'b0100: bin_num = 4'b0100; // 4 -> 0100
                4'b0101: bin_num = 4'b0101; // 5 -> 0101
                4'b0110: bin_num = 4'b0110; // 6 -> 0110
                4'b0111: bin_num = 4'b0111; // 7 -> 0111
                4'b1000: bin_num = 4'b1000; // 8 -> 1000
                4'b1001: bin_num = 4'b1001; // 9 -> 1001
                
                // 4-bits represent one decimal digit,
                // so 0-9 are the only possible values
                4'b1010: bin_num = 4'b0000; // invalid BCD, treat as 0
                4'b1011: bin_num = 4'b0000; // invalid BCD, treat as 0
                4'b1100: bin_num = 4'b0000; // invalid BCD, treat as 0
                4'b1101: bin_num = 4'b0000; // invalid BCD, treat as 0
                4'b1110: bin_num = 4'b0000; // invalid BCD, treat as 0
                4'b1111: bin_num = 4'b0000; // invalid BCD, treat as 0
            endcase
        end

endmodule
