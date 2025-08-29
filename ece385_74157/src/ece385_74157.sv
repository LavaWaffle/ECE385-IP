module ece385_74157(
        input logic AN_B,
        input logic A1, B1,
        output logic Y1,
        input logic A2, B2,
        output logic Y2,
        input logic A3, B3,
        output logic Y3,
        input logic A4, B4,
        output logic Y4,
        input logic GN
    );
    
    always_comb begin
        if(GN)
            {Y4,Y3,Y2,Y1} = 4'b0;
        else
            {Y4,Y3,Y2,Y1} = AN_B ? {B4,B3,B2,B1} : {A4,A3,A2,A1};
    end
    
endmodule
