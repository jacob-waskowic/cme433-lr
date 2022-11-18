module approx_sop(input logic signed [7:0] a, b, c, d, e, f,
						output logic signed [31:0] y);
						
logic signed [15:0] m1, m2, m3;
						
exact_mult mult1(.a(a), .b(b), .y(m1));
approx_mult mult2(.a(c), .b(d), .y(m2));
approx_mult mult3(.a(e), .b(f), .y(m3));

assign y = m1 + m2 + m3;

endmodule 