
`timescale 1ns/1ps
module lab3_q_4
(
input logic [7:0] in, output logic [3:0] out
);
assign out = (in[7] == 1'b1) ? 4'b0001: 
(in[6] == 1'b1) ? 4'b0011: 
(in[5] == 1'b1) ? 4'b0010: 
(in[4] == 1'b1) ? 4'b0110: 
(in[3] == 1'b1) ? 4'b0111: 
(in[2] == 1'b1) ? 4'b0101: 
(in[1] == 1'b1) ? 4'b0100: 4'b1100 ;
endmodule
