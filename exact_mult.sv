module exact_mult(
	input logic [2:0] a, b,
	output logic [5:0] y
	);
	
	logic p00, p10, p20, 
			p01, p11, p21,
			p02, p12, p22;
	
	assign p00 = a[0] & b[0];
	assign p10 = a[1] & b[0];
	assign p20 = a[2] & b[0];
	assign p01 = a[0] & b[1];
	assign p11 = a[1] & b[1];
	assign p21 = a[2] & b[1];
	assign p02 = a[0] & b[2];
	assign p12 = a[1] & b[2];
	assign p22 = a[2] & b[2];
	
	
	always @ *
	begin
	y = {1'b1, ~p20, p10, p00} + {~p21, p11, p01, 1'b0} + {p22, ~p12, ~p02, 2'b0};
	y = {~y[5], y[4:0]};
	end
	
endmodule
		
	