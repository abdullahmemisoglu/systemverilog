/* 
* Author:
* Abdullah MEMISOGLU
*/
module lab7_decode_mem(
//input logic [2:0] addr,
input logic clk,reset,
input logic we,
input logic [4:0] waddr,
input logic [31:0] din,
input logic [4:0] rs1,
input logic [4:0] rs2,
input logic [31:0] addr,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data
);
//mem adında 32-bit uzunluğunda 32(2^5) elemanlı
hafıza oluştur.
logic [63:0] mem [0:31] ;
integer i;
always_ff @(posedge clk)
  if (!reset) for (i=0; i<32; i=i+1) mem[i] <= 32'b0;
  else if (we) mem[waddr] <= din;
assign rs1_data = mem[rs1];
assign rs2_data = mem[rs2];
/*3. problemde modül olarak çağırdığımızda
* rs1 ve rs2 değerlerine göre atamaları yapacak
*/
endmodule
