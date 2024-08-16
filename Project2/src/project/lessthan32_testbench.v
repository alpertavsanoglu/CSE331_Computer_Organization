`timescale 1 ps / 1 ps
module lessthan32_testbench();

	reg [31:0] inp1,inp2;
	wire [31:0] result;
	
	
	lessthan32 lessthantest(.a(inp1),.b(inp2),.out(result));
	
	initial
		begin
			#0; inp1 = 32'b0100_0010_0010_0010_0000_0010_0010_0101; inp2 = 32'b0100_0000_0000_0010_0000_0010_1000_1010;
			
			#50;$display("LessThan Test1 in Binary \ninput1 = %32b\ninput2 = %32b\nresult = %1b",inp1,inp2,result[0]);

		end
endmodule