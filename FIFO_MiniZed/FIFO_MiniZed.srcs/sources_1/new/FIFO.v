/* -----------------------------------------------------------------
    COPYRIGHT: ...
    FILE NAME: FIFO.v
    TYPE: module
    DEPARTMENT: Electrical and Computer Engineering
    OCCUPATION: Student
    AUTHOR: GIORGI APTSIAURI
    AUTHOR's EMAIL: aptsiauri98@gmail.com, gaptsiauri@sdsu.edu
    MENTOR: Dr. Amir Alimohammad
    MENTOR's EMAIL: aalimohammad@sdsu.edu
    ----------------------------------------------------------------
    RELEASE HISTORY: ...
    ----------------------------------------------------------------
    keywords: FIFO, buffer, FIFO buffer
    ----------------------------------------------------------------
    purpose/description: - top-level FIFO buffer module, with three status flags: full, empty, error
                         - reading is synchronous
                         - writing is synchronous
                         - memory mode I will use is "Simple Dual Port", where read and write can happen on different addresses
--------------------------------------------------------------------*/  

//  PLEASE specify one of these 3 as a default parameter value on line 31

`define PL_LUT          5'b00001      // Implementation of the queue on the FPGA fabric utilizing the least lookup-tables (LUTs).
`define PL_BRAM         5'b00010      // Implementation of the queue on the FPGA fabric utilizing on-chip block RAM (BRAM) resources.
`define PS_BRAM         5'b00100      // Implementation of the queue on the Processing System utilizing on-board BRAM units.
`define PS_DRAM         5'b01000      // Implementation of the queue on the Processing System utilizing on-board DRAM units. 

module FIFO 
    // modify these parameters as needed
    #(parameter D_WIDTH = 8,                    // data width in bits. 
      parameter D_DEPTH = 1024,                 // data depth in words. Also used for Read and Write pointer length.
      parameter MODE = `PS_BRAM)                // SPECIFY default implementation mode here

     (input wire [D_WIDTH-1:0] i_data,          // data to be written to the FIFO must appear here
      // FIFO clock is omitted because it is connected to the PS clock in the BD
      input wire i_rden,                        // FIFO read signal 
      input wire i_wren,                        // FIFO write signal
      input wire i_rst,                         // FIFO synchronous reset signal            
      output wire [D_WIDTH-1:0] o_data,         // data read from the FIFO will appear here
      output wire o_full,                       // last available memory location filled (i.e. maximum depth utilization has been reached)
      output wire o_empty,                      // the only available value in memory has been read (i.e. the FIFO is simply empty)
      output wire o_error);                     // either a word was written to a full FIFO or a value was read from an empty FIFO
   
   
    /* instantiate the memory based on
       the selected implementation mode
       NOTE: all other logic is also instantiated in the appropriate modules to support proper FIFO operation */ 
    generate if (MODE == `PL_LUT) 
        begin: PL_LUT_BLOCK
            
            // instantiates the block design which facilitates systems setup for PL_LUT, i.e. FIFO has clock coming in from PS output clocks
            PL_LUT_wrapper 
            #(.D_WIDTH(D_WIDTH),
              .D_DEPTH(D_DEPTH))
            PL_LUT_wrapper_i(.i_data(i_data),
                                .i_rden(i_rden),
                                .i_wren(i_wren),
                                .i_rst(i_rst),
                                .o_data(o_data),
                                .o_full(o_full),
                                .o_empty(o_empty),
                                .o_error(o_error));
        end
        else if (MODE == `PL_BRAM) 
        begin: PL_BRAM_BLOCK
            
            // instantiates the block design which facilitates systems setup for PL_BRAM, i.e. FIFO has clock coming in from PS output clocks
            PL_BRAM_wrapper 
            #(.D_WIDTH(D_WIDTH),
              .D_DEPTH(D_DEPTH))
            PL_BRAM_wrapper_i(.i_data(i_data),
                                .i_rden(i_rden),
                                .i_wren(i_wren),
                                .i_rst(i_rst),
                                .o_data(o_data),
                                .o_full(o_full),
                                .o_empty(o_empty),
                                .o_error(o_error));
 
        end
        else if (MODE == `PS_BRAM) 
        begin: PS_BRAM_BLOCK
            // PL side configuration. Check the BD under this module in the file hierarchy for further inspection of BRAM setup.
            PS_BRAM_wrapper PS_BRAM_wrapper_i ();
        
        end
        else if (MODE == `PS_DRAM) 
        begin: PS_DRAM_BLOCK
            // PL side configuration. Check the BD under this module in the file hierarchy for further inspection of DRAM setup.
            PS_DRAM_wrapper PS_DRAM_wrapper_i();        
        
        end
    endgenerate
endmodule