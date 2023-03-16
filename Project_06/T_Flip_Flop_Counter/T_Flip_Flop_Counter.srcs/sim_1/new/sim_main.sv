`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 04:34:46 PM
// Design Name: 
// Module Name: sim_main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sim_main();
    
    // Declare inputs and outputs of the module under test
    // Modified default reg and wire types to logic.
    logic clk;
    logic btn;
    logic [3:0] disp;
    logic [7:0] sseg;
      
    // Device under test (DUT) must have a name matching that of the
    // module in the design source file
    main DUT(
            .clock(clk),
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
        // Toggle switch values to create input stimulus
        btn = 0;
        #10;
        btn = 1;
        #10;
        btn = 0;
        #10;
        
        // Verilog system task that tells simulator to terminate
        // current simulation
        $finish;
        // Display message
        $display("Simulation finished!");  
    end
endmodule
