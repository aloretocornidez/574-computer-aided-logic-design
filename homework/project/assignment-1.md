## Overview

Create a library of parameterized datapath components and use synthesis results
from that library to estimate the critical path for various circuits specified
using a behavioral netlist. Finally, compare the estimated critical path to
actual critical path by implementing the circuits using Verilog and synthesizing
the circuit.

## Part 1: Verilog implementation of Datapath Component Library

- Create parameterized Verilog implementations of the following datapath
  components.
- Each component should be modeled using a single Verilog module.
- Each module should include a Verilog parameter named DATAWIDTH that specifies
  the number of bits for the data inputs and outputs.
- The following provides an overview of the required components for all
  students:

| Name    | Data Inputs | Control Inputs | Data Outputs | Control Outputs | Description                                                |
| ------- | ----------- | -------------- | ------------ | --------------- | ---------------------------------------------------------- |
| REG     | d           | Clk, Rst       | q            |                 | Register                                                   |
| ADD     | a, b        |                | sum          |                 |                                                            |
| SUB     | a, b        |                | diff         |                 | Subtractor                                                 |
| MUL     | a, b        |                | prod         |                 | Multiplier                                                 |
| Comp    | a,b         |                |              | gt, lt, eq      |                                                            |
| Mux 2x1 | a,b         | sel            | d            |                 | Multiplexor                                                |
| SHR     | a           | sh_amt         | d            |                 | Logically shifts the input `sh_amt` position to the right. |
| SHL     |             |                |              |                 | Logically shifts the input `sh_amt` position to the left.  |
