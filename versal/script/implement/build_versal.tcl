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

# Check argument
if {${argc} < 3} {
    puts "Not enough arguments."
    puts " vivado -mode tcl -source (script) -tclargs (Root Directory) (Project Name) (Project Directory) (Target Board Grade) (Versal Part)"
    exit 1
}
set arglist ${argv}

# Set Project
set root_dir [lindex ${arglist} 0]
set prj_name [lindex ${arglist} 1]
set prj_dir  [lindex ${arglist} 2]

source ${root_dir}/set_env.tcl

# Overwrite Board Grade
if {${argc} > 3} {
    set board_grade [lindex ${arglist} 3]
}

set suffix ""
if {$board_grade != "SPACE"} {
    set suffix _ve2302e
    if {${argc} > 4} {
	if {[lindex ${arglist} 4] == "VE2002"} {
	    set suffix _ve2002e
	}
    }
}

# Create Git Hash
set git_hash ""
if {![catch {exec git rev-parse --is-inside-work-tree} inside]} {
    set git_hash "_"
    if {$inside eq "true"} {
        if {![catch {exec git rev-parse --short=8 HEAD} hash]} {
            append git_hash $hash

            if {[catch {exec git diff-index --quiet HEAD --}]} {
                append git_hash "+"
            }
        }
    }
}

# Open Project
open_project ${prj_dir}/${prj_name}.xpr

# Read IO constraints
if {$board_grade == "SPACE"} {
  add_files -norecurse ${root_dir}/constraints/sc-obc-v1-versal-base-io.xdc
} else {
  add_files -norecurse ${root_dir}/constraints/sc-obc-v1-versal-base-io-dev.xdc
}
add_files -norecurse ${root_dir}/constraints/sc-obc-v1-versal-user-io.xdc

# Place and Route TOP Module
#---------------------------
# Synthesis
if {[get_runs -quiet synth_1] != ""} {
    reset_runs synth_1
}
launch_runs synth_1 -jobs ${cpus}
wait_on_run synth_1

# Place and Route
if {[get_runs -quiet impl_1] != ""} {
    reset_runs impl_1
}
launch_runs impl_1 -jobs ${cpus}
wait_on_run impl_1

# Write bitstream file
launch_runs impl_1 -to_step write_bitstream -jobs ${cpus}
wait_on_run impl_1

# Export xsa
set_property platform.design_intent.embedded {true} [current_project]
write_hw_platform -fixed -include_bit -force -file ${prj_dir}/${prj_name}${suffix}${git_hash}.xsa
exec cp ${prj_dir}/${prj_name}.runs/impl_1/${prj_name}.pdi ${prj_dir}/${prj_name}${suffix}${git_hash}.pdi
# Close Project
close_project
exit
