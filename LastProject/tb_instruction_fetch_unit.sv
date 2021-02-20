/*
Notlar:
*Instruction Fetch Ünitesi - TestBench
* Author: Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab8_q1_a_m ();
logic clk, reset,we;
logic [31:0] pc,pc_new;
logic pc_update;
lab8_q1_a_m uud
(clk,reset,pc,pc_update,pc_new);
always
begin
clk=0; #5 clk=1 ; #5 ;
end
initial begin
pc_new=32'd5;
we=1'b0; pc_update=1'b0; #50 ;
we=1'b0; pc_update=1'b1; #50 ;
we=1'b1; pc_update=1'b0; #50 ;
we=1'b1; pc_update=1'b1; #50 ;
$stop ;
end
initial begin
reset=1'b0 ; #5 ;
reset=1'b1;
end
memory uum (clk,reset,we,pc);
module memory(
input logic clk, reset,
input logic we,
input logic [ 31 : 0 ] addr, waddr,
input logic [ 15 : 0 ] din,
output logic [ 31 : 0 ] komut
);
logic [ 0 : 63 ] mem [ 0 : 31 ];
initial begin
$readmemb ( "fib.txt" , mem);
end
assign addr={2'b0,pc[29:0]};
assign komut=mem[addr];
endmodule
endmodule
