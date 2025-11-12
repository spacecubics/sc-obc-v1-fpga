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
# Space Cubics OBC Module V1 Evaluation Board (EVB1001)
# Board-specific block design setup script
#-----------------------------------------------------------------------------

# LPD MIO VDD IO setting
#-------------------------------------------------------------------
# On the EVB1001 board, the LPD MIO voltage is fixed at 1.8V.
set_property CONFIG.PS_PMC_CONFIG { \
  PS_BANK_2_IO_STANDARD {LVCMOS1.8} \
} [get_bd_cells versal_ps]


# EtherMAC1 with MDIO
#-------------------------------------------------------------------
# LPD MIO[25:12] are reserved for GbEtherMAC1.
# Among them, LPD_MIO[25:24] function as the MDIO interface for GbEtherMAC.

set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PS_ENET1_MDIO { \
      {ENABLE 1} \
      {IO {PS_MIO 24 .. 25}} \
    } \
    PS_ENET1_PERIPHERAL { \
      {ENABLE 1} \
      {IO {PS_MIO 12 .. 23}} \
    } \
    PS_MIO12 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
    PS_MIO13 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
    PS_MIO14 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
    PS_MIO15 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
    PS_MIO16 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
    PS_MIO17 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 1} {SLEW fast} {USAGE Reserved}} \
  } \
] [get_bd_cells versal_ps]

# SD3.0 Card
#-------------------------------------------------------------------
# PMC MIO1[49:38] are reserved for SD3.0 (microSD Slot)

set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PMC_SD0_SLOT_TYPE {SD 3.0} \
    PMC_SD0 { \
      {CD_ENABLE 1}    {CD_IO {PMC_MIO 39}} \
      {POW_ENABLE 1}   {POW_IO {PMC_MIO 49}} \
      {RESET_ENABLE 0} {RESET_IO {PMC_MIO 17}} \
      {WP_ENABLE 0}    {WP_IO {PMC_MIO 25}}
    } \
    PMC_SD0_PERIPHERAL { \
      {CLK_100_SDR_OTAP_DLY 0x3} \
      {CLK_200_SDR_OTAP_DLY 0x2} \
      {CLK_50_DDR_ITAP_DLY 0x36} \
      {CLK_50_DDR_OTAP_DLY 0x3}  \
      {CLK_50_SDR_ITAP_DLY 0x2C} \
      {CLK_50_SDR_OTAP_DLY 0x4}  \
      {ENABLE 1} {IO {PMC_MIO 37 .. 49}}
    } \
  } \
] [get_bd_cells versal_ps]

# USB2.0 (ULPI)
#-------------------------------------------------------------------
# PMC MIO1[49:38] are reserved for SD3.0 (microSD Slot)

set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PS_USB3_PERIPHERAL { \
      {ENABLE 1} \
      {IO {PMC_MIO 13 .. 25}} \
    } \
  } \
] [get_bd_cells versal_ps]

# Default Serial Console for APU/RPU
set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PS_UART0_PERIPHERAL { \
      {ENABLE 1} \
      {IO {PS_MIO 0 .. 1}} \
    } \
  } \
] [get_bd_cells versal_ps]

set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PS_UART1_PERIPHERAL { \
      {ENABLE 1} \
      {IO {PS_MIO 4 .. 5}} \
    } \
  } \
] [get_bd_cells versal_ps]

# GPIO
set_property -dict [list \
  CONFIG.PS_PMC_CONFIG { \
    PS_MIO2 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO2 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO3 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO6 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO7 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO8 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO9 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO10 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
    PS_MIO11 { \
      {AUX_IO 0} \
      {DIRECTION inout} \
      {DRIVE_STRENGTH 4mA} \
      {OUTPUT_DATA default} \
      {PULL pulldown} \
      {SCHMITT 0} \
      {SLEW slow} \
      {USAGE GPIO} \
    } \
  } \
] [get_bd_cells versal_ps]
