
`timescale 1ns/1ps

module T;
    reg [1:0] D1 = 2'b00;
    reg [1:0] D2 = 2'b00;
    wire Eq;


    eq UUT (
        .D1(D1),
        .D2(D2),
        .Eq(Eq));

    initial
    begin
      #1600 // Final time:  1600 ns
        $stop;
    end

    initial begin
        // -------------  Current Time:  100ns
        #100;
        D2 = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        D2 = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        D2 = 2'b11;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        D1 = 2'b01;
        D2 = 2'b00;
        // -------------------------------------
        // -------------  Current Time:  500ns
        #100;
        D2 = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #100;
        D2 = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  700ns
        #100;
        D2 = 2'b11;
        // -------------------------------------
        // -------------  Current Time:  800ns
        #100;
        D1 = 2'b10;
        D2 = 2'b00;
        // -------------------------------------
        // -------------  Current Time:  900ns
        #100;
        D2 = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  1000ns
        #100;
        D2 = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  1100ns
        #100;
        D2 = 2'b11;
        // -------------------------------------
        // -------------  Current Time:  1200ns
        #100;
        D1 = 2'b11;
        D2 = 2'b00;
        // -------------------------------------
        // -------------  Current Time:  1300ns
        #100;
        D2 = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  1400ns
        #100;
        D2 = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  1500ns
        #100;
        D2 = 2'b11;
        // -------------------------------------
        // -------------  Current Time:  1600ns
        #100;
        D2 = 2'b0X;
        // -------------------------------------
        // -------------  Current Time:  1800ns
        #200;
        D1 = 2'b0X;
        D2 = 2'b01;
    end

endmodule

