// Code your design here

module adder_subtractor_4bit (
    input  [3:0] A,      
    input  [3:0] B,       
    input        M,       // Mode control: 0 = Add, 1 = Subtract
    output [3:0] SUM,     
    output       Cout);

    wire [3:0] B_xor;     // Modified B after XOR with M
    wire Cin;

    assign B_xor = B ^ {4{M}};  // XOR each bit of B with M
    assign Cin = M;             // If M=1 → Add 1 for 2’s complement

    // Perform addition using built-in '+' operator
    assign {Cout, SUM} = A + B_xor + Cin;

endmodule
