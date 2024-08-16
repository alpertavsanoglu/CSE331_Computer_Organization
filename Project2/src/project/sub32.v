module sub32(A, B, R);
	input [31:0] A;
	input [31:0] B;
	output [31:0] R;


	wire [31:0]notB;
	wire [31:0]compB;
	wire tCout,tCout2;
	localparam zero = 1'b0;

	

	not not31(notB[31],B[31]);
	not not30(notB[30],B[30]);
	not not29(notB[29],B[29]);
	not not28(notB[28],B[28]);
	not not27(notB[27],B[27]);
	not not26(notB[26],B[26]);
	not not25(notB[25],B[25]);
	not not24(notB[24],B[24]);
	not not23(notB[23],B[23]);
	not not22(notB[22],B[22]);
	not not21(notB[21],B[21]);
	not not20(notB[20],B[20]);
	not not19(notB[19],B[19]);
	not not18(notB[18],B[18]);
	not not17(notB[17],B[17]);
	not not16(notB[16],B[16]);
	not not15(notB[15],B[15]);
	not not14(notB[14],B[14]);
	not not13(notB[13],B[13]);
	not not12(notB[12],B[12]);
	not not11(notB[11],B[11]);
	not not10(notB[10],B[10]);
	not not9(notB[9],B[9]);
	not not8(notB[8],B[8]);
	not not7(notB[7],B[7]);
	not not6(notB[6],B[6]);
	not not5(notB[5],B[5]);
	not not4(notB[4],B[4]);
	not not3(notB[3],B[3]);
	not not2(notB[2],B[2]);
	not not1(notB[1],B[1]);
	not not0(notB[0],B[0]);
	
	add32 compp1(notB,32'b1,zero,tCout,compB);
	add32 result(A,compB,zero,tCout2,R);
	
	
endmodule