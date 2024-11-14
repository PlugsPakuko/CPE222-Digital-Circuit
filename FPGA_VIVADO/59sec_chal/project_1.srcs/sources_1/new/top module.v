`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 09:53:12 AM
// Design Name: 
// Module Name: top module
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
    input [0:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [5:0] led
    );

    wire sec;
    wire refresh_rate;
    divider(clk, sec); //Get 1Hz
    SegRefreshRate(clk, refresh_rate);
    counter(sw,sec,led); // 1Hz to count and store in LED
    SegDisplay2Digits_59(led, refresh_rate, an, seg);  //Display based on LED and refresh rate at clk

endmodule
