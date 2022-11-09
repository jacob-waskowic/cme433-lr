module exact_mult_2bit(
	input logic [1:0] a, b,
	output logic [3:0] y
	);
	
	logic p00, p10, p20, 
			p01, p11, p21,
			p02, p12, p22;
	
	assign p00 = a[0] & b[0];
	assign p10 = a[1] & b[0];
	assign p01 = a[0] & b[1];
	assign p11 = a[1] & b[1];
	
	
	always @ *
	begin
	y = {1'b1, ~p10, p00} + {p11, ~p01, 1'b0};
	y = {~y[3], y[2:0]};
	end
	
endmodule
