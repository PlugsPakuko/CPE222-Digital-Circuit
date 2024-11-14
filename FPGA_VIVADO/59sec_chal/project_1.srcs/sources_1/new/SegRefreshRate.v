`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 04:34:07 AM
// Design Name: 
// Module Name: SegRefreshRate
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


module SegRefreshRate(
    input clk,
    output clk_out
    );
    reg elapsed = 0;
    reg [27:0] state = 0; 
    always @ (posedge clk) 
        if (state == 10000) state <= 0; 
        else state <= state + 1; 
    always @(state) 
        if (state == 10000) elapsed = 1; 
        else elapsed = 0; 
    assign clk_out = elapsed; 
endmodule
