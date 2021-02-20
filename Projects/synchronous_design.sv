/* 
* Author:
* Abdullah MEMİŞOĞLU
* Notlar:
* Senkron Tasarım ve Zamanlama
*/
module lab4_qu4_a_m (
  input logic [31:0] a,b,
  input logic [3:0] op ,
  input logic clk ,
  output logic [31:0] res ,hata ,
  output logic v , z , n , c , cout
) ;
logic [31:0] a_reg , b_reg , res_reg , hata_reg;
logic [3:0] op_reg; //SAYFA 2
logic v_reg , z_reg , n_reg , c_reg , cout_reg ;
always_ff @ (posedge clk )
begin
b_reg <= b ;
a_reg <= a ;
op_reg <= op ;
end
assign hata_reg = 32'dx;
always @ ("*")
begin
if(a_reg[31] == 0 && b_reg[31] == 0 && res_reg [31] == 1 || a_reg[31] == 1 && b_reg[31] == 1 &&
res_reg[31] == 0)
v_reg = 1 ;
else
v_reg = 0;
if(res_reg == 32'd0)
z_reg = 1;
else
z_reg = 0;
if (res_reg [31] == 1)
n_reg = 1 ;
else
n_reg = 0;
if (cout_reg == 1 && op_reg ==4'b0000 || cout_reg == 1 && op_reg == 4'b1000 || cout_reg == 1 &&
op_reg == 4'b0001)
c_reg = 1;
else
c_reg = 0;
end
always @ ("*") //SAYFA 3
begin
if(op_reg == 4'b0000)
{cout_reg,res_reg} = a_reg + b_reg ;
else if (op_reg == 4'b1000)
{cout_reg,res_reg} = a_reg - b_reg ;
else if (op_reg == 4'b0001)
{cout_reg,res_reg} = a_reg << (b_reg[0] + 2*b_reg[1] + 4*b_reg[2] + 8*b_reg[3]
+ 16*b_reg[4]);
else if (op_reg == 4'b0011)
res_reg = (a_reg>b_reg) ? 32'b1 : 32'b0 ; //UNSIGNED
else if (op_reg == 4'b0010) //SIGNED
res_reg = ( $signed(a_reg) > $signed(b_reg) ) ? 32'b1 : 32'b0 ;
else if (op_reg == 4'b0100)
res_reg = a_reg^b_reg ;
else if (op_reg == 4'b0101)
{res_reg,cout_reg} = a_reg >> (b_reg[0] + 2*b_reg[1] + 4*b_reg[2] + 8*b_reg[3]
+ 16*b_reg[4]);
else if (op_reg == 4'b1101)
res_reg = a_reg>>> (b_reg[0] + 2*b_reg[1] + 4*b_reg[2] + 8*b_reg[3] +
16*b_reg[4]);
else if (op_reg == 4'b0110)
res_reg = a_reg | b_reg ;
else if (op_reg == 4'b0111)
res_reg = a_reg & b_reg ;
else
res_reg = hata_reg ;
end
always_ff @(posedge clk ) //SAYFA 4
begin
res <= res_reg ;
hata <= hata_reg ;
v <= v_reg ;
c <= c_reg ;
z <= z_reg ;
n <= n_reg ;
cout <= cout_reg ;
//2'3,2^4 tarzı üs alma işlemleri ' veya ^ operatörleri ile gerçekleştirilemedi yanlış sonuç alındı.
end
endmodule
