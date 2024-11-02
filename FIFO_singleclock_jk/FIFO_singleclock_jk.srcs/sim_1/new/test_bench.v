`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2024 10:50:57 AM
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 64;

    // Inputs
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] buf_in;

    // Outputs
    wire [DATA_WIDTH-1:0] buf_out;
    wire [DATA_WIDTH-1:0] fifo_counter;
    wire buf_empty;
    wire buf_full;

    // Instantiate the FIFO
    FIFO_singleclock_jk fifo_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .fifo_counter(fifo_counter),
        .buf_empty(buf_empty),
        .buf_full(buf_full)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        buf_in = 0;

        // Wait for a few clock cycles
        #10;

        // Release reset
        rst = 0;
        #10;

        // Write data to FIFO
        // Writing values 0 to 9
        wr_en = 1; buf_in = 8'h00; #10; // Write 0
        wr_en = 1; buf_in = 8'h01; #10; // Write 1
        wr_en = 1; buf_in = 8'h02; #10; // Write 2
        wr_en = 1; buf_in = 8'h03; #10; // Write 3
        wr_en = 1; buf_in = 8'h04; #10; // Write 4
        wr_en = 1; buf_in = 8'h05; #10; // Write 5
        wr_en = 1; buf_in = 8'h06; #10; // Write 6
        wr_en = 1; buf_in = 8'h07; #10; // Write 7
        wr_en = 1; buf_in = 8'h08; #10; // Write 8
        wr_en = 1; buf_in = 8'h09; #10; // Write 9
        wr_en = 0; // Disable write

        // Read data from FIFO
        rd_en = 1; #10; rd_en = 0; // Read first value
        #10; rd_en = 1; #10; rd_en = 0; // Read second value
        #10; rd_en = 1; #10; rd_en = 0; // Read third value
        #10; rd_en = 1; #10; rd_en = 0; // Read fourth value
        #10; rd_en = 1; #10; rd_en = 0; // Read fifth value
        #10; rd_en = 1; #10; rd_en = 0; // Read sixth value
        #10; rd_en = 1; #10; rd_en = 0; // Read seventh value
        #10; rd_en = 1; #10; rd_en = 0; // Read eighth value
        #10; rd_en = 1; #10; rd_en = 0; // Read ninth value
        #10; rd_en = 1; #10; rd_en = 0; // Read tenth value

        // Final checks for FIFO status
        #10;
        if (buf_empty) 
            $display("FIFO is empty.");
        else 
            $display("FIFO is not empty.");

        if (buf_full) 
            $display("FIFO is full.");
        else 
            $display("FIFO is not full.");

        // Fill the FIFO completely
        wr_en = 1; // Start writing again
        buf_in = 8'h0A; #10; // Write 10
        buf_in = 8'h0B; #10; // Write 11
        buf_in = 8'h0C; #10; // Write 12
        // Continue until the FIFO is full
        // You may want to write additional values here as needed

        // Attempt to write when full
        #10;
        wr_en = 1; buf_in = 8'h40; #10; // Attempt to write while full
        wr_en = 0; // Disable write

        // Read all data from FIFO until empty
        while (!buf_empty) begin
            #10;
            rd_en = 1; #10; rd_en = 0;
        end

        // Final check to ensure FIFO is empty
        #10;
        if (buf_empty) 
            $display("FIFO is empty after reading all data.");
        else 
            $display("FIFO still has data.");

        // End simulation
        #10;
        $stop;
    end

endmodule
