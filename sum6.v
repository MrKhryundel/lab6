`timescale 1ns / 1ps

module my_sum (Ain, Bin, Ci, Sout, Co);
  input [5:0] Ain, Bin;
  input Ci;
  output [5:0] Sout;
  output Co;

  wire [5:0] C;

  bitsum sum0(Ain[0], Bin[0], Ci, Sout[0], C[0]);
  bitsum sum1(Ain[1], Bin[1], C[0], Sout[1], C[1]);
  bitsum sum2(Ain[2], Bin[2], C[1], Sout[2], C[2]);
  bitsum sum3(Ain[3], Bin[3], C[2], Sout[3], C[3]);
  bitsum sum4(Ain[4], Bin[4], C[3], Sout[4], C[4]);
  bitsum sum5(Ain[5], Bin[5], C[4], Sout[5], Co);

endmodule

module bitsum (A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;

  wire Res, c1, c2;

  xor(Res, A, B);
  xor(S, Res, Cin);
  and(c1, A, B);
  and(c2, Res, Cin);
  or(Cout, c1, c2);
endmodule

