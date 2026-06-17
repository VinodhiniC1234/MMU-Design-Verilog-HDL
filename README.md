# Memory Management Unit (MMU) Design using Verilog HDL


## Project Objective

The objective of this project is to design and implement a Memory Management Unit (MMU) using Verilog HDL.

The project focuses on:

- Virtual address to physical address translation
- Page table based memory mapping
- Valid page checking
- Read/write permission checking
- Page fault detection
- Protection fault detection
- RTL design and simulation verification


## Overview

A Memory Management Unit (MMU) is a hardware component used in processors to manage memory access.

This project implements a simple MMU that converts a virtual address into a physical address using a page table.

The design performs:

- Page number extraction
- Page table lookup
- Valid bit checking
- Permission checking
- Physical address generation

This project demonstrates concepts of:

- VLSI Design
- Digital Design
- Computer Architecture
- RTL Design
- Hardware Verification


## Key Features

- Virtual address input handling

- Page number extraction

- Page table lookup

- Frame number mapping

- Valid bit checking

- Read permission checking

- Write permission checking

- Page fault detection

- Protection fault detection

- Physical address generation

- Simulation waveform verification


## Tech Stack

Hardware Description Language:
- Verilog HDL

Simulation Tool:
- Icarus Verilog

Waveform Analysis:
- GTKWave

Development Environment:
- Visual Studio Code

Version Control:
- GitHub


## Project Structure

```
MMU-Design-Verilog-HDL

├── rtl/
│   └── mmu.v
│
├── tb/
│   └── mmu_tb.v
│
├── constraints/
│   └── mmu.xdc
│
├── simulation/
│   └── output.txt
│
├── waveforms/
│   └── mmu_waveform.png
│
├── reports/
│
├── images/
│
├── docs/
│   └── project_report.md
│
├── README.md
│
└── .gitignore
```


## Expected Output

The MMU design is verified using simulation.

### Successful Translation

```
Virtual Address mapped successfully

Physical Address generated

Page Fault = 0

Protection Fault = 0

Translation Valid = 1
```


### Invalid Page Access

```
Page Fault = 1

Protection Fault = 0

Translation Valid = 0
```


### Permission Failure

```
Page Fault = 0

Protection Fault = 1

Translation Valid = 0
```


## Future Enhancements

- Translation Lookaside Buffer (TLB) implementation

- Multi-level page table support

- Cache memory integration

- Advanced memory protection

- User and supervisor access modes

- FPGA hardware implementation

- Processor interface integration

- Pipelined MMU architecture
