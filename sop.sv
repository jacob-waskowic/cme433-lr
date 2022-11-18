module sop(
		input signed [7:0] a, b, c, d, e, f,
		output [31:0] y);
		
reg signed [15:0] m1, m2, m3;

assign m1 = a * b;
assign m2 = c * d;
assign m3 = e * f;

assign y = m1 + m2 + m3;

endmodule 

	