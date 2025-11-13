#-----------------------------------------------------------------------------
# Space Cubics Safety Processor
#  Program Microchip FPGA Script
#-----------------------------------------------------------------------------
# Copyright 2025 Space Cubics Inc.
#-----------------------------------------------------------------------------

# Directory
SCRIPT_DIR   := script
LOG_DIR      := ./log
WORK_DIR     := sc_obc_spv1

# Flash Programming Valiable
IMAGE_JOB    := ../bitstream/sc_obc_spv1.job

# Command Variables
LIBEROCLI    := FPExpress SCRIPT
MKDIR        := mkdir -p
RM           := rm -rf

PHONY := all

all: program_image

PHONY += program_image
program_image:
	$(MKDIR) $(LOG_DIR) && echo "*" > $(LOG_DIR)/.gitignore
	$(LIBEROCLI):$(SCRIPT_DIR)/program_image.tcl \
		"SCRIPT_ARGS:$(IMAGE_JOB)" \
		LOGFILE:$(LOG_DIR)/program_image.log

clean:
	$(RM) $(WORK_DIR) $(LOG_DIR)

.PHONY: $(PHONY)
