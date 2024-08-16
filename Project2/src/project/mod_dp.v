module mod_dp(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input save_A,       // From control unit, to load A into TEMP
    input subtract,     // From control unit, to subtract B from TEMP
    output reg [31:0] result,
    output less_than_B  // To control unit, indicates TEMP < B
);

reg [31:0] TEMP;

// Load A into TEMP or subtract B from TEMP
always @(posedge clk) begin
    if (save_A) begin
        TEMP <= A;
    end
    else if (subtract) begin
        TEMP <= TEMP - B;
    end
end

// Determine if TEMP < B
assign less_than_B = TEMP < B;

// Assign result when subtraction is complete
always @(posedge clk) begin
    if (less_than_B) begin
        result <= TEMP;
    end
end

endmodule
