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

set evb1001_lpdswdt__lpd_mio_0_5    no
set evb1001_lpdswdt__clk_apb        no
set evb1001_lpdswdt__clk_mio_0      no
set evb1001_fpdswdt__lpd_mio_6_11   no
set evb1001_fpdswdt__clk_apb        no
set evb1001_fpdswdt__clk_mio_1      no

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
    PS_MIO12 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO13 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO14 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO15 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO16 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO17 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO16 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO17 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO18 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PS_MIO19 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PS_MIO20 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PS_MIO21 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PS_MIO22 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PS_MIO23 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    \
    PS_MIO24 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PS_MIO25 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
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
    PMC_MIO38 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO39 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PMC_MIO40 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO41 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO42 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO43 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO44 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO45 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO46 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO47 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO48 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO49 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO51 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
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
    PMC_MIO13 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO14 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO15 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO16 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO17 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO18 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PMC_MIO19 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO20 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO21 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO22 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO23 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
    PMC_MIO24 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
    PMC_MIO25 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
  } \
] [get_bd_cells versal_ps]

# UART Controller 0
#-------------------------------------------------------------------

if {${evb1001_uart0__lpd_mio_0_1} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_UART0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 1}}} \
        PMC_MIO0 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PMC_MIO1 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_uart0__lpd_mio_8_9} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_UART0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 8 .. 9}}} \
        PMC_MIO8 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PMC_MIO9 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_uart0__lpd_mio_0_1} == "yes" || ${evb1001_uart0__lpd_mio_8_9} == "yes"} {
    if {${evb1001_u0hwflow__lpd_mio_2_3} == "yes"} {
      set_property -dict [list \
        CONFIG.PS_PMC_CONFIG { \
          PS_UART0_RTS_CTS {{ENABLE 1} {IO {PS_MIO 2 .. 3}}}
          PS_MIO2 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
          PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        } \
      ] [get_bd_cells versal_ps]
    } elseif {${evb1001_u0hwflow__lpd_mio_10_11} == "yes"} {
      set_property -dict [list \
        CONFIG.PS_PMC_CONFIG { \
          PS_UART0_RTS_CTS {{ENABLE 1} {IO {PS_MIO 10 .. 11}}}
          PS_MIO2 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
          PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        } \
      ] [get_bd_cells versal_ps]
    }
}

# UART Controller 1
#-------------------------------------------------------------------

if {${evb1001_uart1__lpd_mio_4_5} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_UART1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 4 .. 5}}} \
        PS_MIO4 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO5 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
    if {${evb1001_u1hwflow__lpd_mio_6_7} == "yes"} {
      set_property -dict [list \
        CONFIG.PS_PMC_CONFIG { \
          PS_UART1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 6 .. 7}}} \
          PS_MIO6 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
          PS_MIO7 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
        } \
      ] [get_bd_cells versal_ps]
    }
}

# CAN FD Controller 0
#-------------------------------------------------------------------

if {${evb1001_canfd0__lpd_mio_2_3} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_CAN0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 2 .. 3}}} \
        PS_CRL_CAN0_REF_CTRL_FREQMHZ {100} \
        PS_MIO2 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
        PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_canfd0__lpd_mio_6_7} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_CAN0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 6 .. 7}}} \
        PS_CRL_CAN0_REF_CTRL_FREQMHZ {100} \
        PS_MIO6 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
        PS_MIO7 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
}

# CAN FD Controller 1
#-------------------------------------------------------------------

if {${evb1001_canfd1__lpd_mio_0_1} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_CAN1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 1}}} \
        PS_CRL_CAN1_REF_CTRL_FREQMHZ {100} \
        PS_MIO0 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO1 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_canfd1__lpd_mio_4_5} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_CAN1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 4 .. 5}}} \
        PS_CRL_CAN1_REF_CTRL_FREQMHZ {100} \
        PS_MIO4 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO5 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_canfd1__lpd_mio_8_9} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_CAN1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 8 .. 9}}} \
        PS_CRL_CAN1_REF_CTRL_FREQMHZ {100} \
        PS_MIO8 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO9 {{USAGE Reserved}                                   {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
}

# I2C Controller 0
#-------------------------------------------------------------------

if {${evb1001_lpdi2c0__lpd_mio_2_3} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 2 .. 3}}} \
        PS_MIO2 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_lpdi2c0__lpd_mio_6_7} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 6 .. 7}}} \
        PS_MIO6 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO7 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_lpdi2c0__lpd_mio_10_11} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 10 .. 11}}} \
        PS_MIO10 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO11 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
}

# I2C Controller 1
#-------------------------------------------------------------------

if {${evb1001_lpdi2c1__lpd_mio_0_1} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 1}}} \
        PS_MIO0 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO1 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_lpdi2c1__lpd_mio_4_5} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 4 .. 5}}} \
        PS_MIO4 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO5 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
} elseif {${evb1001_lpdi2c1__lpd_mio_8_9} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_I2C1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 8 .. 9}}} \
        PS_MIO8 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO9 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
}

# SPI Controller 0
#-------------------------------------------------------------------

if {${evb1001_spi0__lpd_mio_0_5} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_SPI0 {{PERIPHERAL_ENABLE 1} {PERIPHERAL_IO {PS_MIO 0 .. 5}} {GRP_SS0_ENABLE 1} {GRP_SS0_IO {PS_MIO 3}}} \
        PS_MIO0 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO4 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO5 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
    if {${evb1001_spi0__cs1} == "yes"} {
      set_property -dict [list \
        CONFIG.PS_PMC_CONFIG { \
          PS_SPI0 {{GRP_SS1_ENABLE 1} {GRP_SS1_IO {PS_MIO 2}}} \
          PS_MIO2 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        } \
      ] [get_bd_cells versal_ps]
    }
    if {${evb1001_spi0__cs2} == "yes"} {
      set_property -dict [list \
        CONFIG.PS_PMC_CONFIG { \
          PS_SPI0 {{GRP_SS2_ENABLE 1} {GRP_SS2_IO {PS_MIO 1}}} \
          PS_MIO1 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        } \
      ] [get_bd_cells versal_ps]
    }
}

# LPD SWDT Controller
#-------------------------------------------------------------------

if {${evb1001_lpdswdt__lpd_mio_0_5} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_WWDT0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 5}}} \
        PS_MIO1 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO2 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO3 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO4 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO5 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
    if {${evb1001_lpdswdt__clk_apb} == "yes"} {
        set_property -dict [list \
          CONFIG.PS_PMC_CONFIG { \
            PS_WWDT0_CLK {{ENABLE 0} {IO APB}} \
          } \
        ] [get_bd_cells versal_ps]
    } elseif {${evb1001_lpdswdt__clk_mio_0} == "yes"} {
        set_property -dict [list \
          CONFIG.PS_PMC_CONFIG { \
            PS_WWDT0_CLK {{ENABLE 0} {IO {PS_MIO 0}}} \
            PS_MIO0  {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
          } \
        ] [get_bd_cells versal_ps]
    }
}

# FPD SWDT Controller
#-------------------------------------------------------------------

if {${evb1001_fpdswdt__lpd_mio_6_11} == "yes"} {
    set_property -dict [list \
      CONFIG.PS_PMC_CONFIG { \
        PS_WWDT1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 6 .. 11}}} \
        PS_MIO7  {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO8  {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO9  {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO10 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
        PS_MIO11 {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
      } \
    ] [get_bd_cells versal_ps]
    if {${evb1001_fpdswdt__clk_apb} == "yes"} {
        set_property -dict [list \
          CONFIG.PS_PMC_CONFIG { \
            PS_WWDT1_CLK {{ENABLE 0} {IO APB}} \
          } \
        ] [get_bd_cells versal_ps]
    } elseif {${evb1001_fpdswdt__clk_mio_1} == "yes"} {
        set_property -dict [list \
          CONFIG.PS_PMC_CONFIG { \
            PS_WWDT1_CLK {{ENABLE 0} {IO {PS_MIO 6}}} \
            PS_MIO6  {{USAGE Reserved} {DRIVE_STRENGTH 12mA} {SLEW fast} {PULL disable} {SCHMITT 0}} \
          } \
        ] [get_bd_cells versal_ps]
    }
}

# LPD GPIO
#-------------------------------------------------------------------

if {${evb1001_gpio__lpd_mio_0} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO0  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_1} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO1  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_2} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO2  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_3} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO3  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_4} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO4  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_5} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO5  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_6} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO6  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_7} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO7  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_8} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO8  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_9} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO9  {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_10} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO10 {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__lpd_mio_11} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PS_MIO11 {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

# PMC GPIO
#-------------------------------------------------------------------

if {${evb1001_gpio__pmc_mio_12} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PMC_MIO12 {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}

if {${evb1001_gpio__pmc_mio_37} == "yes"} {
    set_property -dict [list CONFIG.PS_PMC_CONFIG { \
      PMC_MIO37 {{USAGE GPIO} {DIRECTION inout} {DRIVE_STRENGTH 12mA} {OUTPUT_DATA default} {PULL pulldown} {SCHMITT 0} {SLEW fast}}} \
    ] [get_bd_cells versal_ps]
}
