module top(
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [15:0] y;
);

logic [5:0] mult_out_exact;
logic [3:0] mult_out_approx_two_bits;
logic [5:0] mult_out_approx_three_bits;
logic [2:0] a1, b1, a2, b2;
logic [1:0] a3, b3;

assign a1 = a[7:5];
assign a2 = a[]

exact_mult exact_mult(
    .a(a1),
    .b(b1),
    .y(mult_out_approx_two_bits)
);

approx_mult #(.NUM_BITS(2)) approx_mult_two_bits(
    .a(a2),
    .b(b2),
    .y(mult_out_approx_two_bits)
);

approx_mult #(.NUM_BITS(3)) approx_mult_three_bits(
    .a(a3),
    .b(b3),
    .y(mult_out_approx_three_bits)
);



endmodule : top
