/*
Notlar:
*Pattern yakalayıcı-TestBench
* Author:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab6_q1_a_m ();
logic clk, reset, A, tick;
lab6_q1_a_m uut0(.clk(clk), .reset(reset), .A(A), .tick(tick) );
initial begin // simülasyon durana kadan her 10 ns clk değişir.
clk=0;
forever #10 clk = ~clk ;
end
initial begin
reset = 0;
A = 0; #150; A=1; #150; // 4clk cycle'dan sonra tick = 1 kontrolü yapılır.
reset = 1; #50; // tick = 1 iken reset 1 olunca tick = 0 ; state = s0; olduğu gözlendi.
$stop;
end
endmodule
