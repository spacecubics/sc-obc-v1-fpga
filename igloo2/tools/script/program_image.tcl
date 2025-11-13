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
# FPExpress IGLOO2 Programming script
#-----------------------------------------------------------------------------

# Check argument
if {${argc} < 1} {
    puts "Not enough arguments."
    puts " libero SCRIPT:(script) "SCRIPT_ARGS:(Bitstream image of job format)"
    exit 1
}

set arglist ${argv}
set job_file [lindex ${arglist} 0]

create_job_project -job_project_location {./} -job_file $job_file -overwrite 1

set_programming_action -name {M2GL090} -action {PROGRAM}
run_selected_actions -prog_spi_flash 0 -disable_prog_design 0
