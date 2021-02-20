/* /
Notlar:
ELM235 2020 Bahar Lab7 - Problem 1
*Komut ayırıcı
* Author:
* Abdullah MEMISOGLU
*/
module lab7_q1_a_m ( //SAYFA2
input logic clk,
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] aluop,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [4:0] rd,
output logic [31:0] imm,
output logic hata
);


logic [31:0] komutreg;
logic [6:0] 






;
logic [3:0] aluopreg;
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;
logic [4:0] rdreg;
logic [31:0] immreg;
logic hatareg;


generate 



always_ff @(posedge clk)
begin


komutreg <= komut;
opcode <= opcodereg;
rs1 <= rs1reg;
rs2 <= rs2reg;
rd <= rdreg;
imm <= immreg;
hata <= hatareg;
aluop <= aluopreg;
end


endgenerate


assign opcodereg = komutreg[6:0];
assign rs1_datareg = 32'b0;
assign rs2_datareg = 32'b0;



always_comb 
  begin
  hatareg = 0;
  if(opcodereg == 7'b0000001)
    begin
    rs2reg = {komutreg[24:20]};
    rs1reg = {komutreg[19:15]};
    aluopreg = {komutreg[30],komutreg[14:12]};
    rdreg = {komutreg[11:7]};
    immreg = 32'b0;
    end
  if(opcodereg == 7'b0000011)
    begin
    immreg = {20'b0 ,komutreg[31:20]};
    rs1reg = {komutreg[19:15]};
    rs2reg = 5'b0;
    aluopreg = {1'b0,komutreg[14:12]};
    rdreg = {komutreg[11:7]};
    end
always_comb //SAYFA4
  begin
  hatareg = 0;
  if(opcodereg == 7'b0000001)
    begin
    rs2reg = {komutreg[24:20]};
    rs1reg = {komutreg[19:15]};
    aluopreg = {komutreg[30],komutreg[14:12]};
    rdreg = {komutreg[11:7]};
    immreg = 32'b0;
    end
  if(opcodereg == 7'b0000011)
    begin
    immreg = {20'b0 ,komutreg[31:20]};
    rs1reg = {komutreg[19:15]};
    rs2reg = 5'b0;
    aluopreg = {1'b0,komutreg[14:12]};
    rdreg = {komutreg[11:7]};
    end
  else 
    begin
    hatareg = 1;
    rs1reg = komutreg[19:15];
    rs2reg = komutreg[24:20];
    aluopreg = {1'b0,komutreg[14:12]};
    immreg =
    {19'b0,komutreg[31:25],komutreg[11:7],1'b0};
    rdreg = 5'b0;
    end
  if(opcodereg == 7'b0000111) //SAYFA 5
    begin
    immreg = {12'b0,komutreg[31:12]};
    rdreg = {komutreg[11:7]};
    rs1reg = 5'b0;
    rs2reg = 5'b0;
    aluopreg = 4'b0;
    end
  if(opcodereg == 7'b0001111)
    begin
    immreg = {19'b0,komutreg[31:25],komutreg[11:7],1'b0};
    rs2reg = {komutreg[24:20]};
    rs1reg = {komutreg[19:15]};
    aluopreg = komutreg[14:12];
    rdreg = 5'b0;
    end
