module mux8x1(a, b, c, d, e, f, g, h, S,out);

	input a, b, c, d, e, f, g, h;
	input [2:0] S;

	output out;
	
	wire sNot0;
	wire sNot1;
	wire sNot2;
	
	wire w1;
	wire w2;
	wire w3;
	wire w4;
	wire w5;
	wire w6;
	wire w7;
	wire w8;
	
	not (sNot2,S[2]);
	not (sNot1,S[1]);
	not (sNot0,S[0]);
	
	
	and (w1,sNot2,sNot1,sNot0,a);
	and (w2,S[2],sNot1,sNot0,b);
	and (w3,sNot2,S[1],sNot0,c);
	and (w4,S[2],S[1],sNot0,d);
	and (w5,sNot2,sNot1,S[0],e);
	and (w6,S[2],sNot1,S[0],f);
	and (w7,sNot2,S[1],S[0],g);
	and (w8,S[2],S[1],S[0],h);
	or (out,w1,w2,w3,w4,w5,w6,w7,w8);
	
endmodule