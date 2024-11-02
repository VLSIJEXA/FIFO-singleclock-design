`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: FIFO_singleclock_jk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// jatin katiyar project_FIFO_single clock design
//MNIT Jaipur 
// Create Date: 11/02/2024 10:10:28 AM
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_singleclock_jk(clk,rst,wr_en,rd_en,buf_in,buf_full,fifo_counter,buf_empty,buf_out );
     input clk,rst,wr_en,rd_en;
    input [7:0] buf_in;
    output [7:0] buf_out;
    output [7:0]fifo_counter;
    output buf_empty,buf_full ;
   
    reg [7:0] buf_out;
    reg buf_empty,buf_full;
    reg [6:0]fifo_counter;
   reg [3:0] rd_ptr,wr_ptr;
   reg [7:0] buf_mem[63:0]; //memory 8 bit and 64 locations
  
  //status flag
  always@(fifo_counter)begin
  buf_empty=(fifo_counter==0);
  buf_full=(fifo_counter==64);
  end
  //set the fifo counter
  always@(posedge clk or posedge rst )begin    //asynchronous reset
  if(rst)
  fifo_counter<=0;
  else if((!buf_full && wr_en)&& (!buf_empty && rd_en))
  fifo_counter<=fifo_counter;  //halt condition
   else if(!buf_full && wr_en)  //buffer is not full then writing
    fifo_counter<=fifo_counter+1;
    else if(!buf_empty && rd_en)  //buffer is not epty then reading 
    fifo_counter<=fifo_counter-1;
    else
   fifo_counter<=fifo_counter;
   end
   //fetch data from FIFO
    always@(posedge clk or posedge rst )begin
    if(rst)
  fifo_counter<=0;
  else begin
  if(rd_en && !buf_empty)
  buf_out<=buf_mem[rd_ptr];
  else
  buf_out<=buf_out;
  end
  end
  //writing data in FIFO
  always@(posedge clk )begin
   if(wr_en && !buf_full)
   buf_mem[wr_ptr]<=buf_in;
   else
   buf_mem[wr_ptr]<=buf_mem[wr_ptr];
   end
   
// to manage the pointer 
   always@(posedge clk or posedge rst )begin    //asynchronous reset
  if(rst)  begin
  wr_ptr<=0;
  rd_ptr<=0;
  end
  else begin
  if(wr_en && !buf_full) //manage head pointer
  wr_ptr<=wr_ptr+1;
  else
  wr_ptr<=wr_ptr;
  if(rd_en && !buf_empty)  //manage tail pointer
  rd_ptr<= rd_ptr+1;
  else
   rd_ptr<= rd_ptr;
   end
   end
   
endmodule
