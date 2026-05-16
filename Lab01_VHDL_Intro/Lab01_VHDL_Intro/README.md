# Lab 01 – VHDL Introduction

## Exercise: Half Adder Design

This project implements a 1-bit Half Adder using VHDL and simulates it using ModelSim.

## Inputs
- A
- B

## Outputs
- SUM
- CARRY

## Logic Equations

SUM = A XOR B

CARRY = A AND B

## Truth Table

| A | B | SUM | CARRY |
|---|---|-----|--------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## Files Included

- half_adder.vhd
- half_adder_tb.vhd
- waveform screenshots

## Software Used

- ModelSim Intel FPGA Edition
- VHDL
