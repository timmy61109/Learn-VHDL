
`timescale 1ns/1ps

module T;
    wire [3:0] S;
    wire Co;
    reg [3:0] A = 4'b0000;
    reg [3:0] B = 4'b0000;
    reg Ci = 1'b0;


    adder4 UUT (
        .S(S),
        .Co(Co),
        .A(A),
        .B(B),
        .Ci(Ci));

    integer TX_FILE = 0;
    integer TX_ERROR = 0;
    
    initial
    begin
      #1600 // Final time:  1600 ns
        $stop;
    end

    initial begin
        // -------------  Current Time:  100ns
        #100;
        Ci = 1'b1;
        A = 4'b1000;
        B = 4'b1100;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        Ci = 1'b0;
        A = 4'b1010;
        B = 4'b1001;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        Ci = 1'b1;
        A = 4'b0110;
        B = 4'b0001;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        Ci = 1'b0;
        A = 4'b1111;
        B = 4'b1110;
        // -------------------------------------
        // -------------  Current Time:  500ns
        #100;
        Ci = 1'b1;
        A = 4'b1010;
        B = 4'b0111;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #100;
        Ci = 1'b0;
        A = 4'b0000;
        B = 4'b1001;
        // -------------------------------------
        // -------------  Current Time:  700ns
        #100;
        Ci = 1'b1;
        A = 4'b1001;
        B = 4'b1010;
        // -------------------------------------
        // -------------  Current Time:  800ns
        #100;
        Ci = 1'b0;
        A = 4'b0100;
        B = 4'b0011;
        // -------------------------------------
        // -------------  Current Time:  900ns
        #100;
        Ci = 1'b1;
        A = 4'b0101;
        B = 4'b0110;
        // -------------------------------------
        // -------------  Current Time:  1000ns
        #100;
        Ci = 1'b0;
        A = 4'b1001;
        B = 4'b1100;
        // -------------------------------------
        // -------------  Current Time:  1100ns
        #100;
        Ci = 1'b1;
        A = 4'b0000;
        B = 4'b0001;
        // -------------------------------------
        // -------------  Current Time:  1200ns
        #100;
        Ci = 1'b0;
        A = 4'b0011;
        B = 4'b1000;
        // -------------------------------------
        // -------------  Current Time:  1300ns
        #100;
        Ci = 1'b1;
        A = 4'b1111;
        B = 4'b1011;
        // -------------------------------------
        // -------------  Current Time:  1400ns
        #100;
        Ci = 1'b0;
        A = 4'b0110;
        B = 4'b0101;
        // -------------------------------------
        // -------------  Current Time:  1500ns
        #100;
        Ci = 1'b1;
        A = 4'b1111;
        B = 4'b1111;
    end

endmodule

