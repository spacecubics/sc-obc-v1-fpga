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
#  Create Versal Processor System Block Design
#-----------------------------------------------------------------------------

# Check argument
if {${argc} < 2} {
    puts "Not enough arguments."
    puts " vivado -mode tcl -source (script) -tclargs (Root Directory) (Project Name) (Project Directory)
    exit 1
}
set arglist ${argv}

# Set Project
set root_dir [lindex ${arglist} 0]
set prj_name [lindex ${arglist} 1]
set prj_dir  [lindex ${arglist} 2]

source ${root_dir}/script/implement/set_env.tcl
source ${root_dir}/script/implement/vivado_basic_func.tcl

# Open Project
open_project ${prj_dir}/${prj_name}.xpr
set file_set [current_fileset]

# Create Versal PS Module
#-------------------------
# Create block design
set bd_name versal_ps_bd
create_bd_design ${bd_name}

# Versal PS Block Design Modules
add_bd_cell ${ip_dir} versal_ps  versal_ps.config  versal_ps

# Versal NoC
add_bd_cell ${ip_dir} versal_noc versal_noc.config versal_noc
connect_bd_intf_net [get_bd_intf_pins versal_ps/FPD_CCI_NOC_0] [get_bd_intf_pins versal_noc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins versal_ps/FPD_CCI_NOC_1] [get_bd_intf_pins versal_noc/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins versal_ps/FPD_CCI_NOC_2] [get_bd_intf_pins versal_noc/S02_AXI]
connect_bd_intf_net [get_bd_intf_pins versal_ps/FPD_CCI_NOC_3] [get_bd_intf_pins versal_noc/S03_AXI]
connect_bd_intf_net [get_bd_intf_pins versal_ps/LPD_AXI_NOC_0] [get_bd_intf_pins versal_noc/S04_AXI]
connect_bd_intf_net [get_bd_intf_pins versal_ps/PMC_NOC_AXI_0] [get_bd_intf_pins versal_noc/S05_AXI]
connect_bd_net [get_bd_pins versal_ps/hsm1_ref_clk] [get_bd_pins versal_noc/sys_clk0]
connect_bd_net [get_bd_pins versal_ps/fpd_cci_noc_axi0_clk] [get_bd_pins versal_noc/aclk0]
connect_bd_net [get_bd_pins versal_ps/fpd_cci_noc_axi1_clk] [get_bd_pins versal_noc/aclk1]
connect_bd_net [get_bd_pins versal_ps/fpd_cci_noc_axi2_clk] [get_bd_pins versal_noc/aclk2]
connect_bd_net [get_bd_pins versal_ps/fpd_cci_noc_axi3_clk] [get_bd_pins versal_noc/aclk3]
connect_bd_net [get_bd_pins versal_ps/lpd_axi_noc_clk] [get_bd_pins versal_noc/aclk4]
connect_bd_net [get_bd_pins versal_ps/pmc_axi_noc_axi0_clk] [get_bd_pins versal_noc/aclk5]

set_property -dict [list CONFIG.CATEGORY {ps_cci} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S00_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_0 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S00_AXI]
set_property -dict [list CONFIG.CATEGORY {ps_cci} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S01_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_0 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S01_AXI]
set_property -dict [list CONFIG.CATEGORY {ps_cci} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S02_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_1 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S02_AXI]
set_property -dict [list CONFIG.CATEGORY {ps_cci} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S03_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_1 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S03_AXI]
set_property -dict [list CONFIG.CATEGORY {ps_rpu} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S04_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_2 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S04_AXI]
set_property -dict [list CONFIG.CATEGORY {ps_pmc} CONFIG.CONNECTIONS {}] [get_bd_intf_pins /versal_noc/S05_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_3 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /versal_noc/S05_AXI]

# Platform Clock
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset psr_sync_pl0_ref
create_bd_cell -type inline_hdl -vlnv xilinx.com:inline_hdl:ilconstant dcm_locked_always_1
connect_bd_net [get_bd_pins versal_ps/pl0_resetn]     [get_bd_pins psr_sync_pl0_ref/ext_reset_in]
connect_bd_net [get_bd_pins versal_ps/pl0_ref_clk]    [get_bd_pins psr_sync_pl0_ref/slowest_sync_clk]
connect_bd_net [get_bd_pins dcm_locked_always_1/dout] [get_bd_pins psr_sync_pl0_ref/dcm_locked]

# DDR4 Bus Signals
set DDR4 [create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 DDR4]
connect_bd_intf_net [get_bd_intf_ports DDR4] [get_bd_intf_pins versal_noc/CH0_DDR4_0]

# DDR4 Address Setting
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_0 [get_bd_addr_segs versal_noc/S00_AXI/C0_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_0 [get_bd_addr_segs versal_noc/S00_AXI/C0_DDR_LOW1] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_1 [get_bd_addr_segs versal_noc/S01_AXI/C0_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_1 [get_bd_addr_segs versal_noc/S01_AXI/C0_DDR_LOW1] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_2 [get_bd_addr_segs versal_noc/S02_AXI/C1_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_2 [get_bd_addr_segs versal_noc/S02_AXI/C1_DDR_LOW1] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_3 [get_bd_addr_segs versal_noc/S03_AXI/C1_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/FPD_CCI_NOC_3 [get_bd_addr_segs versal_noc/S03_AXI/C1_DDR_LOW1] -force
assign_bd_address -target_address_space /versal_ps/LPD_AXI_NOC_0 [get_bd_addr_segs versal_noc/S04_AXI/C2_DDR_LOW1] -force
assign_bd_address -target_address_space /versal_ps/LPD_AXI_NOC_0 [get_bd_addr_segs versal_noc/S04_AXI/C2_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/PMC_NOC_AXI_0 [get_bd_addr_segs versal_noc/S05_AXI/C3_DDR_LOW0] -force
assign_bd_address -target_address_space /versal_ps/PMC_NOC_AXI_0 [get_bd_addr_segs versal_noc/S05_AXI/C3_DDR_LOW1] -force

# Platform Setup
set_property PFM.CLOCK {pl0_ref_clk {id "0" is_default "true" proc_sys_reset "/psr_sync_pl0_ref" status "fixed" freq_hz "99999001"}} [get_bd_cells /versal_ps]

set_property platform.vendor {spacecubics} [current_project]
set_property platform.board_id ${prj_name} [current_project]
set_property platform.name ${prj_name} [current_project]
set_property platform.version {1.0} [current_project]
set_property pfm_name "spacecubics:${prj_name}:${prj_name}:1.0" [get_files -all ${prj_dir}/${prj_name}.srcs/${file_set}/bd/${bd_name}/${bd_name}.bd]
set_property platform.uses_pr {false} [current_project]

# Save block design
save_bd_design

# Generate target
generate_target all [get_files ${prj_dir}/${prj_name}.srcs/${file_set}/bd/${bd_name}/${bd_name}.bd]
export_ip_user_files -of_objects [get_files ${prj_dir}/${prj_name}.srcs/${file_set}/bd/zynq_ps_bd/zynq_ps_bd.bd] -no_script -sync -force -quiet
set ip_run [create_ip_run [get_files -of_objects [get_fileset ${file_set}] ${prj_dir}/${prj_name}.srcs/${file_set}/bd/${bd_name}/${bd_name}.bd]]
launch_runs ${ip_run} -jobs ${cpus}
wait_on_run ${ip_run}

# Load RTL source code
read_rtl_from_rtllist ${rtl_dir} ${rtl_list}
set_property top ${prj_name} [current_fileset]

# Close Project
close_project
exit
