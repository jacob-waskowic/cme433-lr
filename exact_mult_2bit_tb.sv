`timescale 1 ns / 1 ps

module exact_mult_2bit_tb;

logic signed [1:0] a, b;
logic signed [3:0] y, y_exact;
logic correct = 1'b1;
logic clk;

initial clk = 1'b0;

always #0.5 clk = ~clk; // 1 MHz clock

// Random inputs
always @ (posedge clk)
	begin
		a <= $random % (2**1);
		b <= $random % (2**1);
	end

// Simulation Length
initial #1000 $stop;


// Instantiate parity modules
exact_mult_2bit mult1(.a(a), .b(b), .y(y));
assign y_exact = a * b;

// Verify parity_davio module by comparing to conventional
always @ (posedge clk)
if (y == y_exact)
	correct <= 1'b1;
else
	correct <= 1'b0;


endmodule
