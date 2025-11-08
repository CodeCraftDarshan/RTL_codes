`timescale 1ns/1ps

module adder_subtractor_4bit_tb;

    reg  [3:0] A, B;
    reg        M;         // Mode: 0=Add, 1=Subtract
    wire [3:0] SUM;
    wire       Cout;
    adder_subtractor_4bit uut (
        .A(A),
        .B(B),
        .M(M),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("adder_subtractor_4bit.vcd");
      $dumpvars(0, adder_subtractor_4bit_tb);
        $display("  Time |M| A | B | Result | Cout ");
      $monitor("%5t |%b | %b | %b |    %b   |  %b",
                 $time, M, A, B, SUM, Cout);
        M = 0;  A = 4'b0101;  B = 4'b0011;  #10; // 5 + 3 = 8
        M = 1;  A = 4'b1010;  B = 4'b0011;  #10; // 10 - 3 = 7
        M = 1;  A = 4'b0011;  B = 4'b0100;  #10; // 3 - 4 = -1 (1111)
        M = 0;  A = 4'b1111;  B = 4'b0001;  #10; // 15 + 1 = 16 (Carry=1)
        $finish;
    end

endmodule
