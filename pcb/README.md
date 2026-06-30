# FPGA-Based Traffic Light Controller – PCB Design

## Overview

This folder contains the complete PCB design files for the **FPGA-Based Traffic Light Controller with Pedestrian Request** project. The PCB was designed using **Altium Designer** to provide a dedicated hardware interface for the FPGA implementation developed in **Vivado**.

The PCB serves as an external interface board for the Digilent Nexys A7 FPGA, providing LED indicators, push-button inputs, power regulation, and FPGA connectivity.

---

## Project Features

- FPGA interface through a 12-pin header
- Nine LED indicators
  - North–South Traffic Lights
  - East–West Traffic Lights
  - Pedestrian Status Indicators
- Two push buttons
  - Reset
  - Pedestrian Request
- AMS1117-3.3 V voltage regulator
- Decoupling capacitors for stable power supply
- Single-layer PCB layout designed in Altium Designer

---

## Folder Contents

| File | Description |
|------|-------------|
| `Traffic_Light_Controller.PrjPcb` | Altium PCB project |
| `P1.SchDoc` | Schematic design |
| `PCB1.PcbDoc` | PCB layout |
| `Traffic_Light_Controller.OutJob` | Output job configuration |
| `Traffic_Light_Controller.xlsx` | Bill of Materials (BOM) |
| `Traffic_Light_Controller.pdf` | Schematic and PCB documentation |
| `PCB3D.png` | 3D PCB layout image |
| `Gerber/` | Manufacturing files for PCB fabrication |

---

## Software Used

- Altium Designer Professional 26.6
- Vivado Design Suite 2025.2

---

## Hardware Platform

- Digilent Nexys A7 FPGA Development Board
- AMD Artix-7 FPGA

---

## PCB Description

The PCB was developed as an interface board for the FPGA-based traffic light controller. It provides dedicated outputs for traffic light LEDs, pedestrian indicators, push-button inputs, regulated power distribution, and FPGA signal connections. The layout emphasizes clear signal routing, compact component placement, and ease of integration with the FPGA development board.

---

## Author

**Ronjon Sarker**  
B.Sc. Electronics Engineering  
Hochschule Hamm-Lippstadt (HSHL)

---

## Supervisor

**Prof. Dr.-Ing. Ali Hayek**

---

## License

This project was developed as part of the **Hardware Engineering Lab** course at Hochschule Hamm-Lippstadt and is intended for educational purposes.
