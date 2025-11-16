# SC-OBC Module V1 FPGA Development Environment

## Overview

This repository provides the FPGA development environment for the **SC-OBC Module V1**, a high-end on-board computer in Space Cubics’ product line.

SC-OBC Module V1 integrates the **AMD Versal AI Edge Series VE2302** as its main processor. In addition, a **Microchip IGLOO2** device is implemented as a safety processor to perform health monitoring of the main processor. The hardware is composed of radiation-tolerant devices and industrial-grade components that have been verified for high radiation resistance, ensuring high reliability in space applications.

## Repository Structure

```
repo/
 ├─ versa             # Main Processor (Versal) FPGA project
 │   ├─ rtl/          # RTL sources
 │   ├─ ip/           # IP core configuration files
 │   ├─ constraints/  # XDC constraint files
 │   └─ script/       # Build scripts
 │
 └─ igloo2/           # Safety Processor (IGLOO2) programming environment
      ├─ bitstream/   # Released bitstream files
      └─ tools/       # Tools for the Safety Processor
```


## Requirements

### Main Processor Development
- AMD Vivado **2025.1 or later**

### Safety Processor Programming Development
- Microchip Libero SoC **2025.1 or later** (including FlashPro Express)


## Environment Setup and Build

> [!NOTE]
> Vivado environment setup must be completed beforehand.

```sh
git clone https://github.com/spacecubics/sc-obc-v1-fpga.git
cd sc-obc-v1-fpga/versal
make implement
```
