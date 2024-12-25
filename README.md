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

A primitive addition example:
```vhdl
    0 => YUKLE_A_SBT, -- A registerine sabit sayi atama
    1 => x"F0",       -- 11110000  ( 240 )
    2 => YUKLE_B_SBT, -- B registerine sabit sayi atama
    3 => x"0F",       -- 00001111   ( 15 )
    4 => TOPLA_AB,    -- A ve B toplananacak ( 255)
    5 => KAYDET_A,    -- Toplam sonucunu A registerine kaydedecek
    6 => x"80",       -- Bellek adresi ( 128. adrese kaydedecek)
    7 => ATLA,        -- Programın sonuna atla
    8 => x"00",       -- Atlanan adres
    others => x"00"   -- ```



