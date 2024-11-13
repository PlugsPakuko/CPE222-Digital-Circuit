`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 09:53:12 AM
// Design Name: 
// Module Name: bcdto7seg
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


module bcdto7seg(output reg [6:0] seg, input [5:0] led);
    always @(led)
        begin
        case (led)
          //4'b0000 : seg = 7'bABCDEFG;
            4'b0000 : seg = 7'b1000000; // Display "0"
            4'b0001 : seg = 7'b1111001; // Display "1"
            4'b0010 : seg = 7'b0100100; // Display "2"
            4'b0011 : seg = 7'b0110000; // Display "3"
            4'b0100 : seg = 7'b0011001; // Display "4"
            4'b0101 : seg = 7'b0010010; // Display "5"
            4'b0110 : seg = 7'b0000010; // Display "6"
            4'b0111 : seg = 7'b1111000; // Display "7"
            4'b1000 : seg = 7'b0000000; // Display "8"
            4'b1001 : seg = 7'b0010000; // Display "9"
            default : seg = 7'b1111111;
        endcase
    end
endmodule
