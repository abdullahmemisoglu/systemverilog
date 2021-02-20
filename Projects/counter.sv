/* 
*
* Author:
* Abdullah MEMISOGLU
*
* Notlar:
* YUKARI SERBEST SAYICI DEVRESİ TASARLAMA
*/
module lab5_q1_a_m(
input logic clk,reset,en,
input logic [4:0] psc ,
output tick ) ;
logic [4:0] counter ;
always_ff @(posedge clk, negedge reset)
begin
if(!reset)
counter <= 5'b0;
else if (en) // counter'ı 1 arttırmak için en aktif olmalı
counter <= counter + 1'b1;
end
assign tick = ( psc == counter ) ? 1'b1 : 1'b0 ;
endmodule
