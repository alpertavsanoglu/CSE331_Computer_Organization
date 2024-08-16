module mod(
    input clk,
    input reset,
    input start,
    input [31:0] A,
    input [31:0] B,
    output [31:0] result,
    output done
);

wire save_A, subtract, less_than_B;

// Instantiate the control unit
mod_cu control_unit(.clk(clk),.reset(reset),.start(start),.less_than_B(less_than_B),.save_A(save_A),.subtract(subtract),.done(done));

// Instantiate the datapath
mod_dp datapath(.clk(clk),.A(A),.B(B),.save_A(save_A),.subtract(subtract),.result(result),.less_than_B(less_than_B));

endmodule
