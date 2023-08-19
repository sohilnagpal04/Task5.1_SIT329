module up_down_counter (
    input wire clk,       // Clock input
    input wire reset,     // Reset input
    input wire up,        // Up control input
    input wire down,      // Down control input
    output wire [2:0] count  // 3-bit count output
);

    reg [2:0] count_reg;   // 3-bit count register

    always @(posedge clk or posedge reset) begin
        if (reset)
            count_reg <= 3'b000;  // Reset the counter to 0
        else if (up)
            count_reg <= count_reg + 1;  // Increment count
        else if (down)
            count_reg <= count_reg - 1;  // Decrement count
    end

    assign count = count_reg;  // Assign the count value to the output

endmodule
