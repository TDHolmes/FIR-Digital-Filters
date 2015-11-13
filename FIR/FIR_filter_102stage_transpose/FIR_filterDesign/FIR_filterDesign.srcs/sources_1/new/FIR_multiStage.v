`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2015 10:09:04 AM
// Design Name: 
// Module Name: FIR_multiStage
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


module FIR_multiStage #( parameter DWIDTH = 16, STAGES = 102)
(
  //  output [DWIDTH-1:0] a_out,
    output signed [2*DWIDTH-1:0] b_out,
    input signed [DWIDTH-1:0] a_in,
   // input [2*DWIDTH-1:0] b_in,
    input signed [STAGES*DWIDTH-1:0] h_in,
    input CLK,
    input RESET
);

    genvar i;
    
    generate
        wire signed [2*DWIDTH-1:0] B[STAGES:0];
        wire signed [DWIDTH-1:0] A[STAGES:0];
        assign B[0] = 1'b0;
        assign A[0] = a_in;
        
        FIR_block U(.a_out(A[1]), 
                    .b_out(B[1]), 
                    .a_in(A[0]), 
                    .b_in(B[0]), 
                    .h_in(h_in[STAGES*DWIDTH-1:(STAGES-1)*DWIDTH]), 
                    .CLK(CLK), 
                    .RESET(RESET));
                
        for(i = 1; i < (STAGES); i = i+1) begin
            FIR_block U(.a_out(A[i+1]), 
                        .b_out(B[i+1]), 
                        .a_in(A[i]), 
                        .b_in(B[i]), 
                        .h_in(h_in[(STAGES-i)*DWIDTH-1:(STAGES-i-1)*DWIDTH]), 
                        .CLK(CLK), 
                        .RESET(RESET));
        end
        assign b_out = B[STAGES];
      //  assign a_out = A[STAGES-1];
    endgenerate

//    always @ (posedge CLK or RESET)
//    begin
        
//    end
    
    
endmodule
