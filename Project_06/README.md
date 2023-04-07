### Table of Contents

1. [Overview](#overview)
2. [Part A: Simple Data Latching and Display Circuit](#part-a-simple-data-latching-and-display-circuit)
3. [Part B: T Flip-Flop Based 4-Bit Counter](#part-b-t-flip-flop-based-4-bit-counter)
4. [Verification](#verification)

## Overview

In this project, a data latching and display circuit and a 4-bit counter were designed using D flip-flops and T flip-flops, respectively. The model is developed in Vivado 2022.2 using Verilog and on hardware using the Basys 3 FPGA board.

## Part A: Simple Data Latching and Display Circuit
In this part of the project, we use a 7-segment decoder to display the output of an 8-bit D flip-flop. The structural model of this circuit is shown below (**Figure 1**). The inputs to the circuit were an 8-bit bus, `SW`, mapped to the eight right-most switches on the board, an enable input, `BTN`, mapped to the left-most pushbutton, and a data clock, `CLK`, running at 100 MHz. From the 8-bit input, we can represent the 0-255 range of decimal values. When the left-most pushbutton is pressed, the flips flops latch the switch values. The outputs, `SEGMENT` and `DISP_SEL`, represent the cathodes and anodes associated with the four 7-segment displays. 

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_fig1_1.png" 
    width=50%    
    alt="Figure 1-1"/>
</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_fig1_2.png" 
    width=70%    
    alt="Figure 1-2"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. Structural model of data latching and display circuit: computer-drawn model (top) and Vivado-generated model (bottom).</p>

## Part B: T Flip-Flop Based 4-Bit Counter
In the second part of the project, a 4-bit counter was designed using T flip-flops. The structural model of the circuit is shown below (Figure 2). The circuit consists of four T flip-flops connected in series. The input to the first flip-flop, $T_0$, sets $Q_0=1$. Then, the input to the second flip-flop is the output of the first one, and so on, as shown. However, in addition to this, the output of the first flip-flop, $Q_0$, is “AND-ed" with the output of the second one, $Q_1$. Thus, $Q_0 \wedge Q_1$ is what we feed into the third flip-flop. The fourth flip-flop receives the input $Q_1 \wedge Q_2$. We also have pushbutton control from `BTN`. The circuit counts continually according to the set clock frequency except when the button is pressed. In that case, the count stops at the current value.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_fig2_1.png" 
    width=60%    
    alt="Figure 2-1"/>
</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_fig2_2.png" 
    width=85%    
    alt="Figure 2-2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. Structural model of 4-bit counter: computer-drawn model T flip-flop-based counter (top) and Vivado-generated model of overall system (bottom).</p>

## Verification

For the implementation of the data latching circuit, several input combinations were tested using the test table shown below (**Table 1**). We tested four different input combinations to verify whether we get the expected output. Flipping the eight right-most switches should display the corresponding decimal value on the 7-segment display. However, this should only occur if the left-most button, `BTN`, is pressed. If unpressed, the circuit latches to the last state or value.

<p align="center"><b><i>Table 1</i></b>. Test cases for comparator display module in Part A.</p>
<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_tab1.png" 
    width=45%    
    alt="Table 1"/>
</p>

For the 4-bit counter using flip-flops, we verified the model testing in a simulation using Vivado iSim and implemented on the board. We can see that the simulation behaves as we would expect. When the button is pressed, the count stops at the current value. We see this for the value of 0, 4, 6, 7, and 9. Notice that any changes occur when on the rising edge of the clock signal. For the rest of the cases, 1, 2, 3, 5, 8, we see that the counter advances every clock cycle.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/e03506722d00a823755e62c7c3d43a5cc400db31/Project_06/Images/lab06_fig3.png" 
    width=60%    
    alt="Figure 3"/>
</p>

<p align="center"><b><i>Figure 3</i></b>. iSim waveform output for 4-bit counter.</p>