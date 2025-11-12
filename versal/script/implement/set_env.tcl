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
set user_rtl_list  ${rtl_dir}/user_rtl.list

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

set  evb1001_uart0__lpd_mio_0_1      yes
set  evb1001_uart0__lpd_mio_8_9      no
set  evb1001_u0hwflow__lpd_mio_2_3   no
set  evb1001_u0hwflow__lpd_mio_10_11 no

set  evb1001_uart1__lpd_mio_4_5      yes
set  evb1001_u1hwflow__lpd_mio_6_7   no

set  evb1001_canfd0__lpd_mio_2_3     no
set  evb1001_canfd0__lpd_mio_6_7     no

set  evb1001_canfd1__lpd_mio_0_1     no
set  evb1001_canfd1__lpd_mio_4_5     no
set  evb1001_canfd1__lpd_mio_8_9     no

set  evb1001_lpdi2c0__lpd_mio_2_3    no
set  evb1001_lpdi2c0__lpd_mio_6_7    no
set  evb1001_lpdi2c0__lpd_mio_10_11  no

set  evb1001_lpdi2c1__lpd_mio_0_1    no
set  evb1001_lpdi2c1__lpd_mio_4_5    no
set  evb1001_lpdi2c1__lpd_mio_8_9    no

set  evb1001_spi0__lpd_mio_0_5       no
set  evb1001_spi0__cs1               no
set  evb1001_spi0__cs2               no

set  evb1001_gpio__lpd_mio_0         no
set  evb1001_gpio__lpd_mio_1         no
set  evb1001_gpio__lpd_mio_2         yes
set  evb1001_gpio__lpd_mio_3         yes
set  evb1001_gpio__lpd_mio_4         no
set  evb1001_gpio__lpd_mio_5         no
set  evb1001_gpio__lpd_mio_6         yes
set  evb1001_gpio__lpd_mio_7         yes
set  evb1001_gpio__lpd_mio_8         yes
set  evb1001_gpio__lpd_mio_9         yes
set  evb1001_gpio__lpd_mio_10        yes
set  evb1001_gpio__lpd_mio_11        yes

set  evb1001_gpio__pmc_mio_12        yes
set  evb1001_gpio__pmc_mio_37        yes
