`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2015 09:44:51 AM
// Design Name: 
// Module Name: FIR_block
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


module FIR_block #(parameter DWIDTH = 16)
(
    output reg signed [DWIDTH-1:0] a_out,
    output reg signed [2*DWIDTH-1:0] b_out,
    input signed [DWIDTH-1:0] a_in,
    input signed [2*DWIDTH-1:0] b_in,
    input signed [DWIDTH-1:0] h_in,
    input CLK,
    input RESET
    );
    
    always @ (posedge CLK or posedge RESET) 
    begin
        if(RESET)
        begin
            a_out = 0;
        end
        else begin
            a_out = a_in;
        end
    end
    
    always @(*)
    begin
        b_out = (a_in * h_in) + b_in;
    end
    
endmodule
