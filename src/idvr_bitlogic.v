////////////////////////////////////////////////////////////////
// (c) 2018
// IDVR Modules
//
////////////////////////////////////////////////////////////////

`ifndef FFD
`define FFD 1
`endif

module idvr_bitlogic #(
    parameter W=1
) (
    input  [W-1:0] I0,
    input  [W-1:0] I1,
    output [W-1:0] O,
    input  [1:0]   S
);

    /*///
    The bit logic module is for logical operations that perform bitwise AND, OR, XOR
    and NOT on I0,I1 and place the result in O. Operation NOT does not use I1
    
    Definition on control S:
    
    0b00 : XOR
    0b01 : NOT
    0b10 : OR
    0b11 : AND
    *////
    reg [W-1:0] wO;
    always @(*) begin : switch
        case (S) // synopsys parallel_case
            2'b00 : wO = I0 ^ I1;
            2'b01 : wO = ~I0;
            2'b10 : wO = I0 | I1;
            2'b11 : wO = I0 & I1;
        endcase
    end
    assign O = wO;
    

endmodule

