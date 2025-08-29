module ece385_74153(
        input logic GN1,
        input logic B, A,
        input logic C3_1, C2_1, C1_1, C0_1,
        output logic Y1,
        input logic GN2,
        input logic C3_2, C2_2, C1_2, C0_2,
        output logic Y2
    );
    
    assign Y1 = {C3_1,C2_1,C1_1,C0_1}[{B,A}] & ~GN1;
    assign Y2 = {C3_2,C2_2,C1_2,C0_2}[{B,A}] & ~GN2;
    
endmodule
