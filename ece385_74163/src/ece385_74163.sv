module ece385_74163(
        input logic CLRN,
        input logic CLK,
        input logic A, B, C, D,
        input logic ENP,
        output logic RCO,
        output logic QA, QB, QC, QD,
        input logic ENT,
        input logic LOADN
    );
    
    logic [3:0] Q;
    
    assign {QD, QC, QB, QA} = Q;
    assign RCO = (Q == 4'b1111) && ENT;
    
    always_ff @(posedge CLK) begin
        if(!CLRN)
            Q <= 4'b0;
        else if(!LOADN)
            Q <= {D, C, B, A};
        else if (ENP && ENT)
            Q <= Q + 4'b0001;
    end
    
endmodule
