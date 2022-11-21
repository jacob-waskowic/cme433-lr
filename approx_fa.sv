module approx_fa
(
    input logic a, b, cin,
    output logic cout, s
);

always_comb
begin
    case({a, b, cin})
    3'b000:
    begin
        cout = 1'b0;
        s = 1'b0;
    end
    3'b001:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    3'b010:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    3'b011:
    begin
        cout = 1'b1;
        s = 1'b0;
    end
    3'b100:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    3'b101:
    begin
        cout = 1'b1;
        s = 1'b0;
    end
    3'b110:
    begin
        cout = 1'b0;
        s = 1'b1;
    end
    3'b111:
    begin
        cout = 1'b1;
        s = 1'b0;
    end
    endcase
end

endmodule
