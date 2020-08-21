`timescale 1ns / 1ps

module PL_LUT 
    #(parameter D_WIDTH = 32,                   // data width in bits
      parameter D_DEPTH = 1024)                 // data depth in words. Also used for Read and Write pointer length.

     (input wire [D_WIDTH-1:0] i_data,          // data to be written to the FIFO must appear here
      input wire i_clk,                         // FIFO clock. Connected to PS clock. See BD
      input wire i_rden,                        // FIFO read signal 
      input wire i_wren,                        // FIFO write signal
      input wire i_rst,                         // FIFO synchronous reset signal            
      output reg [D_WIDTH-1:0] o_data,          // data read from the FIFO will appear here
      output wire o_full,                       // last available memory location filled (i.e. maximum depth utilization has been reached)
      output wire o_empty,                      // the only available value in memory has been read (i.e. the FIFO is simply empty)
      output wire o_error);                     // either a word was written to a full FIFO or a value was read from an empty FIFO (i.e. an error has occured)

    // over and under error internal registers
    reg o_over_error_internal, o_under_error_internal;
    
    // computes the next address to write and is used in o_full computation
    wire [$clog2(D_DEPTH)-1:0] next_wr_addr;

    // memory pointers
    reg [$clog2(D_DEPTH)-1:0] rd_pointer_addr; 
    reg [$clog2(D_DEPTH)-1:0] wr_pointer_addr; 

    /* instantiate the memory based on
       the selected implementation mode. LUTs in this case */ 
       (* ram_style = "distributed" *) reg [D_WIDTH-1:0] ram[D_DEPTH-1:0];
            
    // write to the FIFO if the write signal is active
    always @ (posedge i_clk)
        begin
            // write
            if (i_wren)
                ram[wr_pointer_addr] <= i_data;
        end

    // read from the FIFO if the read signal is active
    always @ (posedge i_clk)
        begin
            // read   
            if (i_rden)
                o_data <= ram[rd_pointer_addr];
        end  
        
    
    // handle the write pointer
    always @(posedge i_clk)
    if (i_rst)
        begin
            wr_pointer_addr <= 0;
            o_over_error_internal  <= 0;
        end else if (i_wren)
        begin
            // Update the FIFO write address pointer any time a write is made to
            // the FIFO and it's not FULL.
            //
            // OR any time a write is requested to the FIFO at the same time as a
            // read is requested from the FIFO.
            if ((!o_full)||(i_rden))
                wr_pointer_addr <= (wr_pointer_addr + 1'b1);
            else
                o_over_error_internal <= 1'b1;
        end


    // handle the read pointer and 
    always @(posedge i_clk)
        if (i_rst)
        begin
            rd_pointer_addr <= 0;
            o_under_error_internal <= 0;
        end else if (i_rden)
        begin
            // On any read request, increment the pointer if the FIFO isn't
            // empty--independent of whether a write operation is taking
            // place at the same time.
            if (!o_empty)
                rd_pointer_addr <= rd_pointer_addr + 1'b1;
            else
                // If a read is requested, but the FIFO was empty, set
                // an underflow error flag.
                o_under_error_internal <= 1'b1;
        end

	// compute status signals
    assign	next_wr_addr = wr_pointer_addr + 1'b1;                           // used for o_full status signal computation
    assign	o_full  = (next_wr_addr == rd_pointer_addr);                     // NOTE: when FIFO is full, one memory cell remains unfilled
    assign	o_empty = (wr_pointer_addr  == rd_pointer_addr);                 // straightforward
    assign  o_error = o_under_error_internal | o_over_error_internal;        // either an overflow occurred or an underflow occurred
   
    
    
endmodule