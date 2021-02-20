/* //SAYFA 1
* tb_memisoglu.sv
* Hazirlayan:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_memisoglu ();
logic clk, reset,we;
logic [31:0] pc,pc_new;
logic pc_update;
lab8_q1_a_m_fetch uud (clk,reset,pc,pc_update,pc_new);
always
begin
clk=0; #5 clk=1 ; #5 ;
end
initial begin //SAYFA2
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
memory uumem (pc);
module memory(
input logic [ 31 : 0 ] addr,
//input logic [ 31: 0] pc,
output logic [ 31 : 0 ] komut
);
memisoglu uum(.clk(clk), .reset(reset), .komut(komut));
logic [ 0 : 63 ] mem [ 0 : 31 ];
initial begin
$readmemb ( "fib.txt" , mem);
end
assign addr={2'b0,pc[29:0]};
assign komut=mem[addr];
endmodule
endmodule
