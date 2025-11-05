#-----------------------------------------------------------------------------
# Copyright 2024 Space Cubics, LLC
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
# Set Environment
#-----------------------------------------------------------------------------

# AMD IP directory
set ip_dir         ${root_dir}/ip

# RTL directory
set rtl_dir        ${root_dir}/rtl
set rtl_list       ${rtl_dir}/rtl.list

# Report directory
set rptdit         ./report

# Device Parameter
set xil_part       xcve2302-sfva784-1MP-i-S

# Build Machine Setting
set cpus           8

# Specify LPD MIO I/O voltage level (valid options: 1.8V, 2.5V, or 3.3V)
# This setting may be overridden depending on the selected carrier board.
set LPDMIO_VDDIO   1.8V

# Evaluation board
# - Space Cubics EVB
set sc_evb1001     yes
