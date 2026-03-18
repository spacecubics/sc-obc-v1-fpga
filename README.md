# SC-OBC Module V1 FPGA Development Environment

## Overview

This repository provides the FPGA development environment for the **SC-OBC Module V1**, a high-end on-board computer in Space Cubics’ product line.

SC-OBC Module V1 integrates the **AMD Versal AI Edge Series VE2302** as its main processor. In addition, a **Microchip IGLOO2** device is implemented as a safety processor to perform health monitoring of the main processor. The hardware is composed of radiation-tolerant devices and industrial-grade components that have been verified for high radiation resistance, ensuring high reliability in space applications.

For more details, please refer to the online documentation:  
https://docs.spacecubics.com/scobc-v1/latest/index.html

## Supported Hardware

This repository supports the following hardware configurations.

### OBC Module
- **SC-OBC-V1001** : SC-OBC Module V1 Space Grade
- **SC-OBC-V1D01** : SC-OBC Module V1 Developer Grade

### Carrier Board
- **SC-EVB-V1001** : SC-OBC Module V1 Evaluatio Board

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

Clone the repository and move to the Versal project directory:

```sh
git clone https://github.com/spacecubics/sc-obc-v1-fpga.git
cd sc-obc-v1-fpga/versal
```

### Build Options

The default build target is defined in `versal/set_env.tcl` by the `board_grade` variable:

```tcl
# Select the target board for this build.
#   SPACE : SC-OBC Module V1 Space Grade
#   DEV   : SC-OBC Module V1 Developer's Grade
set board_grade    SPACE
```

- **Default (follows `board_grade` in set_env.tcl)**
  ```sh
  make
  ```

- **Space Grade**
  ```sh
  make GRADE=SPACE
  ```

- **Developer Grade**
  ```sh
  make GRADE=DEV
  ```
> [!IMPORTANT]
> Images generated with either build option can be used on both hardware variants.  
> However, the configurations differ in DDR4 settings and the temperature range used for timing verification in Vivado.  
> As a result, using an image built for a different grade may lead to unstable or incorrect operation.  
> This will not cause any physical damage to the board.
