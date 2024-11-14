`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:12:02 PM
// Design Name: 
// Module Name: segment_display
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


module segment_display(
    output reg [6:0] seg,
    input refresh_rate,
    output reg [3:0] an,
    input [4:0] count
    );
    
    reg [1:0]display_index = 0;
    reg [6:0] seg_tens,seg_units,first_seg,second_seg;
    wire [4:0] tens = count/10;
    wire [4:0] units= count%10;

    always@(*) begin
        case (tens)
            5'b00000 : seg_tens = 7'b1000000; // Display "0"
            5'b00001 : seg_tens = 7'b1111001; // Display "1"
        endcase

    // Segment encoding for units place
        case (units)
            5'b00000 : seg_units = 7'b1000000; // Display "0"
            5'b00001 : seg_units = 7'b1111001; // Display "1"
            5'b00010 : seg_units = 7'b0100100; // Display "2"
            5'b00011 : seg_units = 7'b0110000; // Display "3"
            5'b00100 : seg_units = 7'b0011001; // Display "4"
            5'b00101 : seg_units = 7'b0010010; // Display "5"
            5'b00110 : seg_units = 7'b0000010; // Display "6"
            5'b00111 : seg_units = 7'b1111000; // Display "7"
            5'b01000 : seg_units = 7'b0000000; // Display "8"
            5'b01001 : seg_units = 7'b0010000; // Display "9"
            default : seg_units = 7'b1111111; // Blank
        endcase
   end     
    
    always @(posedge refresh_rate) begin
        case (display_index)
            2'b00: begin
                if(count == 0) seg = 7'b1000111; 
                else seg = seg_units;
                an = 4'b1110; 
            end
            2'b01: begin 
                if(count == 0) seg = 7'b1000111; 
                else    seg = seg_tens;
                an = 4'b1101; 
            end
            2'b10: begin 
                if(count == 0) seg = 7'b1000001;
                else seg = 7'b1111111;
                an = 4'b1011; 
            end
            2'b11: begin
                if (count == 0) seg = 7'b0001110; 
                else seg = 7'b0001100;
                an = 4'b0111; 
            end
            default: an = 4'b1111; 
        endcase

        display_index = display_index + 1;
    end
    
endmodule
