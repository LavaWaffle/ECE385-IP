module ece385_74195(
        input logic CLRN,
        input logic J, KN,
        input logic A, B, C, D,
        output logic QA, QB, QC, QD, QDN,
        input logic CLK,
        input logic SH_LDN
    );
    
    logic [3:0] Q;
    
    assign QDN = ~QD;
    assign {QA, QB, QC, QD} = Q;
    
    always_ff @(posedge CLK or negedge CLRN) begin
        if(!CLRN)
            Q <= 4'b0;
        else if(!SH_LDN)
            Q <= {A, B, C, D};
        else unique case({J, KN})
            2'b00:  Q <= {1'b0, Q[3:1]};
            2'b01:  Q <= {Q[3], Q[3:1]};
            2'b10:  Q <= {~Q[3], Q[3:1]};
            2'b11:  Q <= {1'b1, Q[3:1]};
        endcase   
    end
endmodule
