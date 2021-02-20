/*
* Author:
* Abdullah MEMISOGLU
* Y = NOT A and B denkleminin
* gerçeklemesi
*/
`timescale 1ns/1ps
module lab3_q_1 (
input logic a, b,
output logic y
);
assign y = ~a & b;
endmodule
