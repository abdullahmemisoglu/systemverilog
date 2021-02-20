/* 
Notlar:
*Modül birleştirme
* Author:
* Abdullah MEMISOGLU
*/
module lab7_q3 ( 
input logic clk,
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] aluop,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [4:0] rd
output logic [31:0] imm,
output logic hata
);
lab7_q2_a_m ddt (.addr(addr), .rs1(rs1), .rs2(rs2), .rs1_data(rs1_data), .rs2_data(rs2_data) );
assign opcode = komut[6:0] ;//opcode her tip için ortak bölgede
always_comb
begin
hata = 0;


  if(opcode == 7'b0000001) //R TİPİ
    begin
    rs1 = komut[19:15];
    rs2 = komut[24:20];
    rd = komut[11:7] ;
    aluop = {komut[30],komut[14],komut[13],komut[12]};
    imm = 32'b0;
    end
    
  else if(opcode == 7'b0000011) //I TİPİ
    begin
    rs1 = komut[19:15];
    rd = komut[11:7] ;
    aluop = {1'b0,komut[14],komut[13],komut[12] };
    imm = {20'b0 , komut[31:20] };
    rs2 = 5'b0;//diğer değişkenler 0
    end


  else if(opcode == 7'b0000111) //U TİPİ
    begin
    rd = komut[11:7] ;
    imm = {12'b0 , komut[31:12] };
    rs1 = 5'b0;//diğer değişkenler 0
    rs2 = 5'b0;
    aluop = 4'b0;
    end


  else if(opcode == 7'b0001111) //B TİPİ
    begin
    rs1 = komut[19:15];
    rs2 = komut[24:20];
    aluop = {1'b0,komut[14],komut[13],komut[12]};
    imm = {19'b0,komut[31:25],komut[11:7],1'b0};
    rd = 5'b0;//diğer değişkenler 0
    
    end

  else
    begin
    hata = 1;
    rs1 = 5'b0;
    rs2 = 5'b0;
    aluop = 4'b0;
    imm = 32'b0;
    rd = 5'b0;
    end
end
endmodule

module lab7_q2_a_m (
//input logic [2:0] addr,
input logic [4:0] rs1,
input logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data
);
//mem adında 32-bit uzunluğunda 32(2^5) elemanlı hafıza oluştur.
logic [31:0] mem [0:31] ;
initial begin
$readmemh ("reg_image.txt" , mem);
end
assign rs1_data = mem[rs1];
assign rs2_data = mem[rs2];
/*3. problemde modül olarak çağırdığımızda
* rs1 ve rs2 değerlerine göre atamaları yapacak
*/
//assign rs1_data = mem[addr];
//assign rs2_data = mem[addr];
endmodule
