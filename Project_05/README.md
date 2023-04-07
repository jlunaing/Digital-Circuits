### Table of Contents

1. [Overview](#overview)
2. [Part A: Comparator Display Module](#part-a-comparator-display-module)
3. [Part B: Modified Comparator Display Module](#part-b-modified-comparator-display-module)
4. [Validation](#validation)

## Overview

In this project, a binary-coded decimal (BCD) comparator display module circuit is designed using structural modeling. The model is developed in Vivado 2022.2 using Verilog and on hardware using the Basys 3 FPGA board.

## Part A: Comparator Display Module
Using block-level design and structural modeling, we build a circuit that takes two 4-bit BCD numbers as inputs and outputs the greater of these two numbers on the left-most 7-segment display. If the two number are equal, the display is blank. The structural model of this circuit is shown below (**Figure 1**). The hand-sketched and Vivado’s RTL-generated models are shown.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig1_1.png" 
    width=60%    
    alt="Figure 1-1"/>
</p>
<br/>
<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig1_2.png" 
    width=60%    
    alt="Figure 1-2"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. Structural model of BCD comparator display module: hand-drawn model (top) and Vivado-generated model (bottom).</p>

The inputs $A$ and $B$ are mapped to the left-most and right-most switches, respectively. The output of the comparator is mapped to the 7-segment display on the far left. In code, the comparator and 7-segment display modules developed previously were repurposed and implemented in the design.

## Part B: Modified Comparator Display Module
The BCD comparator display circuit implemented in Part A is redesigned to incorporate additional behavior. The inputs and their respective mapping are unchanged but the output is now different. If the two numbers are equal, the two middle 7-segment displays are turned on. If $A > B$, the left-most display is on and, if $A < B$, the right-most display is on. If the button in the center is pressed, all displays are off regardless of values. The structural model of this circuit is shown below (**Figure 2**).

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig2_1.png" 
    width=60%    
    alt="Figure 2-1"/>
</p>
<br/>
<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig2_2.png" 
    width=60%    
    alt="Figure 2-2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. Structural model of modified BCD comparator display module: hand-drawn model (top) and Vivado-generated model (bottom).</p>

## Validation

For the implementation of the BCD comparator design, several input combinations were tested using the test table shown below for the module in Part A (**Table 1**) and that of Part B (**Table 2**). For the implementation of the module in Part A, we test five different input combinations to verify whether we get the expected output. If there is a greater number, we want to check that this number is display on the 7-segment display. If both numbers are equal, we should see no number displayed.

Likewise, for the module in Part B, we also perform five tests and check that there is correct mapping of inputs and outputs. We can use the same test cases from before and simply check that the additional behavior from this module is what we expect. If there is a greater number, we should see only one display showing the number. If $A > B$, the left-most display should be on and if $A < B$, the right-most display should light up instead. If both numbers are equal, only the two displays in the middle should be on, showing matching numbers. The four displays are labeled $AN0$ (right-most digit) through $AN3$ (left-most digit).

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig2_1.png" 
    width=60%    
    alt="Table 1"/>
</p>
<p align="center"><b><i>Table 1</i></b>. Test cases for comparator display module in Part A.</p>

<br/>
<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/b0692f711d9a919ff92cf1cb2e4a635d347e12e1/Project_05/Images/lab05_fig2_2.png" 
    width=60%    
    alt="Table 2"/>
</p>

<p align="center"><b><i>Table 2</i></b>. Test cases for comparator display module in Part B.</p>

The circuits for Part A and B were also implemented on the board, which is shown in the demo videos (Videos [**A**](https://youtube.com/shorts/pcqcjTGBZlI?feature=share), [**B**](https://youtube.com/shorts/v4brYXB3iRE?feature=share))