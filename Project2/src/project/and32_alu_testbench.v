`timescale 1 ns / 1 ps
module and32_alu_testbench ();

	reg clk;
	reg reset;
	reg start;
 
reg [31:0] in1;
reg [31:0] in2;
reg [2:0] sel;

	wire [31:0] result;
	wire done;
	
	alu32 aluand( clk,reset,start,in1,in2,sel,result,done);


	initial begin
	#0 in1=32'b0100_0010_0010_0010_0000_0010_0010_0101; in2=32'b0100_0000_0000_0010_0000_0010_1000_1010; clk=0;reset=0;start=0;sel=3'b000;
	#5 $display ("sel: %3b\na:      %32b \nb:      %32b \nresult: %32b",sel,in1,in2,result);
	end
	endmodule