`timescale 1ns / 1ps

module PL_BRAM_wrapper 
    #(parameter D_WIDTH = 32,                   // data width in bits
      parameter D_DEPTH = 1024)                 // data depth in words. Also used for Read and Write pointer length.

     (input wire [D_WIDTH-1:0] i_data,          // data to be written to the FIFO must appear here
      // FIFO clock is omitted because it is connected to the PS clock in the BD
      input wire i_rden,                        // FIFO read signal 
      input wire i_wren,                        // FIFO write signal
      input wire i_rst,                         // FIFO synchronous reset signal            
      output wire [D_WIDTH-1:0] o_data,         // data read from the FIFO will appear here
      output wire o_full,                       // last available memory location filled (i.e. maximum depth utilization has been reached)
      output wire o_empty,                      // the only available value in memory has been read (i.e. the FIFO is simply empty)
      output wire o_error,                      // either a word was written to a full FIFO or a value was read from an empty FIFO
      
      // the rest of the signals are used for the BD
      inout wire [14:0]DDR_addr,
        inout wire [2:0]DDR_ba,
        inout wire DDR_cas_n,
        inout wire DDR_ck_n,
        inout wire DDR_ck_p,
        inout wire DDR_cke,
        inout wire DDR_cs_n,
        inout wire [1:0]DDR_dm,
        inout wire [15:0]DDR_dq,
        inout wire [1:0]DDR_dqs_n,
        inout wire [1:0]DDR_dqs_p,
        inout wire DDR_odt,
        inout wire DDR_ras_n,
        inout wire DDR_reset_n,
        inout wire DDR_we_n,
        inout wire FIXED_IO_ddr_vrn,
        inout wire FIXED_IO_ddr_vrp,
        inout wire [31:0]FIXED_IO_mio,
        inout wire FIXED_IO_ps_clk,
        inout wire FIXED_IO_ps_porb,
        inout wire FIXED_IO_ps_srstb);                     
   
   // clock from PS
   wire PS_clk;
   
   // PL FIFO instantiation
   PL_BRAM 
   #(.D_WIDTH(D_WIDTH),
     .D_DEPTH(D_DEPTH))
   PL_BRAM_instance
   (.i_data(i_data),       
    .i_clk(PS_clk),           
    .i_rden(i_rden),          
    .i_wren(i_wren),          
    .i_rst(i_rst),           
    .o_data(o_data),          
    .o_full(o_full),         
    .o_empty(o_empty),         
    .o_error(o_error));
    
    
  // ZYNQ PS instantiation. We extract clock signal from it.  
  PL_BRAM_BD PL_BAM_BD_i
   (.DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    .FCLK_CLK0_0(PS_clk),
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb));
    
endmodule
