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
# Space Cubics High reliability/High performance On Board Computer
#  SC-OBC module V1
#  Versal implement script
#-----------------------------------------------------------------------------

# Command
CD    := cd
CP    := cp -rf
MKDIR := mkdir -p
RM    := rm -rf

# Directory
WORK_DIR      := work
IMPLEMENT_DIR := implement
MAKEFILE_DIR  := makefiles

PHONY := all
all: implement

$(WORK_DIR)/$(IMPLEMENT_DIR):
	$(MKDIR) $(WORK_DIR)/$(IMPLEMENT_DIR)
	echo "*" > $(WORK_DIR)/$(IMPLEMENT_DIR)/.gitignore
	$(CP) script/implement/Makefile $(WORK_DIR)/$(IMPLEMENT_DIR)/Makefile

PHONY += implement
implement: $(WORK_DIR)/$(IMPLEMENT_DIR)
	$(CD) $(WORK_DIR)/$(IMPLEMENT_DIR) && make ROOT_DIR=$(CURDIR)

PHNY += clean clean_implement
clean:
	$(RM) $(WORK_DIR)

clean_implement:
	$(RM) $(WORK_DIR)/$(IMPLEMENT_DIR)

.PHONY: $(PHONY)
