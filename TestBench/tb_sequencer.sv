/*
Notlar:
*Sıralayıcı-TestBench
* Author:
* Abdullah MEMISOGLU
*/
module tb_lab6_q2_a_m ();
logic clk, reset, y, mesgul, baslat;
logic [4:0] D;
lab6_q2_a_m uut2(.clk(clk), .reset(reset), .y(y), .mesgul(mesgul), .baslat(baslat), .D(D) );
initial begin
clk = 0;
forever #10 clk = ~clk ;
end
initial begin
reset = 1; baslat = 0; #20;
reset = 0; baslat = 1; #20;
baslat = 0; #150;
end
initial begin
D = 5'b01101 ;
end
initial begin
#400;
$stop;
end
endmodule
