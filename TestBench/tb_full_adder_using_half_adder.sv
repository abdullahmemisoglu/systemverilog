/* 
* Author:
* Abdullah MEMİŞOĞLU
* Notlar:
* Lab4 Problem 2 SystemVerilog TestBench Kod
*/
`timescale 1ns/1ps
module tb_lab4_q2_a_m ();
logic [4:0] x , y ;
logic c_in , c_out;
logic [4:0] s;
lab4_q2_a_m uut (.c_out(c_out) , .s(s), .c_in(c_in) ,
.x(x) , .y(y) );
initial begin
c_in = 0;
x = 5'b00000 ; y = 5'b00000 ; #10 ;
x = 5'b00001 ; y = 5'b00001 ; #10 ;
x = 5'b00011 ; y = 5'b00011 ; #10 ;
x = 5'b00111 ; y = 5'b00111 ; #10 ;
x = 5'b01111 ; y = 5'b01111 ; #10 ;
x = 5'b01110 ; y = 5'b01110 ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
x = $random ; y = $random ; #10 ;
$stop;
end
endmodule
