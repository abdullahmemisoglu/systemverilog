/* 
*Notlar:
*YUKARI SERBEST SAYICI DEVRESİ TASARLAMA-TestBench
* Author:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab5_q1_a_m ();
logic clk,reset,en;
logic [4:0] psc ;
logic [4:0] counter;
logic tick ;
lab5_q1_a_m uut(.clk(clk), .reset(reset), .en(en), .psc(psc) ,.counter(counter), .tick(tick) );
//Burada clk için simulasyon durana kadar degismesi komutu verildi.(10ns)
initial begin
clk = 0;
forever #10 clk = ~clk ;
end
initial begin
for(int i = 0 ; i<4 ; i++)
begin
if(i == 0 ) 
begin
psc = 5'b11111; #300; // ilk 300ns de reset ve en değişimi kontrol edildi.
end
psc = $random ; #640;//20ns de bir clk rising edge olacak ve en aktif ise artacak
/* 5 bit counter 2'5 = 32 kadar sayacak 32*20 = 640 ns bekleyerek tum counter degerleri
*bitmeden psc degismemesi saglandi.
*/
end
end
initial begin
reset = 0; en = 0; #100 ; //00 İlk 400ns reset ve en işlevleri kontrol edildi.
reset = 1; #100 ; //01
en = 1 ; reset = 0 ; #100 ; //10
reset = 1; //11
end
initial begin
#2860; $stop; //tum psc degerleri bekleme suresi kadar.(640*4+300)
//burada bekleme suresini uzun alıp son psc icin iki kez tick degerini gozlemledik.
end
endmodule
