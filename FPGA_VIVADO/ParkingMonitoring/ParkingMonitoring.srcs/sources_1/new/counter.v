`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:12:02 PM
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


module counter(
    input [15:0] sw,      // 16-bit switch input
    output reg [4:0] count // 4-bit output representing the count of switches that are off
);

    integer i; 

    always @(*) begin
        count = 5'b00000; // Initialize count to 0
        for (i = 0; i < 16; i = i + 1) begin
            if (sw[i] == 1'b0) begin
                count = count + 1;
            end
        end
    end
endmodule

