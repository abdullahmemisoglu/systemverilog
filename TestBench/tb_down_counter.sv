/*
Notlar:
*Yavaşlatılabilir aşağı sayıcı tasarımı-TestBench
* Author:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab5_q2_a_m ();
logic clk,reset,en ;
logic [4:0] psc ;
logic [15:0] reload,counter;
logic tick ,done ;
lab5_q2_a_m uut1(.clk(clk) , .reset(reset) , .reload(reload) , .done(done) , .counter(counter) , .en(en) , .tick(tick) , .psc(psc)
);
//Bu testbench kodu paylaşılan kod ile birebir uyumludur.
always
begin
clk = 0 ;#5; clk = 1 ; #5;
end
initial
begin
en = 0 ; reset = 0; #20; reset = 1 ; #20 ; en = 1;
end
initial
begin
psc <= 5'h1 ;
reload <= 16'hA;
#1000;
$stop ;
end
endmodule
