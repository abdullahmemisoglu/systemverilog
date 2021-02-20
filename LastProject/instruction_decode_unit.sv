/* 
* Author:
* Abdullah MEMISOGLU
*/
module lab7_decode (
input clk,reset,
input logic we,
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] func,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [4:0] rd,
output logic [31:0] rd_data,
output logic [31:0] imm,
output logic hata
);
assign opcode = komut[6:0] ;//opcode her tip
için ortak bölgede
lab7_decode_mem dut(.clk(clk), .reset(reset),
.we(we), .waddr(rd), .rs1(rs1), .rs2(rs2),
.din(rd_data) );
always_comb //SAYFA2
begin
hata = 0;

  if(opcode == 7'b0000001) //R TİPİ
    begin
    rs1 = komut[19:15];
    rs2 = komut[24:20];
    rd = komut[11:7] ;
    func =
    {komut[30],komut[14],komut[13],komut[12]};
    imm = 32'b0;
    end
  
  else if(opcode == 7'b0000011) //I TİPİ
    begin
    rs1 = komut[19:15];
    rd = komut[11:7] ;
    func = {1'b0,komut[14],komut[13],komut[12] };
    imm = {20'b0 , komut[31:20] };
    rs2 = 5'b0;//diğer değişkenler 0
    end
    
  else if(opcode == 7'b0000111) //U TİPİ
    begin
    rd = komut[11:7] ;
    imm = {12'b0 , komut[31:12] };
    rs1 = 5'b0;//diğer değişkenler 0
    rs2 = 5'b0;
    func = 4'b0;
    end

  else if(opcode == 7'b0001111) //B TİPİ
    begin
    rs1 = komut[19:15];
    rs2 = komut[24:20];
    func =
    {1'b0,komut[14],komut[13],komut[12]};
    imm =
    {19'b0,komut[31:25],komut[11:7],1'b0};
    rd = 5'b0;//diğer değişkenler 0
    end
  
  else
    begin
    hata = 1;
    rs1 = 5'b0;
    rs2 = 5'b0;
    func = 4'b0;
    imm = 32'b0;
    rd = 5'b0;
    end
end
endmodule

