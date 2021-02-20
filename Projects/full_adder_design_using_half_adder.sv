
// half_adder oluşturma modülü
module half_adder
  (output logic c_out, s,
  input logic x, y);
  assign {c_out,s} = x + y;
endmodule

//half_adder kullanarak full_adder oluşturma
//modülü
module full_adder
  (output logic c_out, s,
  input logic c_in, x, y);
  logic carry1, carry2, sum1,sum2;
  half_adder m1(.c_out(carry1), .s(sum1), .x(x),
  .y(y) );
  half_adder m2(.c_out(carry2), .s(sum2), .x(c_in),
  .y(sum1) );
  assign s = sum2 ;
  assign c_out = carry1 | carry2;
endmodule

* Hazırlayan:
* Abdullah MEMİŞOĞLU
* Notlar:
* Lab4 Problem 2 Adder Tasarımı
*/
module lab4_q2_a_m (
  input logic [4:0] x,y,
  input logic c_in,
  output logic c_out,
  output logic [4:0] s );
  full_adder n1( .c_out(wire1), .s(s[0]), .x(x[0]) , .y(y[0]) ,
  .c_in(c_in) );
  full_adder n2( .c_out(wire2), .s(s[1]), .x(x[1]) , .y(y[1]) ,
  .c_in(wire1) );
  full_adder n3( .c_out(wire3), .s(s[2]), .x(x[2]), .y(y[2]) ,
  .c_in(wire2) );
  full_adder n4( .c_out(wire4), .s(s[3]), .x(x[3]) , .y(y[3]) ,
  .c_in(wire3) );
  full_adder n5( .c_out(c_out), .s(s[4]), .x(x[4]) , .y(y[4]) ,
  .c_in(wire4) );
endmodule
