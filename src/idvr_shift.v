////////////////////////////////////////////////////////////////
// (c) 2018
// IDVR Modules
//
////////////////////////////////////////////////////////////////

`ifndef FFD
`define FFD 1
`endif

module idvr_shift #(
    parameter W=1,
    parameter TW=5
) (
    input  [W-1:0]  I,
    input  [TW-1:0] shamt,
    output [W-1:0]  O,
    output          Err,
    input  [1:0]    S
);

    /*///
    This module is for shift on input value I. The shift type is controlled by S
    
    Definition on control S:
    
    0b00 : shift left
    0b01 : shift right
    0b11 : arithmetic shift right 
    0b10 : illegal
    *////
    reg [W-1:0] wO;
    always @(*) begin : switch
        case (S) // synopsys parallel_case
            2'b00 : wO = I << shamt;
            2'b01 : wO = I >> shamt;
            2'b10 : wO = I;
            2'b11 : wO = $signed(I) >>> shamt;
        endcase
    end
    assign O = wO;
    assign Err = (S == 2'b10);
    

endmodule

