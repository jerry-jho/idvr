////////////////////////////////////////////////////////////////
// (c) 2018
// IDVR Modules
//
////////////////////////////////////////////////////////////////

`ifndef FFD
`define FFD 1
`endif

module idvr_sext #(
    parameter IW=2,
    parameter OW=3
) (
    input  [IW-1:0]  I,
    output [OW-1:0]  O
);

    /*///
    This module performs signed extension
    *////
    
    assign O = {{(OW-IW){I[IW-1]}},I};

endmodule

