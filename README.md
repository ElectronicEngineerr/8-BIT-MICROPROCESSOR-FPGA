I have completed the design of an 8-bit primitive microprocessor, a project I have been working on for a long time, inspired by the book Introduction to Logic Circuits & Logic Design with VHDL by Brock J. LaMeres.

This microprocessor design was implemented in Vivado using VHDL. During the design process:

By systematically creating the submodules to construct the top module, named computer, I developed:

Arithmetic Logic Unit (ALU)
Program Memory (ROM)
Data Memory (RAM)
Control Unit
CPU and Data Path
I combined both structural and behavioral design methods to achieve a comprehensive microprocessor.

Simulation and Analysis:
Using a Test Bench, I successfully executed a primitive operation such as adding two 8-bit inputs and saving the result to a register. The simulations were validated using Vivado, ModelSim, and Questa-Sim.

Incorporating real-world delays (e.g., input delay, output delay), the Static Timing Analysis results show that this processor operates smoothly at frequencies below 50 MHz.

The images below detail the simulation steps, processor synthesis, and static timing analyses.

I would like to express my gratitude to Can Dost Yavuz, whose guidance I followed while learning FPGA technologies and enhancing my digital design skills, for supporting me on this journey.
