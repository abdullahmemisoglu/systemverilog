/* //SAYFA 1
* tb_lab7_q2_a_m.sv
Notlar:
ELM235 2020 Bahar Lab7 - Problem 2 Testbench
*Hafıza oluşturma ve okuma-TestBench
* Hazirlayan:
* Abdullah MEMISOGLU
*/
`timescale 1ns/1ps
module tb_lab7_q2_a_m ();
logic [4:0] rs1,rs2;
logic [31:0] rs1_data,rs2_data;
//logic [2:0] addr;
lab7_q2_a_m uut1(
.rs1(rs1), .rs2(rs2), .rs1_data(rs1_data), .rs2_data(rs2_data)
);
initial begin //SAYFA 2
rs1 = 5'b00000; rs2 = 5'b00100; #10;
rs1 = 5'b00001; rs2 = 5'b00101; #10;
rs1 = 5'b00010; rs2 = 5'b00110; #10;
rs1 = 5'b00011; rs2 = 5'b00111; #10;
/*addr = 3'b000; #10;
addr = 3'b001; #10;
addr = 3'b010; #10;
addr = 3'b011; #10;
addr = 3'b100; #10;
addr = 3'b101; #10;
addr = 3'b110; #10;
addr = 3'b111; #10;
*/
$stop;
end
endmodule
