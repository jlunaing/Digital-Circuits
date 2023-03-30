### Table of Contents

1. [Overview](#overview)
2. [7-Segment Display](#7-segment-display)
3. [Modeling](#modeling)
4. [Validation](#validation)

## Overview

In this project, a binary-coded decimal (BCD) to 7-segment display decoder circuit is designed using behavioral modeling. The model is implemented and simulated in Vivado 2022.2 using Verilog and on hardware using the Basys 3 FPGA board.

## 7-Segment Display

The Basys 3 board contains a four-digit, seven-segment LED display. Each digit consists of seven, LED-embedded segments and a decimal point. Each of the segments can be illuminated to create patterns. This can be used to display the full set of decimal numbers 0-9 and many alphabetic characters. 
For each digit, the cathodes of the seven segments are connected into seven circuit nodes labeled *CA* through *CG*. All segments have a common anode AN (**Figure 1**). To illuminate a segment with the FPGA board, the *AN* and *A*-*G*/*DP* signals are driven low when active.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/f39cca0f8fde76f07fd8ee54d754db8e91041dcb/Project_04/Images/lab04_fig1.png" 
    width=50%    
    alt="Figure 1"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. 7-segment display common anode circuit node.</p>

## Modeling

The BCD to 7-segment display decoder circuit was designed using a behavioral description. Instead of defining the circuit at the gate-level or with Boolean equations, we describe how the circuit should behave. In Verilog, we accomplish this using procedural programming using `case` and `if-else` statements inside `always` blocks. 

The input to the circuit is a 4-bit BCD number and the outputs are the segments, plus the decimal point, of the display. We can model this as an 8-bit segment output. The truth table for the input-output relationship between the BCD input and segment display output is shown below in tabular form (**Table 1**). Based on **Figure 1**, we can map each of the segment “bits” to the letters *A*-*G* and *DP*. In this implementation, the MSB is segment “A” and the LSB is “DP” or the decimal point.
In addition, we use pushbuttons to select which digits are on. We can implement this as a 2-bit pushbutton “control” input and a 4-bit selection output. The possible combinations of the *BTNL* and *BTNR* buttons determine which of the four displays are on. The associated logic is shown in a truth table (**Table 2**). The four displays are *AN0* (right-most digit) through *AN3* (left-most digit).

An additional control implementation is associated with the top and center pushbuttons, *BTNU* and *BTNC*, respectively. When *BTNU* is pressed, the output shown are all 4-bit hex characters (0-9, A-F). If *BTNU* is not pressed, the display only shows 0-9 numbers. Lastly, when *BTNC* is pressed, all displays are off.

<p align="center"><b><i>Table 1</i></b>. Truth table for BCD to 7-segment display decoder.</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/f39cca0f8fde76f07fd8ee54d754db8e91041dcb/Project_04/Images/lab04_tab1.png" 
    width=40%    
    alt="Table 1"/>
</p>

<p align="center"><b><i>Table 2</i></b>. Truth table for input-output relationship between pushbuttons 
and active 7-segment display.</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/f39cca0f8fde76f07fd8ee54d754db8e91041dcb/Project_04/Images/lab04_tab2.png" 
    width=40%    
    alt="Table 2"/>
</p>

## Validation

In the implementation of the decoder, all BCD input combinations from were simulated using Vivado iSim and implemented on the board. The waveform output is shown below (**Figure 2**). It shows correct mapping between the 4-bit BCD input and the 8-bit output representing which segments are turned on. We can verify that the characters 0-9 and A-F are correctly represented if we compared each segment output value with **Figure 1**. For instance, the number zero requires all segments other than *G* and the decimal point to be turned on. Because the signals for the segments need to be driven low when active, we see that segments *A* through *F* are low while *G* and *DP* are high, as expected.
The full implementation with pushbutton display control is shown in a **[demo video](https://youtube.com/shorts/zLPAcbXOkKQ?feature=share)**. 

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/f39cca0f8fde76f07fd8ee54d754db8e91041dcb/Project_04/Images/lab04_fig2.png" 
    width=90%    
    alt="Figure 2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. iSim waveform output for BCD to 7-segment display decoder.</p>