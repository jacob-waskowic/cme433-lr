`timescale 1ns / 1ps
module nmed_tb;

    logic signed [7:0] a, b, c, d, e, f;
    logic signed [31:0] y, y_exact;

    approx_sop uut
    (
        .a,
        .b,
        .c,
        .d,
        .e,
        .f,
        .y
    );

    exact_sop gold
    (
        .a,
        .b,
        .c,
        .d,
        .e,
        .f,
        .y(y_exact)
    );
    
    logic clk = 0;
    always
    begin
        #5 clk = ~clk;
    end

    logic [47:0] cnt = 0;
    always @ (posedge clk)
        cnt = $random % (2 ** 47); 

    assign a = cnt[47:40];
    assign b = cnt[39:32];
    assign c = cnt[31:24];
    assign d = cnt[23:16];
    assign e = cnt[15:8];
    assign f = cnt[7:0];

    int fd;

    initial
    begin
        fd = $fopen("./values.txt", "w");

        #10000000

        $fclose(fd);
        $finish;
    end

    always @ (posedge clk)
    begin
        $fdisplay(fd, "%0d,%0d,%0d,%0d", a, b, y, y_exact);
    end


endmodule : nmed_tb