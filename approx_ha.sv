module approx_ha
(
    input logic a, b,
    output logic cout, s
);

always_comb
begin

case({a, b})
    2'b00:
    begin
        cout = 1'b0;
        s = 1'b0;
    end
    2'b01:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    2'b10:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    2'b11:
    begin
        cout = 1'b1;
        s = 1'b1;
    end
endcase

end
endmodule
