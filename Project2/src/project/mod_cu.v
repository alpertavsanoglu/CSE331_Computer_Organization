module mod_cu(
    input clk,
    input reset,
    input start,
    input less_than_B,  // check TEMP < B
    output reg save_A,  // A into TEMP	->dp
    output reg subtract, //  subtract B from TEMP ->dp
    output reg done      // mod operation is complete
);

// FSM states
localparam [1:0] 
    first_s = 2'b00,
    secod_s = 2'b01,
    third_s = 2'b10,
    final_s = 2'b11;

reg [1:0] state;

// State transition logic
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= first_s;
    else begin
        case (state)
            first_s: state <= start ? secod_s : first_s;
            secod_s: state <= third_s;
            third_s: state <= less_than_B ? final_s : third_s;
            final_s: state <= first_s;
        endcase
    end
end

// Output logic
always @(*) begin
    save_A = (state == secod_s);
    subtract = (state == third_s) && !less_than_B;
    done = (state == final_s);
end

endmodule
