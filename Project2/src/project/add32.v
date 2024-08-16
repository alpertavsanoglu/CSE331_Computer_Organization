module add32(
	input [31:0]A,
	input [31:0]B,
	input c_in,
	output c_out,
	output [31:0]R);
	
	wire [31:0]c;

	full_adder fa31(A[0],B[0],c_in,c[0],R[0]);
	full_adder fa30(A[1],B[1],c[0],c[1],R[1]);
	full_adder fa29(A[2],B[2],c[1],c[2],R[2]);
	full_adder fa28(A[3],B[3],c[2],c[3],R[3]);
	full_adder fa27(A[4],B[4],c[3],c[4],R[4]);
	full_adder fa26(A[5],B[5],c[4],c[5],R[5]);
	full_adder fa25(A[6],B[6],c[5],c[6],R[6]);
	full_adder fa24(A[7],B[7],c[6],c[7],R[7]);
	full_adder fa23(A[8],B[8],c[7],c[8],R[8]);
	full_adder fa22(A[9],B[9],c[8],c[9],R[9]);
	full_adder fa21(A[10],B[10],c[9],c[10],R[10]);
	full_adder fa20(A[11],B[11],c[10],c[11],R[11]);
	full_adder fa19(A[12],B[12],c[11],c[12],R[12]);
	full_adder fa18(A[13],B[13],c[12],c[13],R[13]);
	full_adder fa17(A[14],B[14],c[13],c[14],R[14]);
	full_adder fa16(A[15],B[15],c[14],c[15],R[15]);
	full_adder fa15(A[16],B[16],c[15],c[16],R[16]);
	full_adder fa14(A[17],B[17],c[16],c[17],R[17]);
	full_adder fa13(A[18],B[18],c[17],c[18],R[18]);
	full_adder fa12(A[19],B[19],c[18],c[19],R[19]);
	full_adder fa11(A[20],B[20],c[19],c[20],R[20]);
	full_adder fa10(A[21],B[21],c[20],c[21],R[21]);
	full_adder fa9(A[22],B[22],c[21],c[22],R[22]);
	full_adder fa8(A[23],B[23],c[22],c[23],R[23]);
	full_adder fa7(A[24],B[24],c[23],c[24],R[24]);
	full_adder fa6(A[25],B[25],c[24],c[25],R[25]);
	full_adder fa5(A[26],B[26],c[25],c[26],R[26]);
	full_adder fa4(A[27],B[27],c[26],c[27],R[27]);
	full_adder fa3(A[28],B[28],c[27],c[28],R[28]);
	full_adder fa2(A[29],B[29],c[28],c[29],R[29]);
	full_adder fa1(A[30],B[30],c[29],c[30],R[30]);
	full_adder fa0(A[31],B[31],c[30],c_out,R[31]);

	
endmodule