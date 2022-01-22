
`timescale 1ns/1ps

module T;
    reg [3:0] A = 4'b0101;
    reg [3:0] B = 4'b1111;
    reg [3:0] C = 4'b1111;
    reg [3:0] D = 4'b0101;
    wire [7:0] S1;
    wire [7:0] S2;

    mul4 UUT (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S1(S1),
        .S2(S2));

    initial
    begin
      #1000 // Final time:  1000 ns
        $stop;
    end

    initial begin
        // -------------  Current Time:  100ns
        #100;
        A = 4'b1100;
        B = 4'b1010;
        C = 4'b0010;
        D = 4'b1001;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        A = 4'b1001;
        B = 4'b0000;
        C = 4'b1010;
        D = 4'b1000;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        A = 4'b0001;
        B = 4'b1001;
        C = 4'b1111;
        D = 4'b0111;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        A = 4'b1110;
        B = 4'b0100;
        C = 4'b0110;
        D = 4'b1111;
        // -------------------------------------
        // -------------  Current Time:  500ns
        #100;
        A = 4'b0111;
        B = 4'b0101;
        C = 4'b1100;
        D = 4'b0110;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #100;
        A = 4'b1001;
        B = 4'b1001;
        C = 4'b0001;
        D = 4'b0011;
        // -------------------------------------
        // -------------  Current Time:  700ns
        #100;
        A = 4'b1010;
        B = 4'b0000;
        C = 4'b0000;
        D = 4'b1011;
        // -------------------------------------
        // -------------  Current Time:  800ns
        #100;
        A = 4'b0011;
        B = 4'b0011;
        C = 4'b1100;
        D = 4'b0100;
        // -------------------------------------
        // -------------  Current Time:  900ns
        #100;
        A = 4'b0110;
        B = 4'b1111;
        C = 4'b0101;
        D = 4'b1101;
        // -------------------------------------
        // -------------  Current Time:  1000ns
        #100;
        A = 4'b1100;
        B = 4'b0110;
        C = 4'b1100;
        D = 4'b1001;
    end

endmodule
