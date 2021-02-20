/* 
Notlar:
ELM235 2020 Bahar Lab7 - Problem 1 Testbench
*Komut Ayırıcı -TestBench
* Author:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab7_q1_a_m ();
logic clk;
logic [4:0] rs1 ;
logic [4:0] rs2 ;
logic [31:0] komut;
logic [6:0] opcode;
logic [3:0] aluop ;
logic [4:0] rd ;
logic [31:0] imm ;
logic [31:0] rs1_data;
logic [31:0] rs2_data;
logic hata;
lab7_q1_a_m udt0( 
.clk(clk), .rs1(rs1), .rs2(rs2), .komut(komut),
.opcode(opcode), .aluop(aluop), .rd(rd),
.imm(imm), .rs1_data(rs1_data),
.rs2_data(rs2_data), .hata(hata)
);
always begin
clk = 0; #5; clk = 1; #5;
end
initial begin 
// Komutlar ayrıldıkları bölgelerde değişkenlere atanmaktadır.
//örneğin 2. komutun ilk 12 biti imm'ye atandı, '_' ile ayrıldı.
komut = 32'b0_0_1101_00001_00110_111_00000_0000001;#10;//R TİPİ
komut = 32'b0_1_0001_00011_00101_101_00111_0000001;#10;//R TİPİ
komut = 32'b1_0_0100_00101_00011_001_11000_0000001;#10;//R TİPİ
komut = 32'b111001111000_00100_000_11111_0000011;#10;//I TİPİ
komut = 32'b001101111100_00010_110_00011_0000011;#10;//I TİPİ
komut = 32'b001011001110_00011_011_11100_0000011;#10;//I TİPİ
komut = 32'b00000000001111111111_00011_0000111;#10;//U TİPİ
komut = 32'b00001110001111110001_11011_0000111;#10;//U TİPİ
komut = 32'b11100000001100100011_10101_0000111;#10;//U TİPİ
komut = 32'b0000000_00101_00111_111_00011_0001111 ;#10;// B TİPİ
komut = 32'b0101110_00111_01000_001_10111_0001111 ;#10;// B TİPİ
komut = 32'b0000000_00011_00101_111_01011_0001111 ;#10;// B TİPİ
$stop;
end
endmodule
