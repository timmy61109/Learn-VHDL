
`timescale 1ns/1ps

module T;
    reg Cs = 1'b1;
    reg We = 1'b1;
    reg [1:0] Addr = 2'b00;
    reg [7:0] Di = 8'b00110111;
    wire [7:0] Do;


    ram UUT (
        .Cs(Cs),
        .We(We),
        .Addr(Addr),
        .Di(Di),
        .Do(Do));

    initial
    begin
      #2000 // Final time:  2000 ns
        $stop;
    end

    initial begin
        // -------------  Current Time:  100ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        Cs = 1'b1;
        Addr = 2'b01;
        Di = 8'b01100100;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        Cs = 1'b1;
        Addr = 2'b10;
        Di = 8'b11001000;
        // -------------------------------------
        // -------------  Current Time:  500ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #100;
        Cs = 1'b1;
        Addr = 2'b11;
        Di = 8'b11111111;
        // -------------------------------------
        // -------------  Current Time:  700ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  800ns
        #100;
        Cs = 1'b1;
        // -------------------------------------
        // -------------  Current Time:  900ns
        #100;
        We = 1'b0;
        Addr = 2'b00;
        // -------------------------------------
        // -------------  Current Time:  1000ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  1100ns
        #100;
        Cs = 1'b1;
        Addr = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  1200ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  1300ns
        #100;
        Cs = 1'b1;
        Addr = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  1400ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  1500ns
        #100;
        Cs = 1'b1;
        Addr = 2'b11;
        // -------------------------------------
        // -------------  Current Time:  1600ns
        #100;
        Cs = 1'b0;
        // -------------------------------------
        // -------------  Current Time:  1700ns
        #100;
        Cs = 1'b1;
    end

endmodule

