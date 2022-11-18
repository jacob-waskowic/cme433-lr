module exact_fa
(
    input logic a, b, cin,
    output logic cout, s
);

assign cout = (a & b) | (a & cin) | (b & cin);
assign s = a ^ b ^ cin; 

endmodule : exact_fa