`timescale 1 ns / 1 ps
module my_mod_alu_testbench ();

	reg clk;
	reg reset;
	reg start;
 
reg [31:0] in1;
reg [31:0] in2;
reg [2:0] sel;

	wire [31:0] result;
	wire done;
	
	alu32 alu1( clk,reset,start,in1,in2,sel,result,done);
	
initial sel=3'b111;
// Clock generation
initial clk = 0;
always #0.004 clk = ~clk; // Generate a clock

// Test sequence
initial begin
	// Initialize signals
	reset = 1; start = 0;
	in1 = 0; in2 = 0;
	// Apply reset
	#0.008;
	reset = 0;
        
	// Start the operation
	#0.008;
	start = 1;
	in1 = 20;  // Dividend
	in2 = 3;   // Divisor

	// Wait for the operation to complete
	wait (done == 1);
	#0.008; // Wait some more time to see the result stable

	// Display results
	$display("Result of %0d %% %0d is %0d", in1, in2, result);

	// Finish the simulation
	$display("Test completed.");
end
endmodule