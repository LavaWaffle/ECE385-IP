module ece385_74194(
        input logic CLRN,
        input logic SR,
        input logic A, B, C, D,
        input logic SL,
        output logic QA, QB, QC, QD,
        input logic CLK,
        input logic S1, S0
    );
    
    logic [3:0] Q;
    
    assign {QA, QB, QC, QD} = Q;
    
    always_ff @(posedge CLK or negedge CLRN) begin
        if(!CLRN)
            Q <= 4'b0;
        else if(S1 && S0)
            Q <= {A, B, C, D};
        else if(!S1 && S0)
            Q <= {SR, Q[3:1]};
        else if(S1 && !S0)
            Q <= {Q[2:0], SL};
    end
    
endmodule
