/* //SAYFA 1
* lab7_q2_a_m.sv
Notlar:
ELM235 2020 Bahar Lab7 - Problem 2
*Hafıza oluşturma ve okuma
* Hazirlayan:
* Abdullah MEMISOGLU
*/
module lab7_q2_a_m (
//input logic [2:0] addr,
input logic [4:0] rs1,
input logic [4:0] rs2,
input logic [2:0] addr,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data
);
//mem adında 32-bit uzunluğunda 32(2^5) elemanlı hafıza oluştur.
logic [31:0] mem [0:31] ;
initial begin
$readmemh ("reg_image.txt" , mem);
end
assign rs1_data = mem[rs1]; //SAYFA 2
assign rs2_data = mem[rs2];
/*3. problemde modül olarak çağırdığımızda
* rs1 ve rs2 değerlerine göre atamaları yapacak
*/
//assign rs1_data = mem[addr];
//assign rs2_data = mem[addr];
endmodule
