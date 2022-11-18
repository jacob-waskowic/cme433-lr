`timescale 1 ns / 1 ps

module exact_mult_tb;

logic signed [7:0] a, b;
logic signed [15:0] y, y_exact;
logic correct = 1'b1;
logic clk;

initial clk = 1'b0;

always #0.5 clk = ~clk; // 1 MHz clock

// Random inputs
always @ (posedge clk)
	begin
		a <= $random % (2**7);
		b <= $random % (2**7);
	end

// Simulation Length
initial #1000 $stop;


// Instantiate parity modules
exact_mult mult1(.a(a), .b(b), .y(y));
assign y_exact = a * b;

// Verify parity_davio module by comparing to conventional
always @ (posedge clk)
if (y == y_exact)
	correct <= 1'b1;
else
	correct <= 1'b0;


endmodule
