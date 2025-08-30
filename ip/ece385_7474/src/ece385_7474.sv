module ece385_7474 (
    input logic      CLRN1,
    input logic      D1,
    input logic      CLK1,
    input logic      PREN1,
    output logic     Q1,
    output logic     QN1,

    input logic      CLRN2,
    input logic      D2,
    input logic      CLK2,
    input logic      PREN2,
    output logic     Q2,
    output logic     QN2
);
  
    always_ff @ (posedge CLK1 or posedge (!PREN1 & CLRN1) or posedge (PREN1 & !CLRN1) or posedge (!PREN1 & !CLRN1)) begin
        unique case ({PREN1, CLRN1})
            2'b00: begin
                Q1 <= 1'b1;
                QN1 <= 1'b1;
            end
            2'b01: begin
                Q1 <= 1'b1;
                QN1 <= 1'b0;
            end
            2'b10: begin
                Q1 <= 1'b0;
                QN1 <= 1'b1;
            end
            2'b11: begin
                Q1 <= D1;
                QN1 <= ~D1;
            end  
        endcase
    end
    
    always_ff @ (posedge CLK2 or posedge (!PREN2 & CLRN2) or posedge (PREN2 & !CLRN2) or posedge (!PREN2 & !CLRN2)) begin
        unique case ({PREN2, CLRN2})
            2'b00: begin
                Q2 <= 1'b1;
                QN2 <= 1'b1;
            end
            2'b01: begin
                Q2 <= 1'b1;
                QN2 <= 1'b0;
            end
            2'b10: begin
                Q2 <= 1'b0;
                QN2 <= 1'b1;
            end
            2'b11: begin
                Q2 <= D2;
                QN2 <= ~D2;
            end  
        endcase
    end

endmodule
