module ece385_7485(
        input logic A_lt_B_in,
        input logic A_eq_B_in,
        input logic A_gt_B_in,
        
        output logic A_gt_B_out,
        output logic A_eq_B_out,
        output logic A_lt_B_out,
        
        input logic B3, A3, B2, A2, B1, A1, B0, A0
    );
    
    logic [3:0] A, B;
    
    assign A = {A3, A2, A1, A0};
    assign B = {B3, B2, B1, B0};
    
    always_comb begin
        if(A > B) begin
            A_gt_B_out = 1'b1;
            A_lt_B_out = 1'b0;
            A_eq_B_out = 1'b0;
        end
        else if (A < B) begin
            A_gt_B_out = 1'b0;
            A_lt_B_out = 1'b1;
            A_eq_B_out = 1'b0;           
        end
        else if(A_eq_B_in) begin
            A_gt_B_out = 1'b0;
            A_lt_B_out = 1'b0;
            A_eq_B_out = 1'b1;           
        end
        else begin
            A_gt_B_out = ~A_lt_B_in;
            A_lt_B_out = ~A_gt_B_in;
            A_eq_B_out = 1'b0;
        end
    end
    
endmodule
