`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Luna
// 
// Create Date: 02/28/2023
// Design Name: Data Latching Circuit Simulation
// Module Name: sim_main
// Target Devices: Basys 3 board
// Description: This module implements a D-flip-flop based data latching
//              circuit using an 8-bit input. It outputs the decimal equivalent
//              on the four 7-segment displays.
// 
//////////////////////////////////////////////////////////////////////////////////

module sim_main();
    
    // Declare inputs and outputs of the module under test
    // Modified default reg and wire types to logic.
    logic clk;
    logic [7:0] sw;
    logic btn;
    logic [3:0] disp;
    logic [7:0] sseg;
      
    // Device under test (DUT) must have a name matching that of the
    // module in the design source file
    main DUT (
            .clock(clk),
            .SW(sw),
            .BTN(btn),
            .disp_sel(disp),
            .seg(sseg)
            );  
    // Generate clock signal
    always
        begin
            clk = 0;
            #5;  // Delay for half a clock cycle
            clk = 1;
            #5;  // Delay for half a clock cycle
        end
        
    // Stimulus generation
    // Each initial block starts at time 0, in parallel.
    initial begin
        
        btn = 0;
        sw = 8'h00;
        #10
        sw = 8'h01;
        #10
        btn = 1;
        #10
        sw = 8'hFF;
        btn = 1;
        #10;
        sw = 8'hAA;
        btn = 0;
        #10;
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
        // Display message
        $display("Simulation finished!");  
    end
endmodule
