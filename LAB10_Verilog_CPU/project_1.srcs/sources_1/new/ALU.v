`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 02:10:09 PM
// Design Name: 
// Module Name: ALU
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


module ALU ( 
    input [3:0] ALU_control, Ain, Bin, 
    output reg [3:0] ALU_out, 
    output reg V, Z, C
); 
    reg [3:0] Bcom;    
    always @(ALU_control or Ain or Bin) begin
        Bcom=~Bin+1;
        casez (ALU_control)
            4'b0001: {C, ALU_out} = Ain + Bin;            // Addition
            4'b0010: {C, ALU_out} = Ain + Bcom;     // Subtraction (2's complement)
            4'b0101: ALU_out = Ain & Bin;                 // Bitwise AND
            4'b0110: ALU_out = Ain | Bin;                 // Bitwise OR
            4'b0111: ALU_out = ~Ain;                      // Bitwise NOT
            4'b10??: ALU_out = Ain << 2;                  // Logical shift left by 2
            4'b11??: ALU_out = Ain >> 2;                  // Logical shift right by 2
            default: ALU_out = 4'b0000;                   // Default case (set ALU_out to 0)
        endcase

        if (ALU_out == 4'b0000) 
            Z = 1; 
        else 
            Z = 0;

      if (((ALU_control == 4'b0001) && (Ain[3] == Bin[3] && ALU_out[3] != Ain[3])) || ((ALU_control == 4'b0010) && ALU_out[3] == 1))
            V = 1;
        else 
            V = 0;

    end

endmodule

