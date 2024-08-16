module full_adder(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  wire x,y,z;
 
// instantiate building blocks of full adder 
  half_adder h1(.a(a),.b(b),.s(x),.c(y));
  half_adder h2(.a(x),.b(cin),.s(sum),.c(z));
  or o1(cout,y,z);
endmodule