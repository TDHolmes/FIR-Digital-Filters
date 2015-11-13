`timescale 1ns / 1ps



module tb_FIR_multiStage

#(parameter DWIDTH = 16)

;
    reg [DWIDTH-1:0] A;
    reg [2*DWIDTH-1:0] B;
    reg RESET;
    reg CLK;
    wire [2*DWIDTH-1:0] Y;
    wire [DWIDTH-1:0] A_OUT;
    assign COEFDATA=64'h01CA0495049501CA;

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
    
        // A = ; B = ; RESET = ; #100;
        A = DATA;
        RESET = 0;
        #1000;
    
    end
endmodule