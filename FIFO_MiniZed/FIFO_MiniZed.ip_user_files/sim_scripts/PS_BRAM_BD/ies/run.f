-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/axi_bram_ctrl_v4_1_1 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_axi_bram_ctrl_0_0/sim/PS_BRAM_BD_axi_bram_ctrl_0_0.vhd" \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_axi_bram_ctrl_1_0/sim/PS_BRAM_BD_axi_bram_ctrl_1_0.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_3 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_blk_mem_gen_0_0/sim/PS_BRAM_BD_blk_mem_gen_0_0.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_5 -sv \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_processing_system7_0_0/sim/PS_BRAM_BD_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_rst_ps7_0_50M_0/sim/PS_BRAM_BD_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_18 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_19 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_19 \
  "../../../../FIFO_MiniZed.srcs/sources_1/bd/PS_BRAM_BD/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_auto_pc_0/sim/PS_BRAM_BD_auto_pc_0.v" \
  "../../../bd/PS_BRAM_BD/ip/PS_BRAM_BD_auto_pc_1/sim/PS_BRAM_BD_auto_pc_1.v" \
  "../../../bd/PS_BRAM_BD/sim/PS_BRAM_BD.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

