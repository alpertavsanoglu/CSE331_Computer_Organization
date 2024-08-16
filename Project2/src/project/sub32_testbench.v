`timescale 1 ps / 1 ps
module sub32_testbench();

	reg [31:0] inp1,inp2;
	wire [31:0] result;
	
	
	sub32 subtest(.A(inp1),.B(inp2),.R(result));
	
	initial
		begin

			#0; inp1 = 32'b0000_0000_0000_0000_0000_0000_0000_0011; inp2 = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
			
			#50;$display("XOR Test2 in Binary \ninput1 = %32b\ninput2 = %32b\nresult = %32b",inp1,inp2,result);
		end
endmodule