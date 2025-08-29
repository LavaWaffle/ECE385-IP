module ece385_74151(
        input logic D0, D1, D2, D3, D4, D5, D6, D7,
        output logic Y, W,
        input logic GN, A, B, C
    );
    
    /* ELON MUX */
    assign Y = {D7,D6,D5,D4,D3,D2,D1,D0}[{C,B,A}] & ~GN;
    assign W = ~Y;
    
endmodule
