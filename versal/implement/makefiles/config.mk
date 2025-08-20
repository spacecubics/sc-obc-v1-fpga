# ---------------------------------------------------------------------------
# Space Cubics Implementation Environment
# AMD FPGA configuration file
#
# Copyright (c) 2025 Space Cubics, LLC.
# ---------------------------------------------------------------------------

# AMD Vivado Settings
XILINX_HOME        := /opt/Xilinx
XILINX_VER         := 2025.1
export XILINX_VIVADO := $(XILINX_HOME)/$(XILINX_VER)/Vivado
export PATH := $(XILINX_HOME)/$(XILINX_VER)/Vivado/bin:$(PATH)

# FPGA device param
DEVICE_PART        := xcve2302-sfva784-1MP-i-S
