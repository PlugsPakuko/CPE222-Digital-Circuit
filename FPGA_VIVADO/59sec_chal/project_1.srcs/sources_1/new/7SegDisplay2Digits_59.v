`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 03:42:15 AM
// Design Name: 
// Module Name: 7SegDisplay2Digits_59
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


module SegDisplay2Digits_59(
    input [5:0] led,
    input refresh_rate,
    output reg [3:0] an,
    output reg [6:0] seg
);

    reg display_toggle = 0; // Swap Flag

    wire [3:0] tens = led / 10; // Tens place
    wire [3:0] units = led % 10; // Units place
    
    reg [6:0] seg_tens, seg_units;

    // Segment encoding for tens place
    always @(*) begin
        case (tens)
            4'b0000 : seg_tens = 7'b1000000; // Display "0"
            4'b0001 : seg_tens = 7'b1111001; // Display "1"
            4'b0010 : seg_tens = 7'b0100100; // Display "2"
            4'b0011 : seg_tens = 7'b0110000; // Display "3"
            4'b0100 : seg_tens = 7'b0011001; // Display "4"
            4'b0101 : seg_tens = 7'b0010010; // Display "5"
            default : seg_tens = 7'b1111111; // Blank
        endcase

    // Segment encoding for units place
        case (units)
            4'b0000 : seg_units = 7'b1000000; // Display "0"
            4'b0001 : seg_units = 7'b1111001; // Display "1"
            4'b0010 : seg_units = 7'b0100100; // Display "2"
            4'b0011 : seg_units = 7'b0110000; // Display "3"
            4'b0100 : seg_units = 7'b0011001; // Display "4"
            4'b0101 : seg_units = 7'b0010010; // Display "5"
            4'b0110 : seg_units = 7'b0000010; // Display "6"
            4'b0111 : seg_units = 7'b1111000; // Display "7"
            4'b1000 : seg_units = 7'b0000000; // Display "8"
            4'b1001 : seg_units = 7'b0010000; // Display "9"
            default : seg_units = 7'b1111111; // Blank
        endcase
    end

    // Toggle between displaying tens and units
    always @(posedge refresh_rate) begin
        display_toggle <= ~display_toggle;
    end

    // Select which digit to display and update `an` and `seg` accordingly
    always @(*) begin
        if (display_toggle) begin
            an = 4'b1101; // Activate tens place
            seg = seg_tens;
        end else begin
            an = 4'b1110; // Activate units place
            seg = seg_units;
        end
    end

endmodule
