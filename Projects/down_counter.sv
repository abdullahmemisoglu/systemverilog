/* lab5_q2_a_m.sv //SAYFA1
*
* Hazirlayan:
* Abdullah MEMISOGLU
*
* Notlar:
* ELM235 2020 Bahar Lab5 - Problem 2
* Yavaşlatılabilir aşağı sayıcı tasarımı
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

module lab5_q2_a_m_ (
input logic [4:0] psc,
input logic clk,reset,en ,
input logic [15:0] reload ,
output logic [15:0] counter ,
output logic done,tick );
lab5_q1_a_m uut0(.clk(clk) , .reset(reset) , .en(en) , .tick(tick) , .psc(psc) );
// Yorum satırlarında verilen maddeler föyde bizden yerine getirilmesi istenen görevlerdir.
always_ff @ (posedge clk , negedge reset) //MADDE_2
begin
  if(!reset)
  counter <= 16'b0 ;
  else if(en)
  if (tick)
  counter <= counter - 16'b1 ; //MADDE _ 3
  else if(counter == 16'b0)
  begin
  done <= 1; // MADDE_7
  counter <= reload; //MADDE _ 8
  end
end
endmodule
