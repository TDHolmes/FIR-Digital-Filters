`timescale 1ns / 1ps



module tb_FIR_multiStage

#(parameter DWIDTH = 16, parameter STAGES = 102)

;
    reg signed [2*DWIDTH-1:0] B;
    reg RESET;
    reg CLK;
    reg ENABLE;
    wire signed [DWIDTH-1:0] A;
    wire signed [2*DWIDTH-1:0] Y;
    wire signed [DWIDTH-1:0] A_OUT;
    wire signed [DWIDTH*STAGES-1:0] COEFDATA;
    
    mySAMPLEMem_PART2 MEM
    (
       .CLK(CLK), 
       .RESET(RESET),
       .ENABLE(ENABLE),
       .DATA(A),
       .COEFDATA(COEFDATA)
    );

    FIR_multiStage UUT
    (
       // .a_out(A_OUT),
        .b_out(Y),
        .a_in(A),
        //.b_in(B),
        .h_in(COEFDATA),
        .CLK(CLK),
        .RESET(RESET)
    );
    
    always begin
        #50; CLK = 0; #50; CLK = 1;
    end
    
    initial begin
        RESET = 0; #100; RESET = 1; #100; RESET = 0; 
        ENABLE = 1;
        $display("%d", Y);    
    end
endmodule