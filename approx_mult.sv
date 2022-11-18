module approx_mult
(
    input logic signed [7:0] a,
    input logic signed [7:0] b,
    output logic signed [15:0] y 
);

logic p[7:0][7:0];
logic c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28;
logic c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39, c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56;
logic y2_tmp, y3_tmp1, y3_tmp2, y4_tmp1, y4_tmp2, y4_tmp3, y5_tmp1, y5_tmp2, y5_tmp3, y5_tmp4;
logic y6_tmp1, y6_tmp2, y6_tmp3, y6_tmp4, y6_tmp5;
logic y7_tmp1, y7_tmp2, y7_tmp3, y7_tmp4, y7_tmp5, y7_tmp6;
logic y8_tmp1, y8_tmp2, y8_tmp3, y8_tmp4, y8_tmp5, y8_tmp6;
logic y9_tmp1, y9_tmp2, y9_tmp3, y9_tmp4, y9_tmp5;
logic y10_tmp1, y10_tmp2, y10_tmp3, y10_tmp4;
logic y11_tmp1, y11_tmp2, y11_tmp3;
logic y12_tmp1, y12_tmp2;
logic y13_tmp;

for (int i = 0; i < 8; i++)
begin
    for(int j = 0; j < 8; j++)
    begin
        p[i][j] = a[i] & b[j];
    end
end

//y[0]
assign y[0] = p[0][0];

//y[1]
approx_ha ha1
(
    .a(p[0][1]),
    .b(p[1][0]),
    .cout(c1),
    .s(y[1])
);

//y[2]
approx_fa fa1
(
    .a(p[2][0]),
    .b(p[1][1]),
    .cin(c1),
    .cout(c2),
    .s(y2_tmp)
);

approx_ha ha2
(
    .a(y2_tmp),
    .b(p[0][2]),
    .cout(c3),
    .s(y[2])
);

//y[3]
approx_fa fa2
(
    .a(c2),
    .b(p[3][0]),
    .cin(c3),
    .cout(c4),
    .s(y3_tmp1)
);

approx_fa fa3
(
    .a(p[2][1]),
    .b(p[1][2]),
    .cin(p[0][3]),
    .cout(c5),
    .s(y3_tmp2)
);

approx_ha ha3
(
    .a(y3_tmp1),
    .b(y3_tmp2),
    .cout(c6),
    .s(y[3])
);

//y[4]
approx_fa fa4
(
    .a(c4),
    .b(c5),
    .cin(c6),
    .cout(c7),
    .s(y4_tmp1)
);

approx_fa fa5
(
    .a(p[4][0]),
    .b(p[3][1]),
    .cin(p[2][3]),
    .cout(c8),
    .s(y4_tmp2)
);

approx_fa fa6
(
    .a(y4_tmp2),
    .b(p[1][3]),
    .cin(p[0][4]),
    .cout(c9),
    .s(y4_tmp3)
);

approx_ha ha4
(
    .a(y4_tmp1),
    .b(y4_tmp3),
    .cout(c10),
    .s(y[4])
);

//y[5]
approx_fa fa7
(
    .a(c7),
    .b(c8),
    .cin(c9),
    .cout(c11),
    .s(y5_tmp1)
);

approx_fa fa8
(
    .a(c10),
    .b(p[5][0]),
    .cin(p[4][1]),
    .cout(c12),
    .s(y5_tmp2)
);

approx_fa fa9
(
    .a(p[3][2]),
    .b(p[2][3]),
    .cin(p[1][4]),
    .cout(c13),
    .s(y5_tmp3)
);

approx_fa fa10
(
    .a(y5_tmp2),
    .b(y5_tmp3),
    .cin(p[0][5]),
    .cout(c14),
    .s(y5_tmp4)
);

approx_ha ha5
(
    .a(y5_tmp1),
    .b(y5_tmp4),
    .cout(c15),
    .s(y[5])
);

//y[6]
approx_fa fa11
(
    .a(c11),
    .b(c12),
    .cin(c13),
    .cout(c16),
    .s(y6_tmp1)
);

approx_fa fa12
(
    .a(c14),
    .b(c15),
    .cin(p[6][0]),
    .cout(c17),
    .s(y6_tmp2)
);

approx_fa fa13
(
    .a(p[5][1]),
    .b(p[4][2]),
    .cin(p[3][3]),
    .cout(c18),
    .s(y6_tmp3)
);

approx_fa fa14
(
    .a(p[2][4]),
    .b(p[1][5]),
    .cin(p[0][6]),
    .cout(c19),
    .s(y6_tmp4)
);

approx_fa fa15
(
    .a(y6_tmp2),
    .b(y6_tmp3),
    .cin(y6_tmp4),
    .cout(c20),
    .s(y6_tmp5)
);

approx_ha ha6
(
    .a(y6_tmp1),
    .b(y6_tmp5),
    .cout(c21),
    .s(y[6])
);

//y[7]
approx_fa fa16
(
    .a(c16),
    .b(c17),
    .cin(c18),
    .cout(c22),
    .s(y7_tmp1)
);

approx_fa fa17
(
    .a(c19),
    .b(c20),
    .cin(c21),
    .cout(c23),
    .s(y7_tmp2)
);

approx_fa fa18
(
    .a(~p[7][0]),
    .b(p[6][1]),
    .cin(p[5][2]),
    .cout(c24),
    .s(y7_tmp3)
);

approx_fa fa19
(
    .a(p[4][3]),
    .b(p[3][4]),
    .cin(p[2][5]),
    .cout(c25),
    .s(y7_tmp4)
);

approx_fa fa20
(
    .a(y7_tmp4),
    .b(p[1][6]),
    .cin(~p[0][7]),
    .cout(c26),
    .s(y7_tmp5)
);

approx_fa fa21
(
    .a(y7_tmp1),
    .b(y7_tmp2),
    .cin(y7_tmp3),
    .cout(c27),
    .s(y7_tmp6)
);

approx_ha ha7
(
    .a(y7_tmp6),
    .b(y7_tmp5),
    .cout(c28),
    .s(y[7])
);

//y[8]
approx_fa fa22
(
    .a(c22),
    .b(c23),
    .cin(c24),
    .cout(c29),
    .s(y8_tmp1)
);

approx_fa fa23
(
    .a(c25),
    .b(c26),
    .cin(c27),
    .cout(c30),
    .s(y8_tmp2)
);

approx_fa fa24
(
    .a(c28),
    .b(1),
    .cin(~p[7][1]),
    .cout(c31),
    .s(y8_tmp3)
);

approx_fa fa25
(
    .a(p[6][2]),
    .b(p[5][3]),
    .cin(p[4][4]),
    .cout(c32),
    .s(y8_tmp4)
);

approx_fa fa26
(
    .a(p[3][5]),
    .b(p[2][6]),
    .cin(~p[1][7]),
    .cout(c33),
    .s(y8_tmp5)
);

approx_fa fa27
(
    .a(y8_tmp1),
    .b(y8_tmp2),
    .cin(y8_tmp3),
    .cout(c34),
    .s(y8_tmp6)
);

approx_fa fa28
(
    .a(y8_tmp6),
    .b(y8_tmp4),
    .cin(y8_tmp5),
    .cout(c34),
    .s(y[8])
);

//y[9]
approx_fa fa29
(
    .a(c29),
    .b(c30),
    .cin(c31),
    .cout(c36),
    .s(y9_tmp1)
);

approx_fa fa30
(
    .a(c32),
    .b(c33),
    .cin(c34),
    .cout(c37),
    .s(y9_tmp2)
);

approx_fa fa31
(
    .a(c35),
    .b(~p[7][2]),
    .cin(p[6][3]),
    .cout(c38),
    .s(y9_tmp3)
);

approx_fa fa32
(
    .a(p[5][4]),
    .b(p[4][5]),
    .cin(p[3][6]),
    .cout(c39),
    .s(y9_tmp4)
);

approx_fa fa33
(
    .a(y9_tmp3),
    .b(y9_tmp4),
    .cin(~p[2][7]),
    .cout(c40),
    .s(y9_tmp5)
);

approx_fa fa34
(
    .a(y9_tmp1),
    .b(y9_tmp2),
    .cin(y9_tmp5),
    .cout(c41),
    .s(y[9])
);

//y[10]
approx_fa fa35
(
    .a(c36),
    .b(c37),
    .cin(c38),
    .cout(c42),
    .s(y10_tmp1)
);

approx_fa fa36
(
    .a(c39),
    .b(c40),
    .cin(c41),
    .cout(c43),
    .s(y10_tmp2)
);

approx_fa fa37
(
    .a(~p[7][3]),
    .b(p[6][4]),
    .cin(p[5][5]),
    .cout(c44),
    .s(y10_tmp3)
);

approx_fa fa38
(
    .a(y10_tmp3),
    .b(p[4][6]),
    .cin(~p[3][7]),
    .cout(c45),
    .s(y10_tmp4)
);

approx_fa fa39
(
    .a(y10_tmp1),
    .b(y10_tmp2),
    .cin(y10_tmp4)
    .cout(c46),
    .s(y[10])
);

//y[11]
approx_fa fa40
(
    .a(c42),
    .b(c43),
    .cin(c44),
    .cout(c47),
    .s(y11_tmp1)
);

approx_fa fa41
(
    .a(c45),
    .b(c46),
    .cin(~p[7][4]),
    .cout(c48),
    .s(y11_tmp2)
);

approx_fa fa42
(
    .a(p[6][5]),
    .b(p[5][6]),
    .cin(~p[4][7]),
    .cout(c49),
    .s(y11_tmp3)
);

approx_fa fa43
(
    .a(y11_tmp1),
    .b(y11_tmp2),
    .cin(y11_tmp3),
    .cout(c50),
    .s(y[11])
);

//y[12]
approx_fa fa44
(
    .a(c47),
    .b(c48),
    .cin(c49),
    .cout(c51),
    .s(y12_tmp1)
);

approx_fa fa45
(
    .a(c50),
    .b(~p[7][5]),
    .cin(p[6][6]),
    .cout(c52),
    .s(y12_tmp2)
);

approx_fa fa46
(
    .a(y12_tmp1),
    .b(y12_tmp2),
    .cin(~p[5][7]),
    .cout(c53),
    .s(y[12])
);

//y[13]
approx_fa fa47
(
    .a(c51),
    .b(c52),
    .cin(c53),
    .cout(c54),
    .s(y13_tmp)
);

approx_fa fa48
(
    .a(y13_tmp),
    .b(~p[7][6]),
    .cin(~p[6][7]),
    .cout(c55),
    .s(y[13])
);

//y[14]
approx_fa fa49
(
    .a(c54),
    .b(c55),
    .cin(p[7][7]),
    .cout(c56),
    .s(y[14])
);

//y[15]
assign y[15] = ~c56;

endmodule : approx_mult