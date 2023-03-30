### Table of Contents
1. [Overview](#overview)
2. [Full Adder: Reduced Form](#full-adder-reduced-form)
3. [Implementing Function Forms](#implementing-function-forms)
4. [Verification](#verification)

## Overview

In this project, the full adder circuit developed previously is redesigned in its reduced SOP form, using a Karnaugh Map, and the expression is further reduced using XOR gates. In addition, we analyze the behavior of a circuit given its bitstream file configured on the FPGA board and derive its truth table and reduced logical equation. From this expression, the NAND/NAND and NOR/NOR forms are derived, implemented, and simulated in Vivado 2022.2 using Verilog and on hardware using the Basys 3 FPGA board.

## Full Adder: Reduced Form

The full adder (FA) performs the addition operation on bits. It takes three bits—*OP_A* and *OP_B*, associated with the addition, and *Cin*, the carry-in bit. The outputs are the sum, *SUM*, and its carry-out, *CO*. The reduced SOP forms for both the *SUM* and *CO* outputs, derived from the corresponding Karnaugh maps, are shown below. Note that in the expression, *Cin* is expressed as $c$.

$$SUM=a(\overline{b}\overline{c}+bc)+ a(\overline{b}c+b\overline{c})$$

$$CO=ab+ac+bc$$

Using XOR logic, we can further reduce the SUM output expression:

$$SUM=a(\overline{b}\overline{c}+bc)+ \overline{a}(\overline{b}c+b\overline{c})$$

$$SUM=a(\overline{b \oplus c}) + \overline{a}(b \oplus c)$$

$$SUM=a\oplus(b \oplus c)$$

The final circuit diagram for the full adder in reduced form is shown below (**Figure 1**). Notice that the schematic from Vivado uses only two inputs for each gate. If we let the OR gate from the CO expression take three inputs, we reduce the number of gates. In either diagram, we see that reducing the FA expressions translates into having fewer of gates than the non-reduced forms.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/12d4babf750c649477057c2c2f7e644db12dbd74/Project_02/Images/lab02_fig1.png" 
    width=60%    
    alt="Figure 1"/>
</p>

<p align="center"><b><i>Figure 1</i></b>. Circuit schematic for the full adder circuit in reduced form.</p>

## Implementing Function Forms

A bitstream file `function_forms.bit` containing an implementation of a function F is implemented on the board. Its behavior is analyzed and synthesized in a truth table (**Table 1**). Using K-maps, we derive the reduced SOP expression and convert the resulting circuit into 2-level NAND and 2-level NOR functions. The NAND/NAND and NOR/NOR expressions and schematic are shown below (**Figure 2**).

<p align="center"><b><i>Table 1</i></b>. Truth table of function F given as a <code>.bit</code> file.</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/12d4babf750c649477057c2c2f7e644db12dbd74/Project_02/Images/lab02_tab1.png" 
    width=40%    
    alt="Table 1"/>
</p>

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/12d4babf750c649477057c2c2f7e644db12dbd74/Project_02/Images/lab02_fig2.png" 
    width=60%    
    alt="Figure 2"/>
</p>

<p align="center"><b><i>Figure 2</i></b>. Combined NAND/NAND and NOR/NOR circuit schematic for function.</p>

## Verification 

For the full-adder implementation, all input combinations from the truth table were simulated using Vivado iSim. The waveform output is shown below (**Figure 3**). Notice that the waveform is a square wave with a “low” value for a logical 0 and a “high” value for a logical 1.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/12d4babf750c649477057c2c2f7e644db12dbd74/Project_02/Images/lab02_fig3.png" 
    width=90%    
    alt="Figure 3"/>
</p>

<p align="center"><b><i>Figure 3</i></b>. iSim waveform output for full adder circuit.</p>

For the function F expressed in NAND/NAND and NOR/NOR forms, eight cases—i.e., the combinations with indexes 0, 1, 4, 5, 8, 9, 12, and 13—from the truth table (**Table 1**) were simulated (**Figure 4**) and on the board. 

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/12d4babf750c649477057c2c2f7e644db12dbd74/Project_02/Images/lab02_fig4.png" 
    width=90%    
    alt="Figure 4"/>
</p>

<p align="center"><b><i>Figure 4</i></b>. iSim waveform output for unknown circuit.</p>

As we see from the simulation output, all input combinations result in the correct output for the full adder and the function F. This can be verified with the truth tables.