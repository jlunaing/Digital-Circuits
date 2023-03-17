# Servomotor-Actuated Robotic Arm

This project uses the Basys 3 FPGA board to control three servo motors that make up
a robotic arm system.

### Table of Contents
- [Servomotor-Actuated Robotic Arm](#servomotor-actuated-robotic-arm)
    - [Table of Contents](#table-of-contents)
  - [Testing Demo](#testing-demo)
  - [Background](#background)
  - [System Overview](#system-overview)
    - [An Overview of Servo Motors](#an-overview-of-servo-motors)
    - [Interfacing with the Servo Motor](#interfacing-with-the-servo-motor)
    - [Schematic Diagram](#schematic-diagram)
  - [Components and Assembly](#components-and-assembly)
  - [Results and Final Remarks](#results-and-final-remarks)


## Testing Demo

Here is a video showing the system in action!  

<p align="center">
    <a href="https://youtube.com/shorts/qI1xIHtNqUA?feature=share" target="_blank">
    <img src="https://i.ytimg.com/vi/qI1xIHtNqUA/hq2.jpg?sqp=-oaymwEoCOADEOgC8quKqQMcGADwAQH4Ac4FgAKACooCDAgAEAEYciBVKCkwDw==&rs=AOn4CLDZ8I8Ya3cPY6Vq__X0pjdkqKl_RQ" 
    alt="Robotic arm test video!" 
    width=70%
    border="10" />
    </a>
</p>

## Background 

Robotic arms are widely used in many industries for automation and precise 
movement of objects. They have a variety of applications, such as 
pick-and-place operations in factories, PCB component placement (shown below), 
and medical surgeries. The use of servo motors is an efficient and fairly 
precise way to control the motion of robotic arms. Servo motors are designed 
to rotate to a specific angle and hold their position precisely, making them
a good choice for controlling robotic arms.

## System Overview

The project focuses on servo motor control using the Basys 3 board. The
system, as a whole, works like a simple pick-and-place machine in which you have
3 servo motors actuating a series of linkages. One of the servo motors is 
connected to a gear mechanism that moves two links that can pick up objects.
The prototype used in the demo video is shown below.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/ced2aed072302a2a873ac1942163682495c2b3e9/Project_08/Images/prototype.jpg" 
    width=40%    
    alt="Robotic arm prototype"/>
</p>

The design and testing of the digital system was developed in Vivado using 
SystemVerilog. You can access the code in the 
[source code](Final_Project/Final_Project.srcs/sources_1/new).

In order to design modules to interact with a servo motor, we first need to 
understand some of the basics of this type of motor.

### An Overview of Servo Motors

Servo motors are controlled by sending eletrical signals in the form of pulses 
of variable width. This is also known as pulse-width modulation (PWM). The PWM 
signal is a square wave that switches between high and low states at a fixed 
frequency. The width of the pulse, or the time the signal is high, determines 
the position of the servo shaft. When a controller device (like the FPGA in 
this project) sends a command for the servo to move, it will move to the target 
position and hold that position. For instance, a shorter pulse of 1 ms can be 
translated into a small rotation of the shaft while a 2-ms pulse would 
correspond to a larger degree of rotation.

### Interfacing with the Servo Motor

To servo motor needs needs a frequency at which its shaft position is updated.
This is the refresh or update rate. In code, a `counter()` module sets this 
frequency, based on the input clock frequency, that the servo motor uses. The 
specific frequency depends of the servo motor specifications. For this specific 
micro servo, a 10-ms refresh rate was used during testing and a reasonable
performance was observed. This module also has a `count` variable that is later 
used to set the PWM signal either high or low. 

We also need to specify a desired angle of rotation and convert this to a PWM 
signal. A desired angle of rotation is mapped to a switch on the board. This is 
programmed into the `sw_to_angle()` module. For the demo, a set of 4 angles in 
the range 0-180-deg were each linked to one switch. Since 3 servo motors are
used, 12 switches were used in total.

The `angle_decoder()` module takes the angle defined in `sw_to_angle()` and 
converts it to the appropriate duty cycle. To accomplish this, a linear 
equation was developed by taking two points, 0 and 180, and iteratively finding
the slope and intercept values for the PWM signal that would generate the 
desired 0 and 180-deg rotations.

A `comparator()` module takes the `count` from `counter()` and output from the
`angle_decoder()` and compare both values. If the count value is greater than
the output value of the counter, then the signal is interpreted as high. 
Otherwise, the signal is low. This sets the desired PWM signal.

### Schematic Diagram

A circuit schematic that illustrates this is shown below. The system takes a 
12-bit input form the switches. Each switch is mapped to a particular servo
motor. The output of the system is the specific PWM level that will move the 
servo motor to a set location.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/ced2aed072302a2a873ac1942163682495c2b3e9/Project_08/Images/circuit_schematic.png" alt="Circuit schematic"/>
</p>

The `SW_TO_ANGLE`, `ANGLE_DEC`, and `COMPARATOR` modules are instantiated once 
per each servo motor. Thus, including the `COUNTER`, there are 10 modules in 
total. All of these modules are under the top `main()` module.

<p align="center">
    <img src="https://github.com/jlunaing/Digital-Circuits/blob/ced2aed072302a2a873ac1942163682495c2b3e9/Project_08/Images/module_structure.png" 
    width=85%
    alt="Structure of modules"/>
</p>

## Components and Assembly

To create the system shown in the demo, the components listed below can be used.

- Basys 3 board or compatible FPGA board (x1)
- Servo motors (x3)
- M-to-M Jumper wires (x9)
- 3D-printed parts
- M3x12 screws (x8), M3x30 screws (x1), M4x20 screws (x5)
- M3 nuts (x7), M4 self-locking nuts (x7)
- M3/M4 washers (x16)
- 3D-printed cylinder or brass pipe (4-mm dia, 22-mm long) (x1)

Any FPGA board with compatible peripherals could be used. The 3D printed parts,
found in [Thingiverse](https://www.thingiverse.com/thing:1015238), are
compatible with the dimensions of the SG90 9G micro servos, which are roughly 
23-mm x 12.2-mm x 22-mm. If different servos are to be used, a modified 3D 
model is needed.

If using the provided model, the assembly is straightforward and instructions
can be found in the [Instructables](https://www.instructables.com/EEZYbotARM/)
site.

## Results and Final Remarks

The servo motors used in this project have limited range, only being able to 
move 90-deg in each direction or 180-deg in total. During the development of 
the code, and before servo motors were selected, continuous rotation or 360-deg
was assumed. Thus, in the final system, the range of the switch-to-angle 
mapping was reduced and the equation mapping switch to angle had to be 
modified.

The system can be further improved by mapping smaller angle increments for each
of the switches. This can make the movements more subtle, which would make more
sense for the 3D-printed prototype used.

This project used switches to manually move the servo motors but we can also
have a mode in which we demonstrate a specific series of movements without 
having to manually provide an input to the system. 