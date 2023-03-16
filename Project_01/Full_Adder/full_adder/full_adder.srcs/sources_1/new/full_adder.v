`timescale 1ns / 1ps
/**
  * Engineer: Juan Luna
  *  
  * Create Date: 2023-01-19
  * Design Name: Full Adder Circuit
  * Module Name: full_adder
  * Project Name: Project 1
  * Target Devices: Basys 3 board
  * Tool Versions: 
  * Description: 
  *     A 3-bit adder, 2 bits associated with addition operation
  *     and a third bit as a "carry-in" bit. The outputs are a sum
  *     and a "carry-out" bit. SOP and POS forms for the outputs
  *     are included, proving functional equivalence.
  * 
  * Dependencies: N/A
  * 
  * Revision: 1
  * Revision 0.01 - File Created
  * Additional Comments: N/A
  */

module full_adder(
    input OP_A,
    input OP_B,
    input Cin,
    output SUM_SOP,
    output SUM_POS,
    output CO_SOP,
    output CO_POS
    );
    
    // SOP expression for sum operation
    assign SUM_SOP =  (~OP_A & ~OP_B &  Cin) 
                    | (~OP_A &  OP_B & ~Cin)
                    | ( OP_A & ~OP_B & ~Cin) 
                    | ( OP_A &  OP_B &  Cin);
    
    // POS expression for sum operation
    assign SUM_POS =  ( OP_A |  OP_B |  Cin)
                    & ( OP_A | ~OP_B | ~Cin)
                    & (~OP_A |  OP_B | ~Cin)
                    & (~OP_A | ~OP_B |  Cin);
    
    // SOP expression for carry-out
    assign CO_SOP =  (~OP_A &  OP_B &  Cin) 
                   | ( OP_A & ~OP_B &  Cin)
                   | ( OP_A &  OP_B & ~Cin) 
                   | ( OP_A &  OP_B &  Cin);

    // POS expression for carry-out 
    assign CO_POS =  ( OP_A |  OP_B |  Cin)
                   & ( OP_A |  OP_B | ~Cin)
                   & ( OP_A | ~OP_B |  Cin)
                   & (~OP_A |  OP_B |  Cin);
    
endmodule