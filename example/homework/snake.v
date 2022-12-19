module snake (clock, reset, turn, display);
    input clock, reset;
    input [3:0] switch;
    output [7:0] trun;
    output [7:0] display;

    reg [3:0] switch;
    reg [17:0] first, second, third, fourth;  // 第一個、第二個、第三個、第四個
    reg [1:0] direction;  // 方向陣列
    reg [2:0] pillar;  // 柱 0:無, 1: 超出, 2~3: 由上而下, 4: 超出
    reg [4:0] column;  // 欄 0:無, 1~16: 由左到右, default: don't care
    reg [4:0] beam_of_roof;  // 梁 0: 無, 1:超出, 2~16: 由左到右, 17:超出, default: don't care
    reg [2:0] row;  // 行 0 無 1~3 由上而下

    reg [7:0] turn;
    reg [7:0] display;
    reg [27:0] diver, diver250;
    reg clock_10hz, clock_250hz;

    // always@(posedge clock) begin
    //     if(reset || diver == 1000000000) begin
    //         diver = 0;
    //     end else begin
    //         diver = diver + 1;
    //     end
    // end
    //
    // always @ (diver) begin
    //     if (diver < 500000000) begin
    //         clock_10hz = 1;
    //     end else begin
    //         clock_10hz = 0;
    //     end
    // end
    //
    // always@(posedge clock) begin
    //     if(reset || diver250 == 400000) begin
    //         diver250 = 0;
    //     end else begin
    //         diver250 = diver250 + 1;
    //     end
    // end
    //
    // always @ (*) begin
    //     if (diver250 < 200000) begin
    //         clock_250hz = 1;
    //     end else begin
    //         clock_250hz = 0;
    //     end
    // end

    always @ (clock) begin
        clock_10hz = clock;
        clock_250hz = clock;
    end

    // 七段顯示器輪播
    always @ (posedge clock_250hz) begin
        if (turn == 0 || reset) begin
            turn = 8'b00000001;
        end else begin
            turn = turn * 2;
            case (turn)
                8'b00000001: begin
                    if (15 < first[7:3] <= 16 || 15 < second[7:3] <= 16
                            || 15 < third[7:3] <= 16 || 15 < fourth[7:3] <= 16
                            ) begin
                        // 控制顯示燈亮起來
                    end else if (15 <= first[12:8] <= 16 || 15 <= second[12:8] <= 16
                            || 15 <= third[12:8] <= 16 || 15 <= fourth[12:8] <= 16
                            ) begin
                        // 控制顯示燈亮起來

                    end
                end
                8'b00000010: begin display = ; end
                8'b00000100: begin display = ; end
                8'b00001000: begin display = ; end
                8'b00010000: begin display = ; end
                8'b00100000: begin display = ; end
                8'b01000000: begin display = ; end
                8'b10000000: begin display = ; end
            endcase
        end
    end

    // 柱欄梁行
    always @ (posedge clock_10hz) begin
        if (~reset) begin
            first = {2'b11, 2'b000, 5'b00000, 5'b00110, 2'b010};
            second = {2'b11, 2'b000, 5'b00000, 5'b00101, 2'b010};
            third = {2'b11, 2'b000, 5'b00000, 5'b00100, 2'b010};
            fourth = {2'b11, 2'b000, 5'b00000, 5'b00011, 2'b010};

        end else if (first[15:8] == 0 && first[7:0] > 0) begin
            // 確定身體為水平

            if (first[17:16] == 3) begin
                // 身體往右

                if (direction == 0) begin
                    // 如果控制往上
                    first[15:0] = {
                      first[2:0],  //
                      first[7:3],
                      8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 3) begin
                    // 如果控制往下
                    first[15:0] = {
                      first[2:0],  //
                      first[7:3] + 1,
                      8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 2) begin
                    // 如果控制往右
                    first[15:0] = {
                      8'b00000000  // 將直向資料歸零
                      first[12:8] + 1,  //
                      first[2:0],
                    };
                end

            end else if (first[17:16] == 2) begin
                // 身體往左

                if (direction == 1) begin
                    // 如果控制往上
                    first[15:0] = {
                      first[2:0] - 1,  //
                      first[7:3],
                      8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 3) begin
                    // 如果控制往下
                    first[15:0] = {
                      first[2:0] + 1,
                      first[7:3] - 1,  //
                      8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 2) begin
                    // 如果控制往左
                    first[15:0] = {
                      8'b00000000  // 將直向資料歸零
                      first[7:3] - 1,
                      first[2:0],  //
                    };
                end

        end else if (first[15:8] > 0 && first[7:0] == 0) begin
            // 確定身體為垂直

            if (first[17:16] == 0) begin
                // 身體往上

                if (direction == 0) begin
                    // 如果控制往上
                    first[15:0] = {
                        first[15:13] - 1,
                        first[12:8],  //
                        8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 3) begin
                    // 如果控制往右
                    first[15:0] = {
                        8'b00000000  // 將直向資料歸零
                        first[12:8] + 1,  //
                        first[15:13] - 1,
                    };

                end else if (direction == 2) begin
                    // 如果控制往左
                    first[15:0] = {
                        8'b00000000  // 將直向資料歸零
                        first[12:8] - 1,  //
                        first[15:13] - 1
                    };
                end

            end else if (first[17:16] == 1) begin
                // 身體往下

                if (direction == 1) begin
                    // 如果控制往下
                    first[15:0] = {
                        first[15:13] + 1,
                        first[12:8],  //
                        8'b00000000  // 將橫向資料歸零
                    };

                end else if (direction == 3) begin
                    // 如果控制往右
                    first[15:0] = {
                        8'b00000000  // 將直向資料歸零
                        first[12:8] + 1,  //
                        first[15:13],
                    };

                end else if (direction == 2) begin
                    // 如果控制往左，且第一個身體往下，另確定資料為垂直，做往左移動動作
                    first[15:0] = {
                        8'b00000000  // 將直向資料歸零
                        first[12:8] - 1,  //
                        first[15:13],
                    };

                end
            end
        end
        second = first;
        third = second;
        fourth = third;

    end

    // 死亡
    always @ (posedge clock_10hz) begin
        pillar = first[15:13];  // 柱 0:無, 1: 超出, 2~3: 由上而下, 4: 超出
        column = first[12:8];  // 欄 0:無, 1~16: 由左到右, default: don't care
        beam_of_roof = first[7:3];  // 梁 0: 無, 1:超出, 2~16: 由左到右, 17:超出, default: don't care
        row = first[2:0];  // 行 0 無 1~3 由上而下

        if (pillar < 1 or pillar > 4) begin

        end else if (beam_of_roof < 1 or beam_of_roof > 17) begin

        end
    end

    // 方向陣列循環複製
    always @ (posedge clock_10hz) begin
        if (~reset || switch == 0) begin
            first[17:16] = first[17:16];
        end else begin
            first[17:16] = direction;
        end
    end

    // 方向控制
    always @ (posedge clock_10hz) begin
        if (~reset) begin
            direction = 3;
        end else begin
            case (switch)
                2'b1000: direction = 0;
                2'b0100: direction = 1;
                2'b1010: direction = 2;
                2'b1001: direction = 3;
                default: 0;
            endcase
        end
    end

endmodule // snake
