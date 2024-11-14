`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:12:02 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    output [3:0] an,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg
    );
    wire rr;
    wire [4:0] count;
    SegRefreshRate(clk, rr);
    parking(sw,led);
    counter(sw, count);
    segment_display(seg,rr,an,count);
endmodule
