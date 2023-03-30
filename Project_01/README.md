## Contents
- [Contents](#contents)
- [Overview](#overview)
- [Half Adder](#half-adder)
- [Full Adder](#full-adder)
- [Verification](#verification)

## Overview

Designing circuits that perform arithmetic operations is a common steps in 
digital design. The half adder, or HA, is a basic digital circuits. The HA adds 
two bits and outputs the result of the addition (the sum) and a bit that 
indicates whether the operation generated a carry out (CO).

The half adder lacks the ability to handle a carry-in input. Thus, the next
step is to build the full adder, or FA, is essentially a half adder with a 
carry-in input. The outputs of FA are the same as the outputs of the HA.

In this project, we designed, implemented, and tested the half-adder (HA) and 
full-adder (FA) circuits in simulation, using Verilog in the Vivado 2022.2 
software and on hardware using the Basys 3 FPGA board.

## Half Adder

The half adder (HA) is digital circuit that performs the mathematical addition
operation. It takes two bits, *OP_A* and *OP_B* in this project, as inputs and 
outputs two bits—the resulting sum, *SUM* and a carry-out bit, *CO*. A black-box 
diagram model and gate-level schematic of the half adder is shown below (**Figure 1-2**).

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 1"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. Black-box model for the half adder circuit.</p>

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. Gate-level schematic for the half adder circuit.</p>

## Full Adder

While the HA outputs both a sum and a carry, it does not do anything meaningful with the carry. It only adds the current inputs as 1-bit numbers and does not focus on the previous inputs. Thus, a HA cannot generate a result greater than one bit, or two bits, if the carry is included as part of the sum. The full adder (FA) provides a provision for the carry from one HA as an input to another HA. Therefore, a FA can carry the current inputs as well as the output from a previous addition. 
This circuit adds three bits—two bits associated with the addition operation, *OP_A*, and *OP_B*, while a third bit is a “carry-in” bit, *Cin*. The outputs of the circuit are identical to the HA, a sum and a carry-out bit, *SUM* and *CO*, respectively. 
A black-box and gate-level schematic diagram model of the full adder (**Figure 3-4**).

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 3"/>
</p>

<p align="center"><b><i>Figure 3</i></b>. Black-box model for the full adder circuit.</p>

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 4"/>
</p>

<p align="center"><b><i>Figure 4</i></b>. Gate-level schematic for the full adder circuit.</p>

For this part of the project, the sum and carry-out bits are represented in both sum-of-products (SOP) and product-of-sums (POS) forms. Using the truth table (Table 2), these forms were derived and are shown below. These two Boolean equations are functionally equivalent, and that is verified in the next section.

$$SUM(SOP)=\overline{a}\overline{b}c + \overline{a} b \overline{c} + a \overline{b} \overline{c} + a b c$$
$$CO(SOP)=\overline{a}bc + a\overline{b}c + ab\overline{c} + abc$$
$$SUM(POS)=(a+b+c)(a+\overline{b}+\overline{c})(\overline{a}+b+\overline{c})(\overline{a}+\overline{b}+c)$$
$$CO(POS)=(a+b+c)(a+b+\overline{c})(a+\overline{b}+c)(\overline{a}+b+c)$$

## Verification

For the half-adder implementation, all input combinations were tested through simulation in Vivado iSim. The waveform output is shown below (**Figure 5**). Notice that the waveform is a square wave with a “low” value for a logical 0 and a “high” value for a logical 1. For the full-adder circuit, all eight cases from the truth table (Table 2) were test in simulation (**Figure 6**) and on the board. 

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 5"/>
</p>

<p align="center"><b><i>Figure 5</i></b>. iSim waveform output for half adder circuit.</p>

<p align="center">
    <img src="" 
    width=40%    
    alt="Figure 6"/>
</p>

<p align="center"><b><i>Figure 6</i></b>. iSim waveform output for full adder circuit.</p>