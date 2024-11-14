`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 09:59:43 AM
// Design Name: 
// Module Name: counter
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


module counter(input sw, input clk_in, output reg [5:0] led);
    initial led = 6'b000000;
    always @(posedge clk_in, negedge sw)
    begin
        if(sw == 0)
            led <= 6'b000000; 
        else if(led==6'b111011)
            led <= 6'b000000;
        else 
            led <= led + 1;
    end
endmodule
