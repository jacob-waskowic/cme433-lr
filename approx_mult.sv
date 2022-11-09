module approx_mult
#(
    parameter NUM_BITS = 3
)
(
    logic [NUM_BITS-1:0] a,
    logic [NUM_BITS-1:0] b,
    logic [2*NUM_BITS-1:0] y 
);

generate
    if(NUM_BITS == 3)
    begin

    end
    else if (NUM_BITS == 2)
    begin
        
    end
    else
    begin
        assert(NUM_BITS == 2 || NUM_BITS == 3);
    end
endgenerate

endmodule : approx_mult