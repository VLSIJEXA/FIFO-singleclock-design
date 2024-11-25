# FIFOsingle clock design
Overview
This repository contains a Verilog implementation of a single-clock First-In, First-Out (FIFO) buffer. The FIFO is designed to store 8-bit data across 64 locations, providing basic operations for writing to and reading from the buffer while managing full and empty conditions.

# Features
Single-Clock Operation: All operations (write and read) are synchronized to a single clock signal.
Asynchronous Reset: The FIFO can be reset asynchronously, clearing its contents and pointers.
Status Flags: It includes flags to indicate whether the FIFO is full or empty.
Data Width: Each entry in the FIFO is 8 bits, allowing for a variety of data types.
Module Description
FIFO_singleclock_jk
This module implements the FIFO functionality with the following ports:

# Inputs:

clk: Clock signal.
rst: Asynchronous reset signal.
wr_en: Write enable signal.
rd_en: Read enable signal.
buf_in: Data input for writing to the FIFO.
# Outputs:

buf_out: Data output for reading from the FIFO.
fifo_counter: Number of items currently in the FIFO.
buf_empty: Flag indicating if the FIFO is empty.
buf_full: Flag indicating if the FIFO is full.
# Internal Structure
Memory: An array buf_mem stores up to 64 entries of 8-bit data.
Pointers: Two pointers (wr_ptr and rd_ptr) track the write and read positions in the FIFO.
FIFO Counter: A counter keeps track of the number of items in the FIFO, updating on each write and read operation.
# Key Functionality
Write Operation: Data can be written to the FIFO if it is not full. The write pointer is incremented accordingly.
Read Operation: Data can be read from the FIFO if it is not empty. The read pointer is incremented, and the output is updated with the data from the current read position.
Status Management: The FIFO keeps track of its state (full or empty) and updates the status flags based on the current counter.
Testbench
The repository also includes a comprehensive testbench to validate the FIFO's functionality. It covers:

Writing data into the FIFO.
Reading data from the FIFO.
Checking the FIFO's status flags.
Ensuring proper behavior when attempting to write to a full FIFO or read from an empty one.
![ZpQBuCY](https://github.com/user-attachments/assets/58bb0268-c9ce-48f0-838c-072829c516b1)

# Usage
To use the FIFO design in your projects:
The Avalon® -ST Single-Clock and Avalon® -ST Dual-Clock FIFO cores are FIFO buffers that operate with a common clock and independent clocks for the input and output ports, respectively.
Figure. Avalon® -ST Single-Clock FIFO Core
![JcDc8Ol](https://github.com/user-attachments/assets/cf3e7ddf-cd51-4287-8812-28e12de5f876)

# Timing digram:
![YDLS81P](https://github.com/user-attachments/assets/5b8f7ce7-ba5e-498d-a430-3c1293d5b360)

# Clone the repository.
Include the FIFO_singleclock_jk module in your Verilog project.
Instantiate the FIFO module and connect it to your clock and reset logic.
License
This project is licensed under the MIT License. See the LICENSE file for details.


