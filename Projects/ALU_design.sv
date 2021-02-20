/* 
* Author: 
* Abdullah MEMİŞOĞLU
* Notlar:
* Lab4 Problem 3 ALU Tasarımı
*/
module lab4_q3_a_m (
input logic [31:0] a,b,
input logic [3:0] op ,
output logic [31:0] res
,hata ,
output logic v , z , n , c ,
cout
) ;
assign hata = 32'dx;
always_comb
begin
if(a[31] == 0 && b[31] == 0 && res [31] == 1 || a[31] == 1 && b[31] == 1 &&
res[31] == 0)
v = 1 ; 
else
v = 0;
if(res == 32'd0)
z = 1;
else
z = 0;
if (res [31] == 1)
n = 1 ;
else
n = 0;
if (cout == 1 && op ==4'b0000 || cout == 1 && op == 4'b1000 || cout == 1
&& op == 4'b0001)
c = 1;
else
c = 0;
end
always_comb
begin
if(op == 4'b0000) 
{cout,res} = a + b ;
else if (op == 4'b1000)
{cout,res} = a - b ;
else if (op == 4'b0001)
{cout,res} = a << (b[0] + 2*b[1] + 4*b[2] + 8*b[3] + 16*b[4]);
else if (op == 4'b0011)
res = (a>b) ? 32'b1 : 32'b0 ; //UNSIGNED
else if (op == 4'b0010) //SIGNED
res = ( $signed(a) > $signed(b) ) ? 32'b1 : 32'b0 ;
else if (op == 4'b0100)
res = a^b ;
else if (op == 4'b0101)
{res,cout} = a>> (b[0] + 2*b[1] + 4*b[2] + 8*b[3] + 16*b[4]);
else if (op == 4'b1101)
res = a>>> (b[0] + 2*b[1] + 4*b[2] + 8*b[3] + 16*b[4]);
else if (op == 4'b0110)
res = a | b ;
else if (op == 4'b0111)
res = a & b ;
else
res = hata ;
//2'3,2^4 tarzı üs alma işlemleri ' veya ^ operatörleri ile gerçekleştirilemedi yanlış sonuç alındı.Bu yüzden 1 , 2 , 4 , 8 , 16 olarak yazıldı.
end
endmodule
