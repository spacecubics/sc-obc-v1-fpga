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

# AMD and FPGA setting
include makefiles/config.mk

# Command Variables
VIVADOGUI    := vivado
VIVADOTCL    := vivado -mode batch
RM           := rm -rf
CP           := cp -rf

# AMD IP Variables
IP_ROOT_DIR  := ../ip
IP_DIR       := ip

# Clean File
CF           := vivado*.jou vivado*.log vivado*.str hls.list
CF           += $(PROJECT_DIR)
# ---------------------------------------------------------------------------
PHONY := all
all: create_versal_ps_bd

# Synthesis AMD IP
#-------------------
$(IP_DIR):
	$(CP) $(IP_ROOT_DIR) ./$(IP_DIR)

define DEFINE_BUILD_IP
$(IP_DIR)/$(1).dcp: $(IP_DIR)
	cd $(IP_DIR)/$(dir $(1)) && make MODULE=$(notdir $(1)) VIVADO_PATH=$(VIVADO_PATH)
endef
$(foreach ips, $(IP_LIST), $(eval $(call DEFINE_BUILD_IP,$(ips))))

# Create Zynq PS Block Design target
PHONY += create_versal_ps_bd
create_versal_ps_bd: $(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd
$(PROJECT_DIR)/$(PROJECT_NAME).srcs/*/bd/versal_ps_bd/versal_ps_bd.bd:
ifeq ("$(wildcard $(PROJECT_DIR))", "")
	$(VIVADOTCL) -source script/create_project.tcl -tclargs $(PROJECT_NAME) $(PROJECT_DIR)
	echo "*" > project/.gitignore
endif
	$(VIVADOTCL) -source script/create_versal_ps_bd.tcl -tclargs $(PROJECT_NAME) $(PROJECT_DIR)

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
