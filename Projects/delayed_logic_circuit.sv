/* lab_3_q_2.sv
* Author:
* Abdullah MEMISOGLU
* Notlar:
* Y = NOT A and B denkleminin gerçeklemesi
* Basit bir devrede gecikme simülasyonu
*/
`timescale 1ns/1ps
module lab3_q_2 (
input logic a, b,
output logic y
);
assign #3 n1 = ~a ;
assign #5 y = n1 & b ;
endmodule
