
# Traffic Light Controller (VHDL)

## Description

This module implements a traffic light controller using VHDL. The design is modular and consists of separate components for timing, button conditioning, finite state machine control, and output decoding.

## Files

- `traffic_light_top.vhd` – Top-level module
- `traffic_light_pkg.vhd` – Shared package containing states and constants
- `traffic_light_fsm.vhd` – Finite State Machine controlling the traffic lights
- `traffic_light_output_decoder.vhd` – Converts FSM states into traffic light outputs
- `tick_generator.vhd` – Generates timing ticks
- `button_conditioner.vhd` – Debounces and conditions the pedestrian button
- `traffic_light_fsm_tb.vhd` – Testbench for simulation

## Simulation

Simulation was performed using ModelSim.

Example screenshots are provided in the **Screenshots** folder.

### Case 1
- A = 1
- B = 0

### Case 2
- A = 1
- B = 1

## Tools

- Altium Designer
- ModelSim
- VHDL
