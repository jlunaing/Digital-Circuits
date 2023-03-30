### Table of Contents

1. [Overview](#overview)
2. [4-Bit Ripple Carry Adder](#4-bit-ripple-carry-adder)
3. [4-Bit Comparator](#4-bit-comparator)
4. [Verification](#verification)

## Overview

In this project, a 4-bit ripple carry adder circuit is developed using structural modeling for the implementation. In addition, a 4-bit comparator is designed and implemented using behavioral modeling. Both circuits are designed, implemented, and simulated in Vivado 2022.2 using Verilog and on hardware using the Basys 3 FPGA board.

## 4-Bit Ripple Carry Adder

A 4-bit ripple carry adder (RCA) is a circuit that performs the arithmetic sum of two 4-bit binary numbers and provides the 4-bit resulting sum and a single-bit carry-out as outputs. A way to construct the 4-bit RCA is to have one half adder and three full adder circuits in a cascade configuration as shown below (**Figure 1**). The design is modular and iterative in that we make use of previously designed modules that are placed in a repetitive manner. The highest index in the structural model, 3, is associated with the most significant bit (MSB) and the lowest index, 0, corresponds to the least significant bit (LSB).

<p align="center">
    <img src="" 
    width=50%    
    alt="Figure 1"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. Structural model of the 4-bit ripple carry adder.</p>

## 4-Bit Comparator

A 4-bit comparator is a circuit that compares two 4-bit binary numbers, A and B, and determines whether the numbers are equal (*EQ*) or if the first value, A, is greater than (*GT*) or less than (*LT*) the second value, B. This time, we design the circuit using a behavioral description. This means that instead of defining the circuit at the gate-level or with Boolean equations, we describe how the circuit should “behave”. In Verilog, we accomplish this using procedural programming using if-else statements inside `always` blocks. 

## Verification

In the implementation of the 4-bit RCA, four input combinations from were simulated using Vivado iSim and implemented on the board (**[demo video](https://youtube.com/shorts/ikTKDpd7sPg?feature=share)**). The waveform output is shown below (**Figure 2**). The RCA performs arithmetic addition, so we can validate the model by simply evaluating that the input combination generates the correct output. We see that when $A=1$ and $B=2$, the sum is 3 and there is no carry-out ($cout=0$). Likewise, when $A$ and $B$ are both $1111$ ($F$ or $15$) the sum is $1110$ ($E$ or $14$) with a carry-out $cout=1$.

<p align="center">
    <img src="" 
    width=90%    
    alt="Figure 2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. iSim waveform output for 4-bit ripple carry adder.</p>

For the 4-bit comparator implementation, four test cases were simulated in Vivado (**Figure 3**) and implemented on the board (**[demo video](https://youtube.com/shorts/QEeE-qLEZpg?feature=share)**). We can see that all tests match the expected output. For instance, inputs $A=0010$ $(2)$ and $B=0010$ $(2)$ have a high or TRUE value for the equal (*EQ*) output. Likewise, at $t=40 ns$, we see that when $A=4$ and $B=8$, the less than (*LT*) output is true and correctly represents $A<B$. Additionally, note that all cases only have one true output—e.g., cannot have less than and greater than at the same time—further validating the model.

<p align="center">
    <img src="" 
    width=90%    
    alt="Figure 3"/>
</p>

<p align="center"><b><i>Figure 3</i></b>. iSim waveform output for 4-bit comparator.</p>