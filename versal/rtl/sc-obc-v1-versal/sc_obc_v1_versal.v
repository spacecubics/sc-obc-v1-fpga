//-----------------------------------------------------------------------------
// Copyright 2025 Space Cubics Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------------------
// Space Cubics Inc.
//  SC-OBC module V1 Versal FPGA
//  Module: SC-OBC module V1 Top module (sc_obc_v1_versal)
//-----------------------------------------------------------------------------

module sc_obc_v1_versal (
  output DDR4_CK_T,
  output DDR4_CK_C,
  output DDR4_CKE,
  output DDR4_CS_N,
  output DDR4_ODT,
  output DDR4_ACT_N,
  output [16:0] DDR4_A,
  input DDR4_ALERT_N,
  inout [8:0] DDR4_DM_N,
  output DDR4_BG,
  output [1:0] DDR4_BA,
  output DDR4_RESET_N,
  inout [71:0] DDR4_DQ,
  inout [8:0]DDR4_DQS_T,
  inout [8:0]DDR4_DQS_C,
  output DDR4_PARITY
);

versal_ps_bd versal_ps_bd (
  .DDR4_act_n(DDR4_ACT_N),
  .DDR4_adr(DDR4_A),
  .DDR4_alert_n(DDR4_ALERT_N),
  .DDR4_ba(DDR4_BA),
  .DDR4_bg(DDR4_BG),
  .DDR4_ck_c(DDR4_CK_C),
  .DDR4_ck_t(DDR4_CK_T),
  .DDR4_cke(DDR4_CKE),
  .DDR4_cs_n(DDR4_CS_N),
  .DDR4_dm_n(DDR4_DM_N),
  .DDR4_dq(DDR4_DQ),
  .DDR4_dqs_c(DDR4_DQS_C),
  .DDR4_dqs_t(DDR4_DQS_T),
  .DDR4_odt(DDR4_ODT),
  .DDR4_par(DDR4_PARITY),
  .DDR4_reset_n(DDR4_RESET_N)
);

endmodule
