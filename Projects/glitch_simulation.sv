/*
* Author:
* Abdullah MEMISOGLU
* Glitch simülasyonu
*/
`timescale 1ns/1ps
module lab3_q_3 (
input logic a, b, c, d,
output logic y
);
assign #2 nb = ~b ;
assign #2 n1 = a & nb & c ;
assign #2 nc = ~c ;
assign #2 n2 = nc & d ;
assign #2 y = n1 | n2 ;
endmodule
