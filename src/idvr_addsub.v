////////////////////////////////////////////////////////////////
// (c) 2018
// IDVR Modules
//
////////////////////////////////////////////////////////////////

`ifndef FFD
`define FFD 1
`endif

module idvr_addsub #(
    parameter W=1
) (
    input  [W-1:0]  I0,
    input  [W-1:0]  I1,
    output [W-1:0]  O,
    input  [3:0]    S
);

    /*///
    This module is for performing addition and subtraction. Overflows are ignored and the low
W bits of results are written to the output. Also the compare function is implemented.
    
    Definition on control S:
    
    0b0000 : O = I0 + I1
    0b1000 : O = I0 - I1
    0b0010 : O = $signed(I0) < $signed(I1) ? 1 : 0
    0b0011 : O = $unsigned(I0) < $unsigned(I1) ? 1 : 0
    *////
    wire adder_i0_s = (S[1] == 1'b0 || S[0] == 1'b1) ? 1'b0 : I0[W-1];
    wire [W:0] adder_i0 = {adder_i0_s,I0};
    wire adder_i1_s = (S[1:0] == 2'b10) ? I1[W-1] : 1'b0;
    wire [W:0] adder_i1 = {adder_i1_s,(S == 4'b0) ? I1 : ~I1};
    wire adder_c    = (S == 4'b0) ? 1'b1 : 1'b0;
    wire [W:0] adder_o = adder_i0 + adder_i1 + adder_c;
    assign O = S[1] == 1'b0 ? adder_o[W-1:0] : {{W-1}{1'b0},adder_o[W]};

endmodule

