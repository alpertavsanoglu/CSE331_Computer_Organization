`timescale 1 ps / 1 ps
module or32_testbench();

	reg [31:0] inp1,inp2;
	wire [31:0] result;
	
	
	or32 ortest(.a(inp1),.b(inp2),.out(result));
	
	initial
		begin
			#0 inp1 = 32'd47; inp2 = 32'd25;
			#50 $display ("OR Test1 in Decimal -> %0d or %0d = %0d", inp1, inp2, result);
			
			inp1 = 32'b0100_0010_0010_0010_0000_0010_0010_0101;
			inp2 = 32'b0100_0000_0000_0010_0000_0010_1000_1010;
			#50;
			$display("OR Test2 in Binary \ninput1 = %32b\ninput2 = %32b\nresult = %32b",inp1,inp2,result);
		end
endmodule