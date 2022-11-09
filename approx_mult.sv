module approx_mult
#(
    parameter NUM_BITS = 3
)
(
    logic [NUM_BITS-1:0] a,
    logic [NUM_BITS-1:0] b,
    logic [2*NUM_BITS-1:0] y 
);

generate
    if(NUM_BITS == 3)
    begin
        logic p00, p10, p20;
        logic p01, p11, p21;
        logic p22, p12, p22;

        logic c0, c1, c2, c3, c4, c5, c6;

        logic y2_tmp, y3_tmp1, y3_tmp2, y4_tmp, y5_tmp;

        //multiplication with b[0]
        always_comb
        begin
            p00 = b[0] & a[0];
            p10 = b[0] & a[1];
            p20 = b[0] & a[2];
        end

        //multiplication with b[1]
        always_comb
        begin
            p01 = b[1] & a[0];
            p11 = b[1] & a[1];
            p21 = b[1] & a[2];
        end

        //multiplication with b[2]
        always_comb
        begin
            p02 = b[2] & a[0];
            p12 = b[2] & a[1];
            p22 = b[2] & a[2];
        end

        assign y[0] = p00;

        approx_ha ha_1
        (
            .a(p10),
            .b(p01),
            .s(y[1]),
            .cout(c0)
        );

        approx_fa fa_1
        (
            .a(~p20),
            .b(p11),
            .cin(c0),
            .s(y2_tmp),
            .cout(c1)
        );

        approx_ha ha_2
        (
            .a(y2_tmp),
            .b(~p22),
            .s(y[2])
            .cout(c2)
        );

        approx_fa fa_2
        (
            .a(~p21),
            .b(~p12),
            .cin(1'b1),
            .s(y3_tmp1),
            .cout(c3)
        );

        approx_ha ha_3
        (
            .a(c1),
            .b(c2),
            .s(y3_tmp2),
            .cout(c4)
        );

        approx_ha ha_4
        (
            .a(y3_tmp1),
            .b(y3_tmp2),
            .s(y[3]),
            .cout(c5)
        );

        approx_fa fa_3
        (
            .a(p22),
            .b(c3),
            .cin(c4),
            .s(y4_tmp),
            .cout(c6)
        );

        approx_ha ha_5
        (
            .a(y4_tmp),
            .b(c5),
            .s(y[4]),
            .cout(c7)
        );

        approx_ha ha_6
        (
            .a(c6),
            .b(c7),
            .s(y5_tmp),
            .cout()
        );
        
        assign y[5] = ~y5_tmp;
    end
    else if (NUM_BITS == 2)
    begin
        logic p00, p10;
        logic p01, p11;

        logic c0, c1;

        //multiplication with b[0]
        always_comb
        begin
            p00 = b[0] & a[0];
            p10 = b[0] & a[1];
        end

        //multiplication with b[1]
        always_comb
        begin
            p01 = b[1] & a[0];
            p11 = b[1] & a[1];
        end

        assign y[0] = p00;

        approx_ha ha_1
        (
            .a(~p10),
            .b(~p01),
            .s(y[1]),
            .cout(c0)
        );

        approx_fa fa_1
        (
            .a(1'b1),
            .b(p11),
            .cin(c0),
            .s(y[2]),
            .cout(c1)
        );

        assign y[3] = ~c1;
    end
    else
    begin
        assert(0);
    end
endgenerate

endmodule : approx_mult