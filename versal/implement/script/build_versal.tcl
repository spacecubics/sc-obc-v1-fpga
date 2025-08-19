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
#  Build Versal script
#-----------------------------------------------------------------------------

source script/set_env.tcl
source script/vivado_basic_func.tcl

# Check argument
if {${argc} < 2} {
    puts "Not enough arguments."
    puts " vivado -mode tcl -source (script) -tclargs (Project Name) (Project Directory)
    exit 1
}
set arglist ${argv}

# Set Project
set prj_name [lindex ${arglist} 0]
set prj_dir  [lindex ${arglist} 1]

# Open Project
open_project ${prj_dir}/${prj_name}.xpr

# Read fpga top layer
add_files -norecurse ../rtl/sc-obc-v1-versal/sc_obc_v1_versal.v
set_property top sc_obc_v1_versal [current_fileset]

# Close Project
close_project
exit
