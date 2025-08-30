module ece385_74109 (
    input logic      CLRN1,
    input logic      J1, KN1,
    input logic      CLK1,
    input logic      PREN1,
    output logic     Q1,
    output logic     QN1,

    input logic      CLRN2,
    input logic      J2, KN2,
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
                unique case({J1, KN1})
                        2'b00: begin
                            Q1 <= 1'b0;
                            QN1 <= 1'b1;
                        end
                        2'b01: begin
                            Q1 <= Q1;
                            QN1 <= QN1;
                        end
                        2'b10: begin
                            Q1 <= ~Q1;
                            QN1 <= ~QN1;                            
                        end
                        2'b11: begin
                            Q1 <= 1'b1;
                            QN1 <= 1'b0;
                        end
                endcase 
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
                unique case({J2, KN2})
                        2'b00: begin
                            Q2 <= 1'b0;
                            QN2 <= 1'b1;
                        end
                        2'b01: begin
                            Q2 <= Q2;
                            QN2 <= QN2;
                        end
                        2'b10: begin
                            Q2 <= ~Q2;
                            QN2 <= ~QN2;                            
                        end
                        2'b11: begin
                            Q2 <= 1'b1;
                            QN2 <= 1'b0;
                        end
                endcase 
            end
        endcase
    end

endmodule
