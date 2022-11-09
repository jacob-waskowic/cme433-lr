module top(
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [15:0] y
);

logic [5:0] mult_out_exact;
logic [5:0] mult_out_approx_three_bits;
logic [3:0] mult_out_approx_two_bits;
logic [2:0] a1, b1, a2, b2;
logic [1:0] a3, b3;

assign a1 = a[7:5];
assign a2 = a[4:2];
assign a3 = a[1:0];
assign b1 = b[7:5];
assign b2 = b[4:2];
assign b3 = b[1:0];
assign y = {mult_out_exact, 5'd0} + {mult_out_approx_three_bits, 2'd0} + mult_out_approx_two_bits;

exact_mult exact_mult(
    .a(a1),
    .b(b1),
    .y(mult_out_exact)
);

approx_mult #(.NUM_BITS(3)) approx_mult_three_bits(
    .a(a2),
    .b(b2),
    .y(mult_out_approx_three_bits)
);

approx_mult #(.NUM_BITS(2)) approx_mult_two_bits(
    .a(a3),
    .b(b3),
    .y(mult_out_approx_two_bits)
);

endmodule : top
