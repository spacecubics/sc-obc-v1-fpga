#-----------------------------------------------------------------------------
# Copyright 2025 Space Cubics Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#-----------------------------------------------------------------------------
# Space Cubics High reliability On Board Computer
#  SC-OBC module V1
#  Versal implement script
#-----------------------------------------------------------------------------

# Project Setting
PROJECT_NAME := sc_obc_v1_versal
PROJECT_DIR  := project

# Directorys
ROOT_DIR     ?= ../..
SCRIPT_DIR   := $(ROOT_DIR)/script/implement
LOG_DIR      := ./log

# Command Variables
VIVADOGUI    := vivado
VIVADOTCL    := vivado -mode batch
RM           := rm -rf
MKDIR        := mkdir -p

# Clean File
CF           := $(LOG_DIR)
CF           += $(PROJECT_DIR)
# ---------------------------------------------------------------------------
PHONY := all
all: build_versal

# Create Zynq PS Block Design target
PHONY += create_versal_ps_bd
create_versal_ps_bd: $(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd
$(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd:
	$(MKDIR) $(LOG_DIR) && echo "*" > $(LOG_DIR)/.gitignore
	$(VIVADOTCL) -log $(LOG_DIR)/create_project.log -journal $(LOG_DIR)/create_project.jou \
		-source $(SCRIPT_DIR)/create_project.tcl -tclargs $(ROOT_DIR) $(PROJECT_NAME) $(PROJECT_DIR) && echo "*" > $(PROJECT_DIR)/.gitignore
	$(VIVADOTCL) -log $(LOG_DIR)/create_versal_base_system.log -journal $(LOG_DIR)/create_versal_base_system.jou \
		-source $(SCRIPT_DIR)/create_versal_base_system.tcl -tclargs $(ROOT_DIR) $(PROJECT_NAME) $(PROJECT_DIR)

PHONY += build_versal
build_versal: sc_obc_v1_versal.xsa
sc_obc_v1_versal.xsa: $(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd
	$(VIVADOTCL) -log $(LOG_DIR)/build_versal.log -journal $(LOG_DIR)/build_versal.jou \
		-source $(SCRIPT_DIR)/build_versal.tcl -tclargs $(ROOT_DIR) $(PROJECT_NAME) $(PROJECT_DIR)

# for Debug
#-------------------
PHONY += open_project
open_project: $(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd
	$(VIVADOGUI) $(PROJECT_DIR)/$(PROJECT_NAME).xpr

# Clean target
#-------------------
PHONY += clean
clean:
	$(RM) $(CF)

.PHONY: $(PHONY)
