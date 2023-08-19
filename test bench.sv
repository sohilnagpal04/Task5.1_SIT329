module up_down_counter_tb;
    reg clk, reset, up, down;
    wire [2:0] count;

    up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .up(up),
        .down(down),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        up = 0;
        down = 0;
        #10 reset = 0;
        #20 up = 1;
        #20 up = 0;
        #20 down = 1;
        #20 down = 0;

        // Display the count value in simulation for each test case
        #100 $display("Test Case 1 - Count: %b", count);

        // Additional test cases
        #20 reset = 1;
        #20 reset = 0;
        #20 down = 1;
        #20 down = 0;
        #20 up = 1;
        #20 up = 0;
        #20 reset = 1;
        #20 reset = 0;
        #20 down = 1;
        #20 down = 0;

        // Display the count value for the additional test cases
        #100 $display("Test Case 2 - Count: %b", count);
        #100 $display("Test Case 3 - Count: %b", count);
        #100 $display("Test Case 4 - Count: %b", count);
        #100 $display("Test Case 5 - Count: %b", count);

        #100 $finish;
    end
endmodule
